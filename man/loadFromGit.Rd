% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadFromGit.R
\name{loadFromGit}
\alias{loadFromGit}
\title{Install and load a package from GitHub}
\usage{
loadFromGit(repo = "fdetsch/Orcs", ...)
}
\arguments{
\item{repo}{Repository address as \code{character}, defaults to 
"fdetsch/Orcs".}

\item{...}{Additional arguments passed to 
\code{\link[remotes]{install_github}}.}
}
\description{
This function comprises multiple steps required to install and load a 
package directly from GitHub.
}
\examples{
\dontrun{
## install 'Orcs' development version from GitHub
loadFromGit("fdetsch/Orcs", ref = "develop")
}

}
\seealso{
\code{\link[remotes]{install_github}}
}
\author{
Florian Detsch
}
