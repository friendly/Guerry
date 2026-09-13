#' Map of France in 1830 with the Guerry data, excluding Corsica
#' 
#' `gfrance85` is a SpatialPolygonsDataFrame object created with the
#' `sp` package, containing the polygon boundaries of the map of France as
#' it was in 1830, together with the [`Guerry`] data frame.  This
#' version excludes Corsica, which is an outlier both in the map and in many
#' analyses.
#' 
#' In the present version, the PROJ4 projection is not specified.
#' 
#' @name gfrance85
#' @docType data
#' @format The format is: Formal class 'SpatialPolygonsDataFrame' [package
#' "sp"] with 5 slots: \itemize{ \item `gfrance85@data`, \item
#' `gfrance85@polygons`, \item `gfrance85@plotOrder`, \item
#' `gfrance85@bbox`, \item `gfrance85@proj4string`. }
#'
#' The analysis variables are described in [`Guerry`]. See:
#' [sp::SpatialPolygonsDataFrame()] for descriptions of some
#' components.
#' @references Dray, S. and Jombart, T. (2009). A Revisit Of Guerry's Data:
#' Introducing Spatial Constraints In Multivariate Analysis. Unpublished
#' manuscript.
#' 
#' Friendly, M. (2007). A.-M. Guerry's Moral Statistics of France: Challenges
#' for Multivariable Spatial Analysis.  \emph{Statistical Science}, 22,
#' 368-399.
#' @source Friendly, M. (2007). Supplementary materials for Andre-Michel
#' Guerry's Moral Statistics of France: Challenges for Multivariate Spatial
#' Analysis, \url{http://datavis.ca/gallery/guerry/}.
#' @keywords datasets spatial
#' @examples
#' 
#' data(gfrance85)
#' require(sp)
#' require(scales)
#' plot(gfrance85)   # plot the empty outline map
#' 
#' # extract some useful components
#' df <- data.frame(gfrance85)[,7:12]       # main moral variables
#' xy <- coordinates(gfrance85)             # department centroids
#' dep.names <- data.frame(gfrance85)[,6]
#' region.names <- data.frame(gfrance85)[,5]
#' col.region <- colors()[c(149,254,468,552,26)] |>
#'   scales::alpha(alpha = 0.2)
#' 
#' 
#' # plot the map showing regions by color with department labels
#' op <-par(mar=rep(0.1,4))
#' plot(gfrance85,col=col.region[region.names])
#' text(xy, labels=dep.names, cex=0.6)
#' par(op)
#' 
#' 
NULL
