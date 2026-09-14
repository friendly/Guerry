#' Maps, Data and Methods Related to Guerry (1833) "Moral Statistics of France"
#'
#' Andre-Michel Guerry (1833) was the first to systematically collect and
#' analyze social data on such things as crime, literacy and suicide with the
#' view to determining social laws and the relations among these variables.
#' He provided the first essentially multivariate and georeferenced spatial
#' data on socially important questions, e.g., Is the rate of crime related
#' to education or literacy? How does this vary over the departments of
#' France? Are the rates of crime or suicide within departments stable over
#' time?
#'
#' In an age well before the idea of correlation had been invented, Guerry
#' used graphics and statistical maps to try to shed light on such questions.
#' In a later work (Guerry, 1864), he explicitly tried to entertain larger
#' questions, but with still-limited statistical tools: Can rates of various
#' crimes be related to multiple causes or predictors? Are the rates and
#' ascribable causes in France similar or different to those found in
#' England?
#'
#' The \pkg{Guerry} package comprises maps of France in 1830, multivariate
#' data from A.-M. Guerry and others (Angeville, 1836), and statistical and
#' graphic methods related to Guerry's *Moral Statistics of France*. The goal
#' of providing these as an R package is to facilitate the exploration and
#' development of statistical and graphic methods for multivariate data in a
#' geo-spatial context.
#'
#' Data sets included in the Guerry package are:
#'
#' \describe{
#'   \item{[`Guerry`]}{Data from A.-M. Guerry, "Essay on the Moral Statistics
#'     of France"}
#'   \item{[`Guerry_ranks`]}{Ranks of Data from A.-M. Guerry, "Essay on the
#'     Moral Statistics of France"}
#'   \item{[`gfrance`]}{Map of France in 1830 with the Guerry data}
#'   \item{[`gfrance85`]}{Map of France in 1830 with the Guerry data,
#'     excluding Corsica}
#'   \item{[`Angeville`]}{Data from d'Angeville (1836) on the population of
#'     France}
#'   \item{[`propensity`]}{Distribution of crimes against persons at
#'     different ages}
#' }
#'
#' @details
#' Data from Guerry and others is contained in the data frame [`Guerry`].
#' Because Corsica is often considered an outlier both spatially and
#' statistically, the map of France circa 1830, together with the Guerry
#' data, is provided as `SpatialPolygonsDataFrame`s in two forms: [`gfrance`]
#' for all 86 departments, and [`gfrance85`], for the 85 departments
#' excluding Corsica.
#'
#' @name Guerry-package
#' @aliases Guerry-package _PACKAGE
#' @importClassesFrom sp SpatialPolygonsDataFrame
#' @author Michael Friendly, Stephane Dray
#'
#' Maintainer: Michael Friendly <friendly@yorku.ca>
#' @references
#' d'Angeville, A. (1836). *Essai sur la Statistique de la Population
#' francaise*, Paris: F. Darfour.
#'
#' Dray, S. and Jombart, T. (2011). A Revisit Of Guerry's Data: Introducing
#' Spatial Constraints In Multivariate Analysis. *The Annals of Applied
#' Statistics*, 5(4).
#'
#' Brunsdon, C. and Dykes, J. (2007). Geographically weighted visualization:
#' interactive graphics for scale-varying exploratory analysis. Geographical
#' Information Science Research Conference (GISRUK 2007). NUI Maynooth,
#' Ireland, April, 2007.
#' <https://www.maynoothuniversity.ie/national-centre-geocomputation-ncg>.
#'
#' Friendly, M. (2007). A.-M. Guerry's Moral Statistics of France: Challenges
#' for Multivariable Spatial Analysis. *Statistical Science*, 22, 368-399.
#' <http://www.datavis.ca/papers/guerry-STS241.pdf>
#'
#' Friendly, M. (2007). Supplementary materials for Andre-Michel Guerry's
#' Moral Statistics of France: Challenges for Multivariate Spatial Analysis,
#' <http://www.datavis.ca/gallery/guerry/>.
#'
#' Friendly, M. (2022). The life and works of Andre-Michel Guerry, revisited.
#' *Sociological Spectrum*, **42**, 233-259.
#' \doi{10.1080/02732173.2022.2078450}
#'
#' Guerry, A.-M. (1833). *Essai sur la statistique morale de la France*
#' Paris: Crochard. English translation: Hugh P. Whitt and Victor W.
#' Reinking, Lewiston, N.Y.: Edwin Mellen Press, 2002.
#'
#' Guerry, A.-M. (1864). *Statistique morale de l'Angleterre comparee avec la
#' statistique morale de la France, d'apres les comptes de l'administration
#' de la justice criminelle en Angleterre et en France, etc.* Paris:
#' J.-B. Bailliere et fils.
#' @keywords package
#' @keywords spatial data
NULL
