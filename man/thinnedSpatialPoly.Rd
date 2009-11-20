\name{thinnedSpatialPoly}
\Rdversion{1.1}
\alias{thinnedSpatialPoly}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Thin a SpatialPolygons* object using the Douglas-Peucker polyLine simplification algorithm
}
\description{
The function "thins" a \code{SpatialPolygons} or \code{SpatialPolygonsDataFrame} object,
by reducing the number of points required to represent each line in the spatial
polygons defining the map.

For map-based graphics using complex maps (such as \code{\link{gfrance}})
and rendered using vector graphics devices (pdf, postscript), thinning the
base map can vastly reduce the size of the resulting graphic output files.
}
\usage{
thinnedSpatialPoly(SP, tolerance, minarea=0)
}

\arguments{
  \item{SP}{
A SpatialPolygons or SpatialPolygonsDataFrame object
}
  \item{tolerance}{
tolerance used by the \code{\link[shapefiles]{dp}} function.  
The scale used for tolerance corresponds to the range of map coordinates, but
is not documented precisely.  If not supplied, the function uses the minimum range
of the bounding box of the map / 100.
}
  \item{minarea}{
The minimum area of polygons to keep in the resulting object.  The default,
\code{minarea=0} means that all polygons, even tiny bits and slivers are retained.
Typically, you will want to set this to something larger.
}
}
%\details{
%}
\value{
Returns an object of the same class as the input, \code{SP}.
}
\references{
Douglas, D. and Peucker, T. (1973). 
Algorithms for the reduction of the number of points required to represent a digitized line or its caricature.
\emph{The Canadian Cartographer}, 10(2). 112-122
}
\author{
Roger Bivand, packaged by Michael Friendly
}
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\section{Warning}{
The \code{\link[shapefiles]{dp}} function used here is not topology-preserving
and may create visual artifacts (slivers, overlapping boundaries).
}
\seealso{
\code{\link[shapefiles]{dp}}
}
\examples{
	object.size(gfrance)
## not run, because shapefiles::dp uses T and F, causing R CMD check to fail
\dontrun{
	gfrance_dp <- thinnedSpatialPoly(gfrance, tolerance=2500, minarea=500000)
	object.size(gfrance_dp)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{spatial}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
