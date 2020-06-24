library(raster)


## Data Prepare for Humboldt analysis Tijuca


env_tijuca_list <- list.files("./data/layers_env_tijuca/todas/", pattern = ".tif", full.names = T)

env_tijuca <-stack(env_tijuca_list)


vals_tijuca <- values(env_tijuca)

coord_tijuca <- xyFromCell(env_tijuca,1:ncell(env_tijuca))

combine_tijuca <- cbind(coord_tijuca,vals_tijuca)

write.csv(combine_tijuca,"env_tijuca_xyvalues.csv", sep = ",", dec = ".") 


#############################################################################


## Data Prepare for Humboldt analysis Pedra Bonita Gávea


env_bgav_list <- list.files("./data/layers_env_bongav/todas/", pattern = ".tif", full.names = T)

env_bgava <-stack(env_bgav_list)


vals_bgav <- values(env_bgava)

coord_bgav <- xyFromCell(env_bgava,1:ncell(env_bgava))

combine_bgav <- cbind(coord_bgav,vals_bgav)

write.csv(combine_bgav,"env_bgav_xyvalues.csv", sep = ",", dec = ".") 
