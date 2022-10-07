## Test environments
* local Windows, 4.2.1 (2022-06-23 ucrt)
* win-builder R Under development (unstable) (2022-10-05 r83033 ucrt)

## R CMD check results

0 errors | 0 warnings | 0 note

## Reverse dependencies

Only one package depends on Guerry as a `Suggests:`, because it uses the Guerry data in examples.

> devtools::revdep()
[1] "adegraphics"


## Version 1.8.0 (2022-10-04)

This is a major release of the Guerry package, occasioned by the planned retirement of the `mapstools` package,
previously listed as a "Suggests".

* Fixed problems related to retirement of `maptools` #4, deleting Suggests: maptools
* Added a new vignette, `guerry-multivariate`, illustrating some multivariate methods
* Extensively revised README to give a better sense of the package datasets and some plots.
