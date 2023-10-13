## Test environments
* local Windows, 4.2.2 (2022-10-31 ucrt)
* win-builder R Under development (unstable) (2023-10-12 r85324 ucrt)
* R-hub: Windows Server 2022, R-devel, 64 bit; Ubuntu Linux 20.04.1 LTS, R-release, GCC

## R CMD check results

0 errors | 0 warnings | 1 note

Possibly misspelled words in DESCRIPTION:
  Guerry (3:42, 32:71)
  Guerry's (33:29)
  geospatial (34:76)

This note is points to words essential to the DESCRIPTION which should be retained w/o quoting.
I note that these win-builder spelling checks to not respect the `inst/WORDFILE`.

Package checks for v. 1.8.3 now corrected

## Reverse dependencies

Only one package depends on Guerry as a `Suggests:`, because it uses the Guerry data in examples.

> devtools::revdep()
[1] "adegraphics"


## Version 1.8.3 (2023-10-13)

A problem with the `adegraphics` package becoming archived triggered a warning on `Guerry`
threatening the same fate. I did not reply in time, and so `Guerry` was archived.
This re-submission fixes that and other issues found by win-builder.

* Fix latin1 encoding issue
* Add reference to Friendly (2022)
* Moved a number of examples/ to demo/

