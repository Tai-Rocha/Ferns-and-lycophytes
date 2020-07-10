###############################
## Enviromental space analysis
## Same layers for all setores
## Author: Tainá Rocha
## Julay 2020
###############################


##Library

library(raster)
library(humboldt)
library(tcltk)

## data

env1 <- read.table("./data/humboldt/Layers_values_inpe/envs_unique.txt", dec = ".")

env2 <- read.table("./data/humboldt/Layers_values_inpe/envs_unique.txt", dec = ".")

occ.tijuca <- read.csv("./data/humboldt/Records/floresta_tijuca.csv", sep = ",", dec = ".")

occ.gavea_bonita<- read.csv("./data/humboldt/Records/bonita_gavea.csv", sep = ",", dec = ".")

##humboldt do it all

humboldt.doitall(inname = "DoItAll",
                 env1= env1, 
                 env2= env2, 
                 sp1 = occ.tijuca,
                 sp2= occ.gavea_bonita,
                 rarefy.dist = 0.5, 
                 rarefy.units = "km", 
                 env.reso = 0.00833, 
                 reduce.env = 0,
                 #reductype = "PCA", 
                 non.analogous.environments = "YES",
                 nae.window = 2,
                 env.trim = T, 
                 env.trim.type = "MCP", 
                 #trim.mask1,
                 #trim.mask2, 
                 trim.buffer.sp1 = 1, 
                 trim.buffer.sp2 = 1,
                 color.ramp = 1, 
                 correct.env = T, 
                 pcx = 1, 
                 pcy = 2,
                 col.env = e.var,
                 e.var=(3:25), 
                 R = 50, 
                 kern.smooth = 1, 
                 e.reps = 500,
                 b.reps = 500, 
                 b.force.equal.sample = F, 
                 nae = "YES",
                 thresh.espace.z = 0.001, 
                 p.overlap = T, 
                 p.boxplot = T,
                 p.scatter = T, 
                 run.silent = T, 
                 ncores = 1)




