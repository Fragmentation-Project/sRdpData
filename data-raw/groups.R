## code to prepare `groups` dataset goes here

library(tidyverse)

groups <- rio::import(here::here("data-raw", "SRDP_Mvmt_2019_release.dta")) %>%
  labelled::remove_labels() %>%
  janitor::clean_names() %>%
  select(kgcid, group_name = group, year, country) %>%
  mutate(across(c(kgcid, year), as.numeric),
         group_name = as.character(group_name),
         country = countrycode::countrycode(country, "country.name", "country.name"),
         country_iso3c = countrycode::countrycode(country, "country.name", "iso3c"))

usethis::use_data(groups, overwrite = TRUE)
