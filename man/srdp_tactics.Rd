% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/access_data.R
\name{srdp_tactics}
\alias{srdp_tactics}
\title{Access to SRDP organization-level tactical data.}
\usage{
srdp_tactics()
}
\value{
A tibble, with each group's facid, name, kgcid, name, country, country challenged, and tactics
}
\description{
This function provides a dataset of all SRDP organizations, their groups, the
countries they are challenging, and their yearly use of violent and non-violent
tactics. It covers the period between 1960 and 2005.
}
\examples{
tactics <- srdp_tactics()
}
