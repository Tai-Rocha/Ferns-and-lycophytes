## 

library(raster)
library(humboldt)
library(tcltk)

## Enviromental data

envs_list <- list.files("./data/Env_Final_1/", pattern = ".tif", full.names = T)

envs <-stack(envs_list)


vals_envs <- values(envs)

coord_envs<-xyFromCell(envs,1:ncell(envs))

combine_envs<-cbind(coord_envs,vals_envs)

## remove NAs and make sure all variables are imported as numbers

env1n2<-humboldt.scrub.env(combine_envs)

write.table(env1n2,"envs.txt", dec = ".") 


