###################################
## Data Prepare Tijuca Enviromental 
## Author: Tainá Rocha
## July 2020
###################################

## Library
library(raster)
library(humboldt)
library(tcltk)

## Enviromental data prepare: Tijuca Layers

envs_tijuca_list <- list.files("./data/Tijuca_Layers/todas/", pattern = ".tif", full.names = T)

envs_tijuca <-stack(envs_tijuca_list)


vals_envs_tijuca <- values(envs_tijuca)

coord_envs_tijuca<-xyFromCell(envs_tijuca,1:ncell(envs_tijuca))

combine_envs_tijuca<-cbind(coord_envs_tijuca,vals_envs_tijuca)

## remove NAs and make sure all variables are imported as numbers

env_tijuca<-humboldt.scrub.env(combine_envs_tijuca)

write.table(env_tijuca,"envs_tijuca.txt", dec = ".") 

## Enviromental data prepare: Serra Carioca Layers

envs_carioca_list <- list.files("./data/S_carioca_Layers/", pattern = ".tif", full.names = T)

envs_carioca <-stack(envs_carioca_list)


vals_envs_carioca <- values(envs_carioca)

coord_envs_carioca<-xyFromCell(envs_carioca,1:ncell(envs_carioca))

combine_envs_carioca<-cbind(coord_envs_carioca,vals_envs_carioca)

## remove NAs and make sure all variables are imported as numbers

env_carioca<-humboldt.scrub.env(combine_envs_carioca)

write.table(env_carioca,"envs_carioca.txt", dec = ".") 

## Enviromental data prepare: Pedra da Gávea e Pedra Bonita Layers

envs_gaveabonita_list <- list.files("./data/Pedra_Gavea_Bonita_Layers/todas/", pattern = ".tif", full.names = T)

envs_gaveabonita <-stack(envs_gaveabonita_list)


vals_envs_gaveabonita <- values(envs_gaveabonita)

coord_envs_gaveabonita<-xyFromCell(envs_gaveabonita,1:ncell(envs_gaveabonita))

combine_envs_gaveabonita<-cbind(coord_envs_gaveabonita,vals_envs_gaveabonita)

## remove NAs and make sure all variables are imported as numbers

env_gaveabonita<-humboldt.scrub.env(combine_envs_gaveabonita)

write.table(env_gaveabonita,"envs_gaveabonita.txt", dec = ".") 
