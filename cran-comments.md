## Test environments
* local Windows, 4.2.1 (2022-06-23 ucrt)
* win-builder R Under development (unstable) (2022-10-05 r83033 ucrt)
* Debian R Under development (unstable) (2022-10-06 r83040)

## R CMD check results

0 errors | 0 warnings | 0 note

On Debian, there was one Note never seen before:

* checking package subdirectories ... NOTE
Problems with news in ‘NEWS’:
  Cannot process chunk/lines:
    Version 1.6 (2014-09-23)
    	Removed MultiSpat vignette because it is no longer compatible with CRAN policies. The old
    	PDF version will be made available on the R-Forge project page.
    	Removed Suggests: spacemakeR (not on CRAN); moved sp, shapefiles to Suggests:
    	Removed thinSpatialPoly, as this is now provided in maptools
    	Made some examples in gfrance.Rd \dontrun{} to reduce check time
   ...
   
This has been fixed by making the indented lines * items.  

Package checks for v. 1.7.4 all OK: https://cran.r-project.org/web/checks/check_results_Guerry.html

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
