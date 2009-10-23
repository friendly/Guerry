\encoding{latin1}
\name{gfrance}
\Rdversion{1.1}
\alias{gfrance}
\docType{data}
\title{
Map of France in 1830 with the Guerry data
}
\description{
\code{gfrance} is a SpatialPolygonsDataFrame object created with the
\code{sp} package, containing the polygon boundaries of the map of
France as it was in 1830, together with the \code{\link{Guerry}}
data frame.
}
\usage{data(gfrance)}
\format{
  The format is:
Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots: \code{gfrance@data},
\code{gfrance@polygons}, \code{gfrance@plotOrder}, \code{gfrance@bbox}, \code{gfrance@proj4string}.
See: \code{\link[sp]{SpatialPolygonsDataFrame}} for descriptions of some components.

The analysis variables  are described in  \code{\link{Guerry}}.
}
\details{
In the present version, the PROJ4 projection is not specified.
}
\source{
Friendly, M. (2007).
Supplementary materials for André-Michel Guerry's Moral Statistics of France:
Challenges for Multivariate Spatial Analysis,
\url{http://www.math.yorku.ca/SCS/Gallery/guerry/}.

}
\references{
Friendly, M. (2007). A.-M. Guerry's Moral Statistics of France: Challenges for Multivariable Spatial Analysis.
 \emph{Statistical Science}, 22, 368-399.
}
\examples{
data(gfrance)
names(gfrance)  ## list @data variables
plot(gfrance)

# TODO: Show basic choropleth plots of some of the variables
}
\keyword{datasets}
