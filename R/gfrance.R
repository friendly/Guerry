#' Map of France in 1830 with the Guerry data
#' 
#' `gfrance` is a `SpatialPolygonsDataFrame` object created with the
#' \pkg{sp} package, containing the polygon boundaries of the map of France as
#' it was in 1830, together with the [`Guerry`] data frame.
#' 
#' In the present version, the PROJ4 projection is not specified.
#' 
#' @name gfrance
#' @docType data
#' @format The format is: Formal class 'SpatialPolygonsDataFrame' [package
#' "sp"] with 5 slots: 
#' \itemize{ 
#'  \item `gfrance@data`, 
#'  \item `gfrance@polygons`, 
#'  \item `gfrance@plotOrder`, 
#'  \item `gfrance@bbox`, 
#'  \item `gfrance@proj4string`. 
#'  }
#'
#' See: [sp::SpatialPolygonsDataFrame()] for descriptions of some
#' components.
#'
#' The analysis variables, represented in `gfrance@data` are described in
#' [`Guerry`].
#' @seealso [`Guerry`] for description of the analysis variables
#' [`Angeville`] for other analysis variables
#' @references Friendly, M. (2007). A.-M. Guerry's Moral Statistics of France:
#' Challenges for Multivariable Spatial Analysis.  \emph{Statistical Science},
#' 22, 368-399.
#' @source Friendly, M. (2007). Supplementary materials for Andre-Michel
#' Guerry's Moral Statistics of France: Challenges for Multivariate Spatial
#' Analysis, \url{http://www.datavis.ca/gallery/guerry/}.
#' @keywords datasets spatial
#' @examples
#' 
#' library(sp)
#' data(gfrance)
#' names(gfrance)  ## list @data variables
#' plot(gfrance)   ## just show the map outline
#' 
#' # Show basic choropleth plots of some of the variables
#' spplot(gfrance, "Crime_pers")
#' 
#' # use something like Guerry's pallete, where dark = Worse
#' my.palette <- rev(RColorBrewer::brewer.pal(n = 9, name = "PuBu"))
#' spplot(gfrance, "Crime_pers", col.regions = my.palette, cuts = 8)
#' 
#' 
#' spplot(gfrance, "Crime_prop")
#' 
#' # Note that spplot assumes all variables are on the same scale for comparative plots
#' # transform variables to ranks (as Guerry did)
#'  
#' \dontrun{
#' local({
#'   gfrance$Crime_pers <- rank(gfrance$Crime_pers)
#'   gfrance$Crime_prop <- rank(gfrance$Crime_prop)
#'   gfrance$Literacy <- rank(gfrance$Literacy)
#'   gfrance$Donations <- rank(gfrance$Donations)
#'   gfrance$Infants <- rank(gfrance$Infants)
#'   gfrance$Suicides <- rank(gfrance$Suicides)
#'    	
#'   spplot(gfrance, c("Crime_pers", "Crime_prop", "Literacy", "Donations", "Infants", "Suicides"), 
#'     layout=c(3,2), as.table=TRUE, main="Guerry's main moral variables")
#' }) 
#' }
#' 
NULL
