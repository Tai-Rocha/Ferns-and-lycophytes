#########################
## Estudando os pontos
## Authos: Tainá Rocha
## Date : May 2021
########################
## Library

library (raster)
library(ggplot2)
library(ggmap)
library(MASS)
library(maps)
library(mapdata)
library(ggrepel)
library(ggsn)
library(rgdal)

## Read data

points_all <- read.csv("./Ferns-and-lycophytes_old/data/PCA/PCA_INPUT.csv", sep = ",", dec = ".")

#matri <- as.matrix(points_all)

escalonado <- scale(points_all[,1:23],center=TRUE,scale=TRUE)

write.csv(escalonado, "./escalonado_envs_values.csv")

# verificar o conjunto de pontos somados 
summary(points_all)


#################################################### Pontos sem stand.

boxplot(c(points_all[1:9,1]), points_all[10:25,1], points_all[26:57,1]) #alt

boxplot(c(points_all[1:9,2]), points_all[10:25,2], points_all[26:57,2]) #bio1

boxplot(c(points_all[1:9,5]), points_all[10:25,5], points_all[26:57,5]) #bio12

boxplot(c(points_all[1:9,6]), points_all[10:25,6], points_all[26:57,6]) #bio13

boxplot(c(points_all[1:9,8]), points_all[10:25,8], points_all[26:57,8]) #bio15

boxplot(c(points_all[1:9,14]), points_all[10:25,14], points_all[26:57,14]) #bio3

boxplot(c(points_all[1:9,21]), points_all[10:25,21], points_all[26:57,21]) #dec

boxplot(c(points_all[1:9,22]), points_all[10:25,22], points_all[26:57,22]) #densi_dren

boxplot(c(points_all[1:9,23]), points_all[10:25,23], points_all[26:57,23]) #expo

################################################################################################


boxplot(c(escalonado[1:9,1]), (escalonado[10:25,1]), (escalonado[26:57,1])) #alt

boxplot(c(escalonado[1:9,2]), (escalonado[10:25,2]), (escalonado[26:57,2])) #bio1

boxplot(c(escalonado[1:9,3]), (escalonado[10:25,3]), (escalonado[26:57,3])) #bio10

boxplot(c(escalonado[1:9,4]), (escalonado[10:25,4]), (escalonado[26:57,4])) #bio11

boxplot(c(escalonado[1:9,5]), (escalonado[10:25,5]), (escalonado[26:57,5])) #bio12

boxplot(c(escalonado[1:9,6]), (escalonado[10:25,6]), (escalonado[26:57,6])) # bio13

boxplot(c(escalonado[1:9,7]), (escalonado[10:25,7]), (escalonado[26:57,7])) #bio14

boxplot(c(escalonado[1:9,8]), (escalonado[10:25,8]), (escalonado[26:57,8])) #bio15

boxplot(c(escalonado[1:9,9]), (escalonado[10:25,9]), (escalonado[26:57,9])) #bio16

boxplot(c(escalonado[1:9,10]), (escalonado[10:25,10]), (escalonado[26:57,10])) #bio17

boxplot(c(escalonado[1:9,11]), (escalonado[10:25,11]), (escalonado[26:57,11])) #bio18

boxplot(c(escalonado[1:9,12]), (escalonado[10:25,12]), (escalonado[26:57,12])) #bio19

boxplot(c(escalonado[1:9,13]), (escalonado[10:25,13]), (escalonado[26:57,13])) # bio2

boxplot(c(escalonado[1:9,14]), (escalonado[10:25,14]), (escalonado[26:57,14])) #bio3

boxplot(c(escalonado[1:9,15]), (escalonado[10:25,15]), (escalonado[26:57,15])) #bio4

boxplot(c(escalonado[1:9,16]), (escalonado[10:25,16]), (escalonado[26:57,16])) #bio5

boxplot(c(escalonado[1:9,17]), (escalonado[10:25,17]), (escalonado[26:57,17])) #bio6

boxplot(c(escalonado[1:9,18]), (escalonado[10:25,18]), (escalonado[26:57,18])) #bio7

boxplot(c(escalonado[1:9,19]), (escalonado[10:25,19]), (escalonado[26:57,19])) #bio8

boxplot(c(escalonado[1:9,20]), (escalonado[10:25,20]), (escalonado[26:57,20])) #bio9

boxplot(c(escalonado[1:9,21]), (escalonado[10:25,21]), (escalonado[26:57,21])) #dec

boxplot(c(escalonado[1:9,22]), (escalonado[10:25,22]), (escalonado[26:57,22])) #desni_dre

boxplot(c(escalonado[1:9,23]), (escalonado[10:25,23]), (escalonado[26:57,23])) #expo


################################################

boxplot(c(escalonado[1:9,1]), (escalonado[10:25,1]), (escalonado[26:57,1]),(escalonado[1:9,2]), (escalonado[10:25,2]), (escalonado[26:57,2]), (escalonado[1:9,3]), (escalonado[10:25,3]), (escalonado[26:57,3]), (escalonado[1:9,4]), (escalonado[10:25,4]), (escalonado[26:57,4]), (escalonado[1:9,5]), (escalonado[10:25,5]), (escalonado[26:57,5]),(escalonado[1:9,6]), (escalonado[10:25,6]), (escalonado[26:57,6]),(escalonado[1:9,7]), (escalonado[10:25,7]), (escalonado[26:57,7]), (escalonado[1:9,8]), (escalonado[10:25,8]), (escalonado[26:57,8]),(escalonado[1:9,9]), (escalonado[10:25,9]), (escalonado[26:57,9]),(escalonado[1:9,10]), (escalonado[10:25,10]), (escalonado[26:57,10]), (escalonado[1:9,11]), (escalonado[10:25,11]), (escalonado[26:57,11]), (escalonado[1:9,12]), (escalonado[10:25,12]), (escalonado[26:57,12]), (escalonado[1:9,13]), (escalonado[10:25,13]), (escalonado[26:57,13]),(escalonado[1:9,14]), (escalonado[10:25,14]), (escalonado[26:57,14]),(escalonado[1:9,15]), (escalonado[10:25,15]), (escalonado[26:57,15]),(escalonado[1:9,16]), (escalonado[10:25,16]), (escalonado[26:57,16]),(escalonado[1:9,17]), (escalonado[10:25,17]), (escalonado[26:57,17]), (escalonado[1:9,18]), (escalonado[10:25,18]), (escalonado[26:57,18]),(escalonado[1:9,19]), (escalonado[10:25,19]), (escalonado[26:57,19]),(escalonado[1:9,20]), (escalonado[10:25,20]), (escalonado[26:57,20]),(escalonado[1:9,21]), (escalonado[10:25,21]), (escalonado[26:57,21]),(escalonado[1:9,22]), (escalonado[10:25,22]), (escalonado[26:57,22]),(escalonado[1:9,23]), (escalonado[10:25,23]), (escalonado[26:57,23]))


#########################

boxplot(c(escalonado[1:9,1]), (escalonado[10:25,1]), (escalonado[26:57,1]),(escalonado[1:9,2]), (escalonado[10:25,2]), (escalonado[26:57,2]), (escalonado[1:9,5]), (escalonado[10:25,5]), (escalonado[26:57,5]),(escalonado[1:9,6]), (escalonado[10:25,6]), (escalonado[26:57,6]),(escalonado[1:9,14]), (escalonado[10:25,14]), (escalonado[26:57,14]),(escalonado[1:9,22]), (escalonado[10:25,22]), (escalonado[26:57,22]),(escalonado[1:9,23]), (escalonado[10:25,23]), (escalonado[26:57,23]))














boxplot(c(points_all[1:9,21]), points_all[10:25,21], points_all[26:57,21]) #dec

boxplot(c(points_all[1:9,22]), points_all[10:25,22], points_all[26:57,22]) #densi_dren

boxplot(c(points_all[1:9,23]), points_all[10:25,23], points_all[26:57,23]) #expo



################

df <- subset(points_for_models, select=c(lon, lat, Variables, bio12, bio13, bio15, bio20, bio5, bio6))  

library(gridExtra)
library(ggplot2)
p <- list()

for (j in colnames(df)[4:9]) {
  p[[j]] <- ggplot(data=df, aes_string(x="Variables",y=j)) + # Specify dataset, input or grouping col name and Y
    geom_boxplot(aes(fill=factor(Variables))) + guides(fill=FALSE) + # Boxplot by which factor + color guide
    theme(axis.title.y = element_text(face="bold", size=14))  # Make the Y-axis labels bigger/bolder
}

do.call(grid.arrange, c(p, ncol=6))
