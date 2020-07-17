#################################
## Select one point per pixel
## Authors: Tainá Rocha
## Data: 20 May 2020
#################################

## Library
library(raster)
library(modleR)

### Load points table

all <- read.csv("./data/Final_records/All_setores.csv", sep = ",", dec = ".")

#### Select Point : setup_sdmdata


predics <- list.files("./data/Layers/", pattern = ".tif", full.names = "T")

predic <- stack(predics)

######
sp<- unique(all$sp)
for (i in 1:length(sp)) {
  sp <- sp[i]
 # occs <- all[,-1],
  setup_sdmdata(species_name = sp,
  occurrences = all[,-1], 
  predictors = predic, 
  lon = "longitude", 
  lat = "latitude", 
  models_dir = "./wc_thinning", 
  real_absences = NULL, 
  buffer_type = NULL, 
  dist_buf = NULL, 
  env_filter = FALSE, 
  env_distance = "centroid", 
  buffer_shape = NULL, 
  min_env_dist = NULL, 
  min_geog_dist = NULL,
  write_buffer = FALSE, 
  seed = NULL, 
  clean_dupl = TRUE, 
  clean_nas = TRUE, 
  clean_uni = TRUE, 
  geo_filt = FALSE, 
  geo_filt_dist = NULL, 
  select_variables = FALSE, 
  cutoff = 0.8, 
  sample_proportion = 0.8, 
  png_sdmdata = TRUE, 
  n_back = 3, 
  partition_type = c("bootstrap"), 
  boot_n = 1, 
  boot_proportion = 0.7, 
  cv_n = NULL, 
  cv_partitions = NULL)
}


#final_data_records <- thin.algorithm(Unique_Points, thin.par = 1, reps = 5)

#write.csv(final_data_records[[1]], "./data/Novas_1_May/Thin_1.csv")

#write.csv(final_data_records[[2]], "./data/Novas_1_May/Thin_2.csv")

#write.csv(final_data_records[[3]], "./data/Novas_1_May/Thin_3.csv")

#write.csv(final_data_records[[4]], "./data/Novas_1_May/Thin_4.csv")

#write.csv(final_data_records[[5]], "./data/Novas_1_May/Thin_5.csv")
