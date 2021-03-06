% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lineEnding.R
\name{lineEnding}
\alias{lineEnding}
\title{Convert between DOS and UNIX line endings}
\source{
\href{https://waterlan.home.xs4all.nl/dos2unix.html}{Dos2Unix/Unix2Dos Text file format converters}
}
\usage{
lineEnding(infile, pattern = NULL, outfile = NULL, to = c("dos", "unix"), ...)
}
\arguments{
\item{infile}{Input filename(s).}

\item{pattern}{See \code{\link{list.files}}. This will be ignored if 'infile' 
is specified.}

\item{outfile}{Output filename. If not supplied, 'infile' will be 
overwritten.}

\item{to}{Either 'dos' or 'unix'.}

\item{...}{Additional arguments passed to \code{\link{list.files}}, only 
applicable if 'infile' is not specified.}
}
\description{
This function converts between DOS and UNIX style line endings by envoking 
\code{unix2dos} (or \code{dos2unix}) upon a text file (see also 
\code{system("unix2dos --help")}). Note that 'unix2dos' must be installed on 
your local system, see Source.
}
\examples{
## input file
infile <- paste(system.file(package = "Orcs"), "DESCRIPTION", sep = "/")

## convert to dos line endings and write to output file
ofl = file.path(tempdir(), "DESCRIPTION4wd")
lineEnding(infile, outfile = ofl, to = "dos")

}
\seealso{
\code{\link{list.files}}, \code{\link{system}}
}
\author{
Florian Detsch
}
