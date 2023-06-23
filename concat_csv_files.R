

library(dplyr)
library(purrr)

filename <- file.choose(getwd())
setwd(dirname(filename))

files <- list.files(pattern = '\\.csv$', full.names = TRUE)

{
  all_data <- map_df(files, ~read.csv(.x) %>% mutate(File = basename(.x)))
  
  write.csv(all_data, file = sub(".csv", "_output.csv", basename(filename)), quote = T)
}




