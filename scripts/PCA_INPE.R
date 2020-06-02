##############################

## PCA 
## Author: Tainá Rocha
## Date: 01 June 2020

##############################

## Librays

library(factoextra)
library(FactoMineR)
library(ggcorrplot)
library(ggplot2)
library(psych)
library(rgdal)
library(rgeos)
library(vegan)

## Read and Load data

inpe_vals_pca <- read.csv("./data/PCA/WC_VALS_Original.csv", sep = ",", dec = ".")

### standardize unit of variables to build PCA  

wc_vals<-decostand(wc_vals_pca[3:21], method="standardize", scla)

write.table(wc_vals, './data/wc_vals_standardize.txt')

### PCA

wc.res.pca <- prcomp(wc_vals_pca[3:21],  scale = TRUE)



# Color individuals by groups
fviz_pca_ind(wc.res.pca, label="none", habillage=wc_vals_pca$Setor)


p <- fviz_pca_ind(wc.res.pca, label="none", habillage=wc_vals_pca$Setor,
                  addEllipses=TRUE, ellipse.level=0.95)
print(p)

# Change the color by groups, add ellipses
fviz_pca_biplot(wc.res.pca, label="var", habillage=wc_vals_pca$Setor,
                addEllipses=TRUE, ellipse.level=0.95)




#Select the top 3 contributing variables
fviz_pca_var(wc.res.pca, select.var = list(contrib = 5))


# PCA with cor matriz 

PCA_WC <- PCA(wc_vals_pca[3:21], scale.unit = T, ncp = 5, graph = TRUE, ind.sup = 20:21)


plot(PCA_WC, graph.type = "ggplot")

plot(PCA_WC, habillage = 10, cex=0.3)



gr <- plot(PCA_WC)
gr + theme(panel.grid.major = element_blank(),
           plot.title=element_text(size=14, color="blue"),
           axis.title = element_text(size=12, color="red"))

plot(gr, choix = "var",
     col.ind="black", col.ind.sup="blue", 
     col.var="black", label = "var", lim.cos2.var = 0, title = PCA, palette=NULL,
     autoLab = "auto", new.plot = FALSE, select = NULL,
     shadowtext = FALSE, graph.type = "ggplot", ggoptions = NULL)

#PCA_21_variables_2 <- PCA(vals_pca, graph = FALSE)
#print(PCA_21_variables_2)


plot(PCA_WC, cex=1.5,scale.unit = T, ncp = 21)
