<!-- badges: start -->
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![CRAN status](https://www.r-pkg.org/badges/version/Guerry)](https://CRAN.R-project.org/package=Guerry)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/Guerry)](https://cran.r-project.org/package=Guerry)
[![](https://cranlogs.r-pkg.org/badges/grand-total/Guerry)](https://cran.r-project.org/package=Guerry)
[![Rdoc](https://www.rdocumentation.org/badges/version/Guerry)](http://www.rdocumentation.org/packages/Guerry)
<!-- badges: end -->

# Guerry

The `Guerry` package comprises maps of France in 1830, multivariate data from A.-M. Guerry and others, and statistical and 
	graphic methods related to Guerry's "Moral Statistics of France". The goal is to facilitate the exploration and
	development of statistical and graphic methods for multivariate data in a geo-spatial context of historical interest.

## Installation


You can install Guerry from CRAN with:


``` r
install.packages("Guerry")
```

You can install Guerry from github with:


``` r
# install.packages("devtools")
devtools::install_github("friendly/Guerry")
```

## Example

Plotting crimes against persons vs. Literacy ("% who can read & write").
In this base R version, we might want to code the point symbols 
and colors by regions of France.

``` r
data(Guerry)

plot(Crime_pers ~ Literacy, data=Guerry,
	col=Region, 
	pch=(15:19)[Region],
	ylab = "Pop. per crime against persons",
	xlab = "Percent who can read & write"
	)

legend(x="bottomright", 
	legend = c("Center", "East", "North", "South", "West"), 
	pch = 15:19,
	col = as.factor(levels(Guerry$Region)))
```

