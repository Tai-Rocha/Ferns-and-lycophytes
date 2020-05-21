#################################
## Select one point per pixel
## Authors: Tainá Rocha
## Data: 20 May 2020
#################################

## Library
library(spThin)

###
Unique_Points <- read.csv("./data/Novas_1_May/samambaia_no_duplicates.csv")

final_data_records <- thin.algorithm(Unique_Points, thin.par = 1, reps = 5)

write.csv(final_data_records[[1]], "./data/Novas_1_May/Thin_1.csv")

write.csv(final_data_records[[2]], "./data/Novas_1_May/Thin_2.csv")

write.csv(final_data_records[[3]], "./data/Novas_1_May/Thin_3.csv")

write.csv(final_data_records[[4]], "./data/Novas_1_May/Thin_4.csv")

write.csv(final_data_records[[5]], "./data/Novas_1_May/Thin_5.csv")
