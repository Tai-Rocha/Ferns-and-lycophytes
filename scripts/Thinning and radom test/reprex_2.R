 library(raster)
 library(reprex)
 library(dplyr)
 library(tidyr)
 library(knitr)
 library(clipr)

wc <- getData("worldclim",var="bio",res=10)
plot(wc)
points <- spsample(as(wc@extent, 'SpatialPolygons'),n=100, type="random")    
plot(wc[[1]])
plot(points,add=T)
valuess <- raster::extract(wc, points@coords, method='simple', df=T)

boxplot(valuess[,-1])
