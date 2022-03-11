srdp_orgs <- function(wide = FALSE) {

  if (wide == TRUE) {

    sRdpData::orgs %>%
      dplyr::select(kgcid:year) %>%
      dplyr::group_by(kgcid, group_name, facid, fac_name) %>%
      dplyr::summarise(start_year = min(year),
                       end_year = max(year)) %>%
      dplyr::mutate(start_year = dplyr::na_if(start_year, 1960),
                    end_year = dplyr::na_if(end_year, 2005))

  } else {

    sRdpData::orgs %>%
      dplyr::select(kgcid:year) %>%
      tibble::as_tibble()

  }

}
