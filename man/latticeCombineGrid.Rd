% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/latticeCombineGrid.R
\name{latticeCombineGrid}
\alias{latticeCombineGrid}
\title{Combine multiple lattice plots in a facetted grid (panels)}
\usage{
latticeCombineGrid(
  trellis.list,
  between = list(y = 0.3, x = 0.3),
  as.table = TRUE,
  ...
)
}
\arguments{
\item{trellis.list}{A \code{list} containing \strong{lattice} plot objects.}

\item{between}{Space between panels.}

\item{as.table}{If TRUE (default) drawing is top left to bottom right}

\item{...}{Additional arguments passed to \code{\link{c.trellis}}.}
}
\value{
A single \strong{lattice} plot object.
}
\description{
This function combines multiple \strong{lattice} plot objects in a facetted
grid. Note that the global plot settings (e.g. xlim, ylim, ...) are taken 
from the first object though the user can specify whether \code{scales} 
should be identical or not. This is particularly useful when looping over 
large amounts of data using \code{\link{lapply}} (see examples).
}
\examples{
#load data
#Use a probability map assuming high potential for city expansion is just 
#resulting from proximity to current urban area:
pred <- raster(system.file("extdata/probability.rst", package = "Orcs"))

#observed city growth between 1990 and 2006
obs <- raster(system.file("extdata/citygrowth.tif", package = "Orcs"))

#masking current urban area since these pixels have no potential for change
mask <- raster(system.file("extdata/citymask.tif", package = "Orcs"))

#create data list
dat <- list(pred, obs, mask)

#create list of lattice plots
plist <- lapply(seq(dat), function(i) {
  spplot(dat[[i]], scales = list(draw = TRUE))
})

\donttest{
#draw individually
plist[[1]]
plist[[2]]
plist[[3]]
}

#combine to grid, using c(1, 3) layout
p <- latticeCombineGrid(plist, layout = c(1, 3))
print(p)

}
\seealso{
\code{\link{c.trellis}}.
}
\author{
Tim Appelhans
}
