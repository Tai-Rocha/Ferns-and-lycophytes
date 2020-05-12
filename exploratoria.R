######################
# Estudando os pontos
#Author: Tainá Rocha
#Date: 07 May 2020
#####################

## Library

library(raster)
library(rgeos)
library(rgdal)
library(ggplot2)
library(corrplot)
library(corrgram)
library(tidyr)
library(dplyr)

pontos <- read.csv("./data/Novas_1_May/long_lat.csv", sep = ",", dec = ".")

# remover registros duplicados
dups.all <- duplicated(pontos[, c('longitude', 'latitude')])
pontos_final <- pontos[!dups.all, ]

write.csv(pontos, "./data/ferns_lyco_novo_no_duplicates.csv")

### Load, List, Stack 
dados <- list.files(path = "./data/Layers/Present_1970_200_version_2.1", pattern = ".tif", full.names=TRUE)
biovars <- stack(dados)

cropp <- raster("./data/Layers/bio1.tif")

### Crop
# Mask Crop for atlantic forest
cropped_biovars<- crop(x = biovars, y = extent(cropp))
plot(cropped_biovars)
#####


##### Extract values from point (require a file in format long lat respectively to use extract funtion)


# Extract values from point
values_coord <- extract(cropped_biovars, pontos_final[,-1], method='simple', df=T)

## Write a table

values <-write.csv(values_coord, "./data/values_coord.csv")


###############################################################

values <- read.csv("./data/values_coord.csv", sep = ",", dec = ".")
####################################################################



mtcars <- read.csv("./data/mtcars.csv")

boxplot_values <- read.csv("./data/values_coord.csv.csv")

for (i in 1:ncol(values_coord)) {
  png(file = paste("var_", i, ".png", sep=""))
  boxplot(values_coord[, i] ~ grps)
  dev.off()
}

mtcars %>%
  select(gear, mpg, disp:qsec) %>%
  gather(Measure, Value, -gear) %>%
  ggplot(aes(x = factor(gear)
             , y = Value)) +
  geom_boxplot() +
  facet_wrap(~Measure
             , scales = "free_y")


(boxplot_values) %>%
  select(all_of(boxplot_values[2:20])) %>%
  gather(Measure, Value, -boxplot_values) %>%
  ggplot(aes(x = factor(boxplot_values)
             , y = Value)) +
  geom_boxplot() +
  facet_wrap(~Measure
             , scales = "free_y")











###### Altitude Brasil 

altitude_brasil <- raster("./data/layers/raw_layers/altitude_inpe_br.asc")
plot(altitude_brasil)

# Extract values from point
altbr_values_coord <- extract(altitude_brasil, long_lat, method='simple', df=T)

write.csv(altbr_values_coord, "./data/altbrasil_in_coord.csv")

boxplot(altbr_values_coord[,2], col="light blue", main="Altitude")



