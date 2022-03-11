## code to prepare `org` dataset goes here

library(tidyverse)

orgs <- rio::import(here::here("data-raw", "SRDP_Org_2019_release.dta")) %>%
  labelled::remove_labels() %>%
  janitor::clean_names() %>%
  select(kgcid, group_name = group, facid, fac_name = facname, year, violence_state:political_nocoop) %>%
  mutate(across(c(kgcid, facid, year), as.numeric),
         across(c(group_name, fac_name), as.character),
         across(violence_state:political_nocoop, factor))

usethis::use_data(orgs, overwrite = TRUE)
