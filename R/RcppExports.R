# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' Dimensions of a \code{data.frame}
#' 
#' @description
#' Similar to base-R \code{\link{nrow}}, \code{\link{ncol}} and 
#' \code{\link{dim}}, this set of functions let's you retrieve the number of 
#' rows and columns of a \code{data.frame}.
#' 
#' @param x A \code{data.frame}.
#' 
#' @return \code{dimC} returns an 'integer' vector of length 2 (number of rows 
#' and columns); \code{nrowC} (or \code{ncolC}) returns the number of rows 
#' (or columns) as a single 'integer'.
#' 
#' @author
#' Florian Detsch
#' 
#' @seealso
#' \code{\link{nrow}}, \code{\link{ncol}}, \code{\link{dim}}.
#' 
#' @name OrcsCppFun
#' 
#' @examples
#' dat <- data.frame(a = 1:4, b = 2:5, c = 3:6)
#' 
#' nrowC(dat)
#' 
#' 
#' 
NULL

#' @export nrowC
#' @aliases nrowC
#' @describeIn OrcsCppFun 
nrowC <- function(x) {
    .Call(`_Orcs_nrowC`, x)
}

#' @export ncolC
#' @aliases ncolC
#' @describeIn OrcsCppFun 
ncolC <- function(x) {
    .Call(`_Orcs_ncolC`, x)
}

#' @export dimC
#' @aliases dimC
#' @describeIn OrcsCppFun 
dimC <- function(x) {
    .Call(`_Orcs_dimC`, x)
}
