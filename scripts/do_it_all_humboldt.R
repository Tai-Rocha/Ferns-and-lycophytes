## 

library(raster)
library(humboldt)
library(tcltk)

## data

env1 <- read.table("./data/envs.txt", dec = ".")

env2 <- read.table("./data/envs.txt", dec = ".")

occ.sp1 <- read.csv("./data/layers_env_bongav/Bonita_Gavea_records.csv", sep = ",", dec = ".")

occ.sp2 <- read.csv("./data/layers_env_tijuca/Floresta_Tijuca_records.csv", sep = ",", dec = ".")

##humboldt do it all

humboldt.doitall(inname = "DoItAll",
                 env1= env1, 
                 env2= env2, 
                 sp1 = occ.sp1,
                 sp2= occ.sp2,
                 rarefy.dist = 0.5, 
                 rarefy.units = "km", 
                 env.reso = 0.00833, 
                 reduce.env = 0,
                 reductype = "PCA", 
                 non.analogous.environments = "YES",
                 nae.window = 5,
                 env.trim = T, 
                 env.trim.type = "MCP", 
                 #trim.mask1,
                 #trim.mask2, 
                 trim.buffer.sp1 = 5, 
                 trim.buffer.sp2 = 5,
                 color.ramp = 1, 
                 correct.env = T, 
                 pcx = 1, 
                 pcy = 2,
                 #col.env = e.var,
                 e.var=(3:25), 
                 R = 500, 
                 kern.smooth = 0.5, 
                 e.reps = 200,
                 b.reps = 200, 
                 b.force.equal.sample = F, 
                 nae = "YES",
                 thresh.espace.z = 0.01, 
                 p.overlap = T, 
                 p.boxplot = T,
                 p.scatter = T, 
                 run.silent = T, 
                 ncores = 1)
