library(cancensus)
library(ggplot2)

list_census_datasets() |> View()

census_data_csd <- get_census(
  region = list(C="Canada"),
  vectors = c("v_CA21_983"), # Median total income in 2020 ($)
  dataset='CA21', 
  level='CSD',
  geo_format = "sf"
)

census_data_ct <- get_census(
  region = list(C="Canada"),
  vectors = c("v_CA21_983"), # Median total income in 2020 ($)
  dataset='CA21', 
  level='CT',
  geo_format = "sf"
)

ggplot(census_data_csd) +
  geom_sf(
    aes(fill=`v_CA21_983: Median total income in 2020 ($)`),
    color = NA
  ) +
  theme_bw() +
  labs(fill="Income")

ggplot(census_data_ct) +
  geom_sf(
    aes(fill=`v_CA21_983: Median total income in 2020 ($)`),
    color = NA
  ) +
  theme_bw() +
  labs(fill="Income")
