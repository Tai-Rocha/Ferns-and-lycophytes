####################################################
## Ferns and lycophytes 
## Diversity analysis
## Author : Tainá Rocha
## Date: 01 April 2020
###################################################

### Library

library(vegan)
library(betapart)

### Read csv table and convert to matrix (for 5 subunites)

species_5 <- read.csv("./data/ferns_lycophytes_diversity_5.csv")
matrix_5 <- as.matrix(species_5)

barplot(matrix_5, xlab=" Tijuca Forest subunits", ylab="Number of species", ylim=c(0,250))


### Share species 5 subunites
## Read

share_species_5 <- betapart.core(species_5)

#### Read csv table and convert to matrix (for 4 subunites)


share_species_4 <- read.csv("./data/ferns_lycophiotes_betapart_share_species_4.csv")

Share_species_44 <- betapart.core(share_species_4)