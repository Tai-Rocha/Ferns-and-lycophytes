##############################
## PCA per area 
## Author: Tainá Rocha
## Date: 28 May 2020
##############################

## Librarys

library(raster)
library(dismo)

## Read and Load data

list_filest <- list.files("./data/Pedra_Gavea_Bonita_Layers/todas/", pattern = ".tif", full.names = T)

all_files <- stack(list_filest)

plot(all_files)



