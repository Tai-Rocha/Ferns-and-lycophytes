##############################
## PCA per area 
## Author: Tainá Rocha
## Date: 28 May 2020
##############################

## Librarys

library(raster)
library(dismo)
library(factoextra)
library(vegan)

## Pedra Bonita e Gávea

list_gavea_bonita <- list.files("./data/Pedra_Gavea_Bonita_Layers/todas/", pattern = ".tif", full.names = T)

gav_bon <- stack(list_gavea_bonita)

plot(gav_bon)

## Get pixel values and write

values_pixels_gavbong <-getValues(gav_bon)

write.table(values_pixels_gavbong, "./data/Pedra_Gavea_Bonita_Layers/todas/pixels_values_gavea_bonita.txt", sep = ",")

## Read and load data

gavea_bonita_pca <- read.table("./data/Pedra_Gavea_Bonita_Layers/todas/pixels_values_gavea_bonita.txt", sep = ",", dec = ".")

gavbon<-na.omit(gavea_bonita_pca)

## PCA
gaveabonita.pca <- prcomp(gavbon,  scale = TRUE)

## Vizualize Image

tiff(file="PCA_Gávea_Bonita.tiff",
     width=9, height=7, units="in", res=150)
fviz_pca_biplot(gaveabonita.pca, 
                axes = c(1, 2), 
                geom = c("point", "text"), 
                geom.ind = "point", 
                geom.var = c("arrow", "text"), 
                col.ind = "black", 
                fill.ind = "gray", 
                col.var = "gray", 
                fill.var = "white", 
                gradient.cols = NULL, 
                label = "all", 
                invisible = "none", 
                repel = FALSE, 
                habillage = "none", 
                palette = NULL, 
                addEllipses = FALSE, 
                title = "Pedra Bonita and Pedra da Gávea")
dev.off()


### Var importance 

# Dimension 1

tiff(file="dim1_varContrib_gavbon.tiff",
     width=9, height=7, units="in", res=150)
fviz_contrib(gaveabonita.pca, choice="var", axes = 1, sort.val = "asc", fill = "gray")
dev.off()


# Dimension 2

tiff(file="dim2_varContrib_gavbon.tiff",
     width=9, height=7, units="in", res=150)
fviz_contrib(gaveabonita.pca, choice="var", axes = 2, sort.val = "asc", fill = "gray")
dev.off()

## Tijuca

list_tijuca <- list.files("./data/Tijuca_Layers/todas/", pattern = ".tif", full.names = T)

all_tijuca <- stack(list_tijuca)

plot(all_tijuca)


values_pixels_tijuca <-getValues(all_tijuca)

write.table(values_pixels_tijuca, "./data/Tijuca_Layers/todas/pixels_values_tijuca.txt", sep = ",")


## Read and Load data

tijuca_pca_ <- read.table("./data/Tijuca_Layers/todas/pixels_values_tijuca.txt", sep = ",", dec = ".")

#tijuca_pca<-na.omit(tijuca_pca_)

## PCA
tijuca.pca <- prcomp(tijuca_pca_,  scale = TRUE)

## Vizualize Image

tiff(file="PCA_Tijuca.tiff",
     width=9, height=7, units="in", res=150)
fviz_pca_biplot(tijuca.pca, 
                axes = c(1, 2), 
                geom = c("point", "text"), 
                geom.ind = "point", 
                geom.var = c("arrow", "text"), 
                col.ind = "black", 
                fill.ind = "gray", 
                col.var = "gray", 
                fill.var = "white", 
                gradient.cols = NULL, 
                label = "all", 
                invisible = "none", 
                repel = FALSE, 
                habillage = "none", 
                palette = NULL, 
                addEllipses = FALSE, 
                title = "Tijuca")
dev.off()


### Var importance 

# Dimension 1

tiff(file="dim1_varContrib_tijuca.tiff",
     width=9, height=7, units="in", res=150)
fviz_contrib(tijuca.pca, choice="var", axes = 1, sort.val = "asc", fill = "gray")
dev.off()


# Dimension 2

tiff(file="dim2_varContrib_tijuca.tiff",
     width=9, height=7, units="in", res=150)
fviz_contrib(tijuca.pca, choice="var", axes = 2, sort.val = "asc", fill = "gray")
dev.off()


## Carioca

list_carioca <- list.files("./data/S_carioca_Layers/todas/", pattern = ".tif", full.names = T)

all_carioca <- stack(list_carioca)

plot(all_carioca)


values_pixels_carioca <-getValues(all_carioca)

write.table(values_pixels_carioca, "./data/S_carioca_Layers/todas/pixels_values_carioca.txt", sep = ",")


## Read and Load data

carioca_pca_ <- read.table("./data/S_carioca_Layers/todas/pixels_values_carioca.txt", sep = ",", dec = ".")

carioca_pca<-na.omit(carioca_pca_)

## PCA

carioca.pca <- prcomp(carioca_pca,  scale = TRUE)

## Vizualize Image

tiff(file="PCA_carioca.tiff",
     width=9, height=7, units="in", res=150)
fviz_pca_biplot(carioca.pca, 
                axes = c(1, 2), 
                geom = c("point", "text"), 
                geom.ind = "point", 
                geom.var = c("arrow", "text"), 
                col.ind = "black", 
                fill.ind = "gray", 
                col.var = "gray", 
                fill.var = "white", 
                gradient.cols = NULL, 
                label = "all", 
                invisible = "none", 
                repel = FALSE, 
                habillage = "none", 
                palette = NULL, 
                addEllipses = FALSE, 
                title = "carioca")
dev.off()


### Var importance 

# Dimension 1

tiff(file="dim1_varContrib_carioca.tiff",
     width=9, height=7, units="in", res=150)
fviz_contrib(carioca.pca, choice="var", axes = 1, sort.val = "asc", fill = "gray")
dev.off()


# Dimension 2

tiff(file="dim2_varContrib_carioca.tiff",
     width=9, height=7, units="in", res=150)
fviz_contrib(carioca.pca, choice="var", axes = 2, sort.val = "asc", fill = "gray")
dev.off()
