######################
# Estudando os pontos
#Author: Tainá Rocha
#Date: 07 May 2020
#####################

pontos <- read.csv("./data/nova/Novas_1_May/long_lat.csv", sep = ",", dec = ".")

## Library

library(raster)
library(rgeos)
library(rgdal)
library(corrplot)
library(corrgram)

### Load, List, Stack 
dados <- list.files(path = "./data/Layers/Present_1970_200_version_2.1", pattern = ".tif", full.names=TRUE)
biovars <- stack(dados)

cropp <- raster("./data/Layers/bio1.tif")
### Crop
# Mask Crop for atlantic forest
masked <- mask(x = biovars, mask = cropp)
plot(masked)

cropped_biovars<- crop(x = masked, y = extent(cropp))
plot(cropped_biovars)