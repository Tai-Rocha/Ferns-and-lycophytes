###############################
## Species accumulation curves
## Author: Tainá Rocha
## June 2020
###############################


## Library

library(vegan)

## Load data

SAC <- read.csv("./data/Input_CAE/Input_cae_pixels.csv", sep = ",")


teste <- specaccum(SAC[2:238], method = "rarefaction", permutations = 100,
          conditioned =TRUE, gamma = "jack1")


plot(teste, ci.type="poly", col="blue", lwd=2, ci.lty=0, ci.col="lightblue")

boxplot(sp2, col="yellow", add=TRUE, pch="+")

