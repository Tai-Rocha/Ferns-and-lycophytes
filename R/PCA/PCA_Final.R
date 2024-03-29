##############################

## PCA 
## Author: Tainá Rocha
## Date: 16 October 2020

##############################

## Libray

library(factoextra)
library(FactoMineR)
library(ggcorrplot)
library(ggplot2)
library(psych)
library(rgdal)
library(rgeos)
library(vegan)

## Read and Load data

vals_pca <- read.csv("./Ferns-and-lycophytes_old/data/PCA/PCA_INPUT.csv", sep = ",", dec = ".")

### standardize unit of variables to build PCA  # 

# PCA_vals<-decostand(vals_pca[4:26], method="standardize")

#write.table(wc_vals, './data/wc_vals_standardize.txt')

### PCA Vegan

res.pca <- prcomp(vals_pca[1:23],  scale = TRUE)


png(file="PCA.png",
     width=9, height=7, units="in", res=300)
fviz_pca_biplot(res.pca, 
                axes = c(1, 2), 
                geom = c("point", "text"), 
                geom.ind = "point", 
                geom.var = c("arrow", "text"), 
                col.ind = "black", 
                fill.ind = "gray", 
                col.var = "dark gray", 
                fill.var = "white", 
                gradient.cols = NULL, 
                #label = "all", 
                invisible = "none", 
                repel = FALSE, 
                habillage = vals_pca$Setor, 
                palette = NULL, 
                addEllipses = FALSE, 
                title = " ")

dev.off()
# Color individuals by groups
fviz_pca_ind(res.pca, label="none", habillage=vals_pca$Setor)


p <- fviz_pca_ind(res.pca, label="none", habillage=vals_pca$Setor,
                  addEllipses=TRUE, ellipse.level=0.95)
print(p)


tiff(file="Individuals_PCA_1.tiff",
     width=9, height=7, units="in", res=150)
fviz_pca_ind(res.pca, label="none", habillage=vals_pca$Setor,
             addEllipses=F, itle = "PCA - Variables")
dev.off()

### Var importance 

contribution_1 <- fviz_contrib(res.pca, choice="var", axes = 1, sort.val = "asc", fill = "gray")

plot(contribution_1)

tiff(file="dim1_varContrib.tiff",
     width=9, height=7, units="in", res=150)
fviz_contrib(res.pca, choice="var", axes = 1, sort.val = "asc", fill = "gray")
dev.off()


contribution_2 <- fviz_contrib(res.pca, choice="var", axes = 2, sort.val = "asc", fill = "gray")

plot(contribution_2)

tiff(file="dim2_varContrib.tiff",
     width=9, height=7, units="in", res=150)
fviz_contrib(res.pca, choice="var", axes = 2, sort.val = "asc", fill = "gray")
dev.off()


#a <- get_pca(res.pca, element = c("var", "ind"))




