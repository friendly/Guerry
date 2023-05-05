## Test environments
* local Windows, 4.2.2 (2022-10-31 ucrt)
* win-builder R Under development (unstable) (2023-05-03 r84386 ucrt)
* Debian R Under development (unstable) (2022-10-06 r83040)

## R CMD check results

0 errors | 0 warnings | 0 note


Package checks for v. 1.8.0 all OK: https://cran.r-project.org/web/checks/check_results_Guerry.html

## Reverse dependencies

Only one package depends on Guerry as a `Suggests:`, because it uses the Guerry data in examples.

> devtools::revdep()
[1] "adegraphics"


## Version 1.8.1 (2023-05-05)

This is largely a maintenance release to correct a problem with latin1 encoding used in the DESCRIPTION.
and in man/Guerry.Rd.

* Fix latin1 encoding issue
* Add reference to Friendly (2022)
* Moved a number of examples/ to demo/

