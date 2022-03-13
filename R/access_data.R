#' Access to SRDP organisation-level data.
#'
#' This function provides a dataset of all organizations, their groups, and
#' their start and end dates. It covers the period between 1960 and 2005. You
#' can use this function to access a long dataframe (one observation for each
#' organization-year dyad), or a wide dataframe (one observation for each
#' organization, with their start and end years provided in specific columns).
#'
#' Please note, if an organization started before 1960, its start year is listed
#' as \emph{NA}. If an organization ended after 2005, its end year is listed as \emph{NA}.
#'
#' @param wide Logical. When FALSE (default), provides a dataframe with one observation for every organization-year dyad. When TRUE, provides a dataframe with one observation for every organization.
#'
#' @return A tibble, with each organization's kgcid, group name, facid, faction name, start year, and end year
#' @importFrom rlang .data
#'
#' @export
#'
#' @examples
#' orgs <- srdp_orgs(wide = TRUE)
srdp_orgs <- function(wide = FALSE) {

  if (wide == TRUE) {

    sRdpData::orgs %>%
      dplyr::select(.data$kgcid:.data$year) %>%
      dplyr::group_by(.data$kgcid, .data$group_name, .data$facid, .data$fac_name) %>%
      dplyr::summarise(start_year = min(.data$year),
                       end_year = max(.data$year)) %>%
      dplyr::mutate(start_year = dplyr::na_if(.data$start_year, 1960),
                    end_year = dplyr::na_if(.data$end_year, 2005))

  } else {

    sRdpData::orgs %>%
      dplyr::select(.data$kgcid:.data$year) %>%
      tibble::as_tibble()

  }

}

#' Access to SRDP group-level data.
#'
#' This function provides a dataset of all SRDP groups, the countries they are
#' challenging, and their start and end dates. It covers the period between 1960
#' and 2005. You can use this function to access a long dataframe (one observation for each
#' group-year dyad), or a wide dataframe (one observation for each
#' group, with their start and end years provided in specific columns).
#'
#' Please note, if a group started before 1960, its start year is listed as
#' \emph{NA}. If a group ended after 2005, its end year is listed as \emph{NA}.
#'
#' @param wide Logical. When FALSE (default), provides a dataframe with one observation for every group-year dyad. When TRUE, provides a dataframe with one observation for every group.
#'
#' @return A tibble, with each group's kgcid, name, country, start year, end year, country challenged
#' @importFrom rlang .data
#'
#' @export
#'
#' @examples
#' groups <- srdp_groups(wide = TRUE)
srdp_groups <- function(wide = FALSE) {

  if (wide == TRUE) {

    sRdpData::groups %>%
      dplyr::group_by(.data$kgcid, .data$group_name, .data$country, .data$country_iso3c) %>%
      dplyr::summarise(start_year = min(.data$year),
                       end_year = max(.data$year)) %>%
      dplyr::mutate(start_year = dplyr::na_if(.data$start_year, 1960),
                    end_year = dplyr::na_if(.data$end_year, 2005))

  } else {

    sRdpData::groups %>%
      tibble::as_tibble()

  }

}

#' Access to SRDP organization-level tactical data.
#'
#' This function provides a dataset of all SRDP organizations, their groups, the
#' countries they are challenging, and their yearly use of violent and non-violent
#' tactics. It covers the period between 1960 and 2005.
#'
#'
#' @return A tibble, with each group's facid, name, kgcid, name, country, country challenged, and tactics
#' @importFrom rlang .data
#'
#' @export
#'
#' @examples
#' tactics <- srdp_tactics()
srdp_tactics <- function() {

  sRdpData::orgs %>%
    tibble::as_tibble()

}

