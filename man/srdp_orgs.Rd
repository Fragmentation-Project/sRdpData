% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/access_data.R
\name{srdp_orgs}
\alias{srdp_orgs}
\title{Access to SRDP organisation-level data.}
\usage{
srdp_orgs(wide = FALSE)
}
\arguments{
\item{wide}{Logical. When FALSE (default), provides a dataframe with one observation for every organization-year dyad. When TRUE, provides a dataframe with one observation for every organization.}
}
\value{
A tibble, with each organization's kgcid, group name, facid, faction name, start year, and end year
}
\description{
This function provides a dataset of all organizations, their groups, and
their start and end dates. It covers the period between 1960 and 2005. You
can use this function to access a long dataframe (one observation for each
organization-year dyad), or a wide dataframe (one observation for each
organization, with their start and end years provided in specific columns).
}
\details{
Please note, if an organization started before 1960, its start year is listed
as \emph{NA}. If an organization ended after 2005, its end year is listed as \emph{NA}.
}
\examples{
orgs <- srdp_orgs(wide = TRUE)
}
