# neighbourhood related API calls
#'
#' Return the list of neighbourhoods for a force.
#'
#' `ukp_neighbourhood` returns the list of neighbourhoods for a force,
#'   <https://data.police.uk/docs/method/neighbourhoods/>
#'
#' @param neighbourhood a text string of a neighbourhood in the UK
#' @param ... further arguments passed to or from other methods. For example,
#'   verbose option can be added with
#'   `ukp_api("call", config = httr::verbose())`. See more in `?httr::GET`
#'   documentation
#'   (<https://cran.r-project.org/web/packages/httr/>) and
#'   (<https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html>).

#' @return tibble with columns id and name. id is a Police force specific team
#'   identifier, note that this identifier is not unique and may also be used by
#'   a different force. Name is the name for the neighbourhood
#' @export
#'
#' @examples
#' library(ukpolice)
#' ukp_neighbourhood("leicestershire")
ukp_neighbourhood <- function(neighbourhood, ...){

  result <- ukp_api(glue::glue("api/{neighbourhood}/neighbourhoods"))

  dplyr::bind_rows(result$content)

}
#' Find the associated neighbourhood code with a long/lat string
#'
#' `ukp_neighbourhood_location` takes a longitude/latitude string and finds the
#'   associated neighbourhood code associated with that. Read more here
#'   https://data.police.uk/docs/method/neighbourhood-locate/
#'
#' @param lat_long a character string of latitude and longitude
#' @param ... further arguments passed to or from other methods. For example,
#'   verbose option can be added with
#'   `ukp_api("call", config = httr::verbose()).` See more in `?httr::GET`
#'   documentation
#'   (<https://cran.r-project.org/web/packages/httr/>) and
#'   (<https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html>).
#' @return a tibble
#'
#' @export
#'
ukp_neighbourhood_location <- function(lat_long, ...){
  # lat_long = c("51.500617,-0.124629")
  result <- ukp_api(sprintf("api/locate-neighbourhood?q=%s", lat_long))

  dplyr::bind_rows(result$content)

}

#' Specific neighbourhood
#'
#' ukp_neighbourhood_specific
#'
#'
#'
#' Neighbourhood boundary
#'
#' ukp_neighbourhood_boundary
#'
#'
#'
#' Neighbourhood team
#'
#' ukp_neighbourhood_team
#'
#'
#'
#' Neighbourhood events
#'
#' ukp_neighbourhood_event
#'
#'
#'
#' Neighbourhood priorities
#'
#' ukp_neighbourhood_priority
#'
#'
#'
#' Locate neighbourhood
#'
#'  ukp_neighbourhood_locate
#'
#'
#'
#'
