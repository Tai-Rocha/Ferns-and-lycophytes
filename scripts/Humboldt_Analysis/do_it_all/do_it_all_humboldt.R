###############################
## Enviromental space analysis
###############################


##Library

library(raster)
library(humboldt)
library(tcltk)

## data

env_tijuca<- read.table("./data/humboldt/Layers_values_inpe/envs_tijuca.txt", dec = ".")

env_gaveabonita <- read.table("./data/humboldt/Layers_values_inpe/envs_gaveabonita.txt", dec = ".")

occ.tijuca <- read.csv("./data/humboldt/Records/f_tijuca_thinning.csv", sep = ",", dec = ".")

occ.gaveabonita<- read.csv("./data/humboldt/Records/p_gaveabonita_thinning.csv", sep = ",", dec = ".")

##humboldt do it all

humboldt.doitall(inname = "DoItAll",
                 env1= env_tijuca, 
                 env2= env_gaveabonita, 
                 sp1 = occ.tijuca,
                 sp2= occ.gaveabonita,
                 rarefy.dist = 0.5, 
                 rarefy.units = "km", 
                 env.reso = 0.00833, 
                 reduce.env = 0,
                 reductype = "PCA", 
                 non.analogous.environments = "NO",
                 nae.window = 2,
                 env.trim = T, 
                 env.trim.type = "MCP", 
                 trim.mask1,
                 trim.mask2, 
                 trim.buffer.sp1 = 200, 
                 trim.buffer.sp2 = 200,
                 color.ramp = 1, 
                 correct.env = T, 
                 pcx = 1, 
                 pcy = 2,
                 col.env = e.var,
                 e.var=(3:25), 
                 R = 50, 
                 kern.smooth = 1, 
                 e.reps = 100,
                 b.reps = 100, 
                 b.force.equal.sample = F, 
                 nae = "YES",
                 thresh.espace.z = 0.001, 
                 p.overlap = T, 
                 p.boxplot = T,
                 p.scatter = T, 
                 run.silent = T, 
                 ncores = 1)


