####################################################
## Ferns and lycophytes 
## Cluster analysis in subunites of Tijuca Forest
## Author : Tainá Rocha
## Date: 01 April 2020
###################################################

# Library
library(pvclust)


#################### Clusters with 5  subunites

## Read matrix of 256 species in 5 subunites

ferns_licophytes_5<- read.csv("./data/ferns_lycophites_pvclust_input_5_subunites.csv")
ferns_licophytes_pvclus_5 <- ferns_licophytes_5 [,-1]

## Cluster analysis

cluster.upgma.jac_5 <-pvclust(ferns_licophytes_pvclus_5, method.hclust ="average", method.dist = "binary", nboot=1000)

plot(cluster.upgma.jac_5, print.pv=TRUE, print.num=FALSE, float=0.01,
     col.pv=c(2,3,8), cex.pv=0.8, font.pv=NULL, col=NULL, cex=NULL,
     font=NULL, lty=NULL, lwd=NULL, main="", sub=NULL, xlab=NULL)


#################### Clusters with 4  subunites

## Read matrix of 256 species in 4 subunites

ferns_licophytes_4<- read.csv("./data/ferns_lycophites_pvclust_input_4_subunites.csv")
ferns_licophytes_pvclus_4 <- ferns_licophytes_4 [,-1]

## Cluster analysis

cluster.upgma.jac_4 <-pvclust(ferns_licophytes_pvclus_4, method.hclust ="average", method.dist = "binary", nboot=1000)

plot(cluster.upgma.jac_4, print.pv=TRUE, print.num=FALSE, float=0.01,
     col.pv=c(2,3,8), cex.pv=0.8, font.pv=NULL, col=NULL, cex=NULL,
     font=NULL, lty=NULL, lwd=NULL, main="", sub=NULL, xlab=NULL)



