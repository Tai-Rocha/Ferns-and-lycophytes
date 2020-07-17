####################################################
## Ferns and lycophytes 
## Morisita analysis
## Author : Tainá Rocha
## Date: 01 April 2020
###################################################

# Library
library(vegan)

### Read input matrix 5 subunites

ferns_lycophytes_5 <- read.csv("./data/ferns_lycophiotes_input_morisita_5.csv")
ferns_licophytes_morisita_5 <- ferns_lycophytes_5 [,-1]


## Calculates the Morisita index of dispersion, standardized index values, and the so called clumpedness and uniform indices.

ferns_lycophytes_morisita_55 <- dispindmorisita(ferns_licophytes_morisita_5, unique.rm = FALSE, crit = 0.05, na.rm = FALSE)

write.csv(ferns_lycophytes_morisita_55, "./results/ferns_lycophiotes_input_morisita_results_5_subunites.csv", sep = "")



### Read input matrix 4 subunites

ferns_lycophytes_4 <- read.csv("./data/ferns_lycophiotes_input_morisita_4.csv")
ferns_licophytes_morisita_4 <- ferns_lycophytes_4 [,-1]

## Calculates the Morisita index of dispersion, standardized index values, and the so called clumpedness and uniform indices.

ferns_lycophytes_morisita_44 <- dispindmorisita(ferns_licophytes_morisita_4, unique.rm = FALSE, crit = 0.05, na.rm = FALSE)
write.csv(ferns_lycophytes_morisita_44, "./results/ferns_lycophiotes_input_morisita_results_4_subunites.csv", sep = "")
