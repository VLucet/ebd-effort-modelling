library(auk)
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)

# sampling_file <- "/run/media/vlucet/t7ssd/ebd/ebd_CA_smp_relJan-2026/ebd_CA_relJan-2026_sampling.txt"
sampling_file <- "data/ebd/ebd_CA_smp_relJan-2026/ebd_CA_relJan-2026_sampling.txt"
data_file <-"data/ebd/ebd_CA_smp_relJan-2026/ebd_CA_relJan-2026.txt"

auk_ebd(data_file, file_sampling = sampling_file) |>
  auk_year(2025) |>
  auk_complete() |>
  auk_filter(file = "data/ebd/ebd_data_filtered.txt", 
             file_sampling = "data/ebd/ebd_sampling_filtered.txt", overwrite = TRUE)

dat_s <- read_sampling("data/ebd/ebd_sampling_filtered.txt") 
# dat_d <- read_ebd("data/ebd/ebd_data_filtered.txt")

dat_s |> str()
# dat_d |> str()

# saveRDS(dat_s, "data/dat_s.rds")
# saveRDS(dat_d, "data/dat_s.rds")

auk_ebd(data_file, file_sampling = sampling_file) |>
  auk_year(2025) |>
  auk_county("Ontario") |>
  auk_complete() |>
  auk_filter(file = "data/ebd/ebd_data_filtered_ont.txt", 
             filter_sampling = FALSE,
             overwrite = TRUE)
