#################################
## Select one point per pixel
## Authors: Tainá Rocha
## Data: 28 May 2020
#################################


#### Select Point : setup_sdmdata
library(raster)
library(modleR)

points_sdmdata <-read.csv("./data/Novas_1_May/all.csv", sep = ",", dec = ".")

predics_INPE <- list.files("./data/Layers/inpe_layers", pattern = ".tif", full.names = "T")

predic_INPE <- stack(predics)
plot(predic_INPE)

samambaia_points <- setup_sdmdata(species_name = unique(points_sdmdata$sp), 
                                  occurrences = points_sdmdata[,-1], 
                                  predictors = predic_INPE, 
                                  lon = "longitude", 
                                  lat = "latitude", 
                                  models_dir = "./models_INPE", 
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
