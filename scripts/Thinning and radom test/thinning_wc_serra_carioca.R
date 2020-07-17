#################################
## Select one point per pixel
## Authors: Tainá Rocha
## Data: 20 May 2020
#################################

## Library
library(raster)
library(modleR)

### Load points table

s_carioca <- read.csv("./data/Final_records/S_carioca.csv", sep = ",", dec = ".")

#### Select Point : setup_sdmdata


predics <- list.files("./data/Layers/", pattern = ".tif", full.names = "T")

predic <- stack(predics)

######
sp <- unique(s_carioca$sp)

setup_sdmdata(species_name = sp,
              occurrences = s_carioca[,-1], 
              predictors = predic, 
              lon = "longitude", 
              lat = "latitude", 
              models_dir = "./results/Final_Cleanning/thinning_s_carioca", 
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