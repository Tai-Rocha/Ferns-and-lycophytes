#######################################################################################
###################################    EXAMPLE 1    ###################################
#######################################################################################
library(humboldt)
library(raster)

env_list <- list.files("./data/env_layers/", pattern = ".tif", full.names= TRUE)
env<- stack(env_list)
##load environmental variables for all sites of the study area 1 (env1). Column names should be x,y,X1,X2,...,Xn)
env1<-read.csv("./data/humboldt/env_bgav_xyvalues.csv", sep = ",", dec = ".")

## load environmental variables for all sites of the study area 2 (env2). Column names should be x,y,X1,X2,...,Xn)
env2<-read.csv("./data/humboldt/env_tijuca_xyvalues.csv",sep = ",", dec = ".") 

## remove NAs and make sure all variables are imported as numbers
#env1<-humboldt.scrub.env(env1)
#env2<-humboldt.scrub.env(env2)

##load occurrence sites for the species at study area 1 (env1). Column names should be 'sp', 'x','y'
occ.sp1<-read.csv("./data/humboldt/bonita_gavea.csv", sep = ",", dec = ".")


##load occurrence sites for the species at study area 2 (env2). Column names should be 'sp', 'x','y'. 
occ.sp2<-read.csv("./data/humboldt/floresta_tijuca.csv", sep = ",", dec = ".")

##convert geographic space to espace
#convert geographic space to espace
zz<-humboldt.g2e(env1=env1, env2=env2, sp1=occ.sp1, sp2=occ.sp2, reduce.env = 2, reductype = "STANDARD", non.analogous.environments = "NO", env.trim= T, e.var= env1[4:6], col.env = env, trim.buffer.sp1 = 1, trim.buffer.sp2 =1, rarefy.dist = 0, rarefy.units="km", env.reso=0.008333, kern.smooth = 1, R = 10, run.silent = F)

##store espace scores for sp1 and environments 1,2 and both environments combined output from humboldt.g2e
scores.env1<-zz$scores.env1[1:2]
scores.env2<-zz$scores.env2[1:2]
scores.env12<- rbind(zz$scores.env1[1:2],zz$scores.env2[1:2])
scores.sp1<-zz$scores.sp1[1:2]
scores.sp2<-zz$scores.sp2[1:2]

## run create a grid of Environmental Space Function
z1<- humboldt.grid.espace(scores.env12,scores.env1,scores.sp1,kern.smooth=1,R=100)
z2<- humboldt.grid.espace(scores.env12,scores.env2,scores.sp2,kern.smooth=1,R=100)

## mesure niche similarity
humboldt.niche.overlap(z1,z2,correct.env=F)

#######################################################################################
###################################    EXAMPLE 2    ###################################
#######################################################################################
library(humboldt)

##load environmental variables for all sites of the study area 1 (env1). Column names should be x,y,X1,X2,...,Xn)
env1<-read.delim("env1.txt",h=T,sep="\t")

## load environmental variables for all sites of the study area 2 (env2). Column names should be x,y,X1,X2,...,Xn)
env2<-read.delim("env2.txt",h=T,sep="\t") 

## remove NAs and make sure all variables are imported as numbers
env1<-humboldt.scrub.env(env1)
env2<-humboldt.scrub.env(env2)

##merge environment files
env12<-rbind(env1,env2)

##load occurrence sites for the species at study area 1. Column names should be 'sp', 'x','y'
occ.sp1<-na.exclude(read.delim("sp1.txt",h=T,sep="\t"))

##load occurrence sites for the species at study area 2. Column names should be 'sp', 'x','y'
occ.sp2<-na.exclude(read.delim("sp2.txt",h=T,sep="\t"))

##remove occurrences closer than a minimum distance to each other (remove aggregation). Setting min.dist=0 will remove no occurrence.
occ.sp1<-humboldt.occ.rarefy(in.pts=occ.sp1,colxy=2:3, rarefy.dist=40,rarefy.units="km")
occ.sp2<-humboldt.occ.rarefy(in.pts=occ.sp2,colxy=2:3, rarefy.dist=40,rarefy.units="km")

##sample environment using humboldt.sample.spp() function
## env.reso should be the resolution of the environmental data grid
occ.sp1<-na.exclude(humboldt.sample.spp(dfsp=occ.sp1,colspxy=2:3,colspkept=NULL,dfvar=env1,colvarxy=1:2,colvar="all",resolution=0.16667))
occ.sp2<-na.exclude(humboldt.sample.spp(dfsp=occ.sp2,colspxy=2:3,colspkept=NULL,dfvar=env2,colvarxy=1:2,colvar="all",resolution=0.16667))

##row weighting of environment density for PCA
row.w.1.env<-1-(nrow(env1)/nrow(env12))  # prevalence of env1
row.w.2.env<-1-(nrow(env2)/nrow(env12))  # prevalence of env2
row.w.env <-c(rep(row.w.1.env, nrow(env1)),rep(row.w.2.env, nrow(env2)),rep(0, nrow(occ.sp1)),rep(0, nrow(occ.sp2)))

##create a global dataset with all environments and species, include environmental variables e.var[x1-xN]
e.var<-c(3:21)
data.env.occ<-rbind(env1,env2,occ.sp1,occ.sp2)[e.var]

##perform PCA of environment and species 1 data which is weighted by density of environment types in both environment 1 and environment 2
pca.cal <-dudi.pca(data.env.occ,row.w = row.w.env, center = T, scale = T, scannf = F, nf = 2)

##store PCA scores for sp1 andenvironments 1,2 and both environments combined
## specific exact locations of environment and sp. data in PCA for storage
row.env1<-1:nrow(env1)
row.env2<-(nrow(env1)+1):(nrow(env1)+nrow(env2))
row.env12<-1:(nrow(env1)+nrow(env2))
row.sp1<-(nrow(env1)+nrow(env2)+1):(nrow(env1)+nrow(env2)+nrow(occ.sp1))
row.sp2<-(nrow(env1)+nrow(env2)+nrow(occ.sp1)+1):(nrow(env1)+nrow(env2)+nrow(occ.sp1)+nrow(occ.sp2))
##glob: global background dataset for the whole study area 
glob<- pca.cal$li[row.env12,]
##glob1: background for sp1
glob1<- pca.cal$li[row.env1,]
##glob2: background for sp2
glob2<- pca.cal$li[row.env2,]
##sp1: occurrence dataset
sp1<- pca.cal$li[row.sp1,]
##sp2: occurrence dataset
sp2<- pca.cal$li[row.sp2,]

## run Create a grid of Environmental Space Function
z1<- humboldt.grid.espace(glob,glob1,sp1,R=100,kern.smooth=1)
z2<- humboldt.grid.espace(glob,glob2,sp2,R=100,kern.smooth=1)
humboldt.niche.overlap(z1,z2,correct.env=F)