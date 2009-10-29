\encoding{latin1}
\name{Guerry-package}
\Rdversion{1.1}
\alias{Guerry-package}
%\alias{Guerry}
\docType{package}
\title{
Guerry: maps, data and methods related to A.-M. Guerry's "Moral Statistics of France" (1833)

}
\description{
Andre-Michel Guerry (1833) was the first to systematically collect and analyze
social data on such things as crime, literacy and suicide with the view
to determining social laws and the relations among these variables.

This package comprises maps of France in 1830, data from A.-M. Guerry and others, and 
statistical and graphic methods related to Guerry's "Moral Statistics of France".

The goal of providing these as an R package is to facilitate the exploration and
development of statistical and graphic methods for multivariate data in a
geo-spatial context.
}
\details{
\tabular{ll}{
Package: \tab Guerry\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2009-10-28\cr
License: \tab GPL\cr
LazyLoad: \tab yes\cr
}

Data from Guerry and others is contained in the data frame \code{\link{Guerry}}.
Because Corsica is often considered an outlier both spatially and
statistically, the map of France circa 1830, together with the Guerry
data is provided as \code{SpatialPolygonsDataFrame}s
in two forms:
\code{\link{gfrance}} for all 86 departments, and
and \code{\link{gfrance85}}, for the 85 departments excluding Corsica.


}
\author{
Michael Friendly and Stephane Dray

Maintainer: Michael Friendly <friendly AT yorku.ca>

}
\references{
Dray, S. and Jombart, T. (2009).
A Revisit Of Guerry's Data: Introducing Spatial Constraints In Multivariate Analysis. 
Unpublished manuscript.

Brunsdon, C. and Dykes, J. (2007).
Geographically weighted visualization: interactive graphics
for scale-varying exploratory analysis.
Geographical Information Science Research Conference (GISRUK 2007).
NUI Maynooth, Ireland, April, 2007.
\url{http://ncg.nuim.ie/gisruk/materials/proceedings/PDF/3C1.pdf}.


Friendly, M. (2007). A.-M. Guerry's Moral Statistics of France: Challenges for Multivariable Spatial Analysis.
 \emph{Statistical Science}, 22, 368-399.

Friendly, M. (2007).
Supplementary materials for André-Michel Guerry's Moral Statistics of France:
Challenges for Multivariate Spatial Analysis,
\url{http://www.math.yorku.ca/SCS/Gallery/guerry/}.

Guerry, A.-M. (1833). \emph{Essai sur la statistique morale de la France} Paris: Crochard.
English translation: Hugh P. Whitt and Victor W. Reinking, Lewiston, N.Y.: Edwin Mellen Press, 2002.

}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in ~~
%~~ the R documentation directory ~~
\keyword{ 
package 
spatial
}

\examples{
#~~ simple examples of the most important functions ~~
}
