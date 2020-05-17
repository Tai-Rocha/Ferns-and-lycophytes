######################
# Estudando os pontos
#Author: Tainá Rocha
#Date: 07 May 2020
#####################

## Library

library(raster)



pontos <- read.csv("/home/taina/Documentos/Ferns-and-lycophytes/data/Novas_1_May/long_lat.csv", sep = ",", dec = ".")

# remover registros duplicados
dups.all <- duplicated(pontos[, c('longitude', 'latitude')])
pontos_final <- pontos[!dups.all, ]

write.csv(pontos_final, "./data/Novas_1_May/samambaia_no_duplicates.csv")


# Inverse (Extract values from point require a file in format long lat respectively to use extract funtion)
pontos_fim <-pontos_final[,-1]

pontos_fim<- rev(pontos_fim[nrow(pontos_fim[,-1]):3,])


alt <-raster("/home/taina/Documentos/Ferns-and-lycophytes/data/Layers/altitude_samambaia.tif")
plot(alt)


srtm <- raster("/home/taina/Documentos/Ferns-and-lycophytes/data/Layers/23_24_srtm_samambaia.tif")
plot(srtm)

expo <- raster("/home/taina/Documentos/Ferns-and-lycophytes/data/Layers/expo_samambaia.tif")
plot(expo)

dens_dren <- raster("/home/taina/Documentos/Ferns-and-lycophytes/data/Layers/densi_dre_samambaia.tif")
plot(dens_dren)

decl <- raster("/home/taina/Documentos/Ferns-and-lycophytes/data/Layers/declividade_samambaia.tif")
plot(decl)

hand500 <- raster("/home/taina/Documentos/Layers_aleatórios/INPE_Layers/hand_500_RJ.tif")
plot(hand500)


##### Extract values from point (require a file in format long lat respectively to use extract funtion)


# Extract values from point

alt_values_2 <- extract(alt, pontos_final[,-1])
boxplot(alt_values_2)

dec_values <- extract(decl, pontos_fim)
boxplot(dec_values)

densi_dren <- extract(dens_dren, pontos_fim)
boxplot(densi_dren)

expos <- extract(expo, pontos_fim)
boxplot(expos)

hand <- extract(hand500, pontos_fim)
boxplot(hand)

srtmm <- extract(srtm, pontos_fim)
boxplot(srtmm)


## Write a table

write.csv(alt_values, "./data/alt_values.csv")
write.csv(dec_values, "./data/decli_values.csv")
write.csv(densi_dren, "./data/densi_dren.csv")
write.csv(expos, "./data/expos.csv")
write.csv(hand, "./data/hand_500.csv")
write.csv(srtmm,"./data/srtm.csv")

denss <- summary(densi_dren)

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



