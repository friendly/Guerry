\encoding{latin1}
\name{gfrance85}
\Rdversion{1.1}
\alias{gfrance85}
\docType{data}
\title{
Map of France in 1830 with the Guerry data, excluding Corsica
}
\description{
\code{gfrance85} is a SpatialPolygonsDataFrame object created with the
\code{sp} package, containing the polygon boundaries of the map of
France as it was in 1830, together with the \code{\link{Guerry}}
data frame.  This version excludes Corsica, which is an outlier
both in the map and in many analyses.
}
\usage{data(gfrance85)}
\format{
  The format is:
Formal class 'SpatialPolygonsDataFrame' [package "sp"] with 5 slots: \code{gfrance85@data},
\code{gfrance85@polygons}, \code{gfrance85@plotOrder}, \code{gfrance85@bbox}, \code{gfrance85@proj4string}.
See: \code{\link[sp]{SpatialPolygonsDataFrame}} for descriptions of some components.

The analysis variables  are described in  \code{\link{Guerry}}.
}
\details{
In the present version, the PROJ4 projection is not specified.
}
\source{
Friendly, M. (2007).
Supplementary materials for Andr?-Michel Guerry's Moral Statistics of France:
Challenges for Multivariate Spatial Analysis,
\url{http://datavis.ca/gallery/guerry/}.

}
\references{
Dray, S. and Jombart, T. (2009). A Revisit Of Guerry's Data: Introducing
Spatial Constraints In Multivariate Analysis. Unpublished manuscript.

Friendly, M. (2007). A.-M. Guerry's Moral Statistics of France: Challenges for Multivariable Spatial Analysis.
 \emph{Statistical Science}, 22, 368-399.
}
\examples{
data(gfrance85)
require(sp)
plot(gfrance85)   # plot the empty outline map

# extract some useful components
df <- data.frame(gfrance85)[,7:12]       # main moral variables
xy <- coordinates(gfrance85)             # department centroids
dep.names <- data.frame(gfrance85)[,6]
region.names <- data.frame(gfrance85)[,5]
col.region <- colors()[c(149,254,468,552,26)]

if (require(spdep)) {
  lw <- nb2listw(poly2nb(gfrance85))       # neighbors list
}

# plot the map showing regions by color with department labels
op <-par(mar=rep(0.1,4))
plot(gfrance85,col=col.region[region.names])
text(xy, labels=dep.names, cex=0.4)
par(op)


}
\keyword{datasets}
\keyword{spatial}
