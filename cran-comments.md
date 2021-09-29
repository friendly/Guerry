## Test environments
* local Windows, 4.0.2 (2020-06-22)
* win-builder R Under development (unstable) (2021-09-23 r80951)

## R CMD check results

0 errors | 0 warnings | 1 note

## Version 1.7.4 (resubmission)

* I apologise for the previous submission, dated 9/28/2021 which generated the note:

  Found the following (possibly) invalid URLs:
    URL: https://doi.org/10.1214/10-aoas356
      From: man/Guerry-package.Rd
      Status: 500
      Message: Internal Server Error

This did not appear in any of my checks, and has now been corrected.


* This is a minor release to fix a problem arising from the new release of `spdep` when `rgeos` is not installed. It also fixes
some minor problems that arose from CRAN testing of the previous submission, v 1.7.3.

The present version passes CMD check both with and without `rgeos`. 
It also passes with the development version of `spdep` with and without `rgeos`. 

Released `Guerry` now passes CMD check with the development version of `spdep`, with and without `rgeos`, issuing a warning if `rgeos` is absent and falling back on inefficient legacy code not using `spatial` indexing.

The 1 NOTE results because I was away on vacation and failed to fix this problem in time:

CRAN repository db overrides:
  X-CRAN-Comment: Archived on 2021-09-23 as check problems were not
    corrected in time.

In addition, I now get a useless false-positive note, below. This check ignores entries in `inst/WORDFILE` and should be abandonned.

Possibly misspelled words in DESCRIPTION:
  Guerry (3:42, 20:71)
  Guerry's (21:29)
  geospatial (22:76)
  
