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
He provided the first essentially multivariate and georeferenced spatial data
on socially important questions, e.g., Is the rate of crime related to education
or literacy?  How does this vary over the departments of France?
Are the rates of crime or suicide within departments stable over time?

In an age well before the idea of correlation had been invented, Guerry
used graphics and statistical maps to try to shed light on such questions.
In a later work (Guerry, 1864), he explicitly tried to entertain larger questions,
but with still-limited statistical tools:  Can rates of various crimes be related
to multiple causes or predictors? Are the rates and ascribable causes in France 
similar or different to those found in England?

The \pkg{Guerry} package comprises maps of France in 1830, multivariate data from A.-M. Guerry and others, and 
statistical and graphic methods related to Guerry's \emph{Moral Statistics of France}.
The goal of providing these as an R package is to facilitate the exploration and
development of statistical and graphic methods for multivariate data in a
geo-spatial context.
}
\details{
\tabular{ll}{
Package: \tab Guerry\cr
Type: \tab Package\cr
Version: \tab 1.5-0\cr
Date: \tab 2011-11-02\cr
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

Guerry, A.-M. (1864).
\emph{Statistique morale de l'Angleterre comparée avec la statistique morale de la France, d'après les comptes de l'administration de la justice criminelle en Angleterre et en France, etc.} 
Paris: J.-B. Baillière et fils.

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
