% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trimImages.R
\name{trimImages}
\alias{trimImages}
\title{Remove Whitespace from Images}
\source{
Ooms J (2018) The \strong{magick} package: Advanced Image-Processing in R.
Available online: \url{https://cran.r-project.org/package=magick/vignettes/intro.html}.
}
\usage{
trimImages(path = ".", pattern = c(".png$", ".tiff$"))
}
\arguments{
\item{path}{File path leading to image files as \code{character}, defaults to the
current working directory.}

\item{pattern}{A regular expression as \code{character} accepted by
\code{\link[=list.files]{list.files()}}, defaults to \code{c(".png$", ".tiff$")}.}
}
\value{
A \code{character} vector containing the names of the processed images.
}
\description{
This is a wrapper function around \code{convert -trim} to automatically remove any
whitespace from locally saved images. Note that 'ImageMagick' must be
installed on your local system, see Source.
}
\examples{
\dontrun{
## trim image of bart simpson
download.file("http://pngimg.com/uploads/simpsons/simpsons_PNG93.png?i=1"
              , destfile = (ofl <- file.path(tempdir(), "bart.png", fsep = "\\\\"))
              , mode = "wb")

par(mfrow = c(1, 2))

img = brick(ofl)
plotRGB(img)

jnk = trimImages(tempdir(), "bart.png")
trm = brick(jnk)
plotRGB(trm)

dev.off()
}

}
\seealso{
\code{\link[=system]{system()}}
}
\author{
Florian Detsch
}
