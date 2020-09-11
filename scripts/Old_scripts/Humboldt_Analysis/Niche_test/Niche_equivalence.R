


library(humboldt)

list_envs <- list.files("./data/env_layers/", pattern = ".tif", full.names = T)

envs_stack <- stack(list_envs)

##load environmental variables for all sites of the study area 1 (env1). Column names should be x,y,X1,X2,...,Xn)
env1<-read.csv("./data/layers_env_bongav/env_bgav_xyvalues.csv", sep=",", dec = ".")

## load environmental variables for all sites of the study area 2 (env2). Column names should be x,y,X1,X2,...,Xn)
env2<-read.csv("./data/layers_env_tijuca/env_tijuca_xyvalues.csv", sep = ",", dec = ".") 

## remove NAs and make sure all variables are imported as numbers
#env1<-humboldt.scrub.env(env1)
#env2<-humboldt.scrub.env(env2)

##load occurrence sites for the species at study area 1 (env1). Column names should be 'sp', 'x','y'
#occ.sp1<-na.exclude(read.delim("sp1.txt",h=T,sep="\t"))

occ.sp1 <- read.csv("./data/layers_env_bongav/Bonita_Gavea_records.csv", sep = ",", dec = ".")

##load occurrence sites for the species at study area 2 (env2). Column names should be 'sp', 'x','y'
#occ.sp2<-na.exclude(read.delim("sp2.txt",h=T,sep="\t"))

occ.sp2<- read.csv("./data/layers_env_tijuca/Floresta_Tijuca_records.csv", sep = ",", dec = ".")

##convert geographic space to espace
zz<-humboldt.g2e (env1=env1, 
                 env2=env2, 
                 sp1=occ.sp1, 
                 sp2=occ.sp2, 
                 reduce.env = 0, 
                 reductype = "PCA", 
                 non.analogous.environments = "NO", 
                 env.trim= T,
                 e.var=(3:25),  
                 #col.env = e.var, 
                 trim.buffer.sp1 = 200, 
                 trim.buffer.sp2 = 200, 
                 rarefy.dist = 0.5, 
                 rarefy.units="km", 
                 env.reso=, 
                 kern.smooth = 1, 
                 #R = 1, 
                 run.silent = F
                 poverlap= T)

##store espace scores for sp1 and environments 1,2 and both environments combined output from humboldt.g2e
scores.env1<-zz$scores.env1[1:2]
scores.env2<-zz$scores.env2[1:2]
scores.env12<- rbind(zz$scores.env1[1:2],zz$scores.env2[1:2])
scores.sp1<-zz$scores.sp1[1:2]
scores.sp2<-zz$scores.sp2[1:2]

## run create a grid of Environmental Space Function
z1<- humboldt.grid.espace(scores.env12,scores.env1,scores.sp1,kern.smooth=0.5)
z2<- humboldt.grid.espace(scores.env12,scores.env2,scores.sp2,kern.smooth=0.5)

## mesure niche equivalence
niche.equiv<- humboldt.equivalence.stat(z1,z2,rep=10,kern.smooth=1, ncores=2)

