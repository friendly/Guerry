## Test environments
* local Windows, 4.4.1 (2024-06-14 ucrt)
* win-builder R Under development (unstable) (2023-10-23 r85401 ucrt)
* R-hub: Windows Server 2022, R-devel, 64 bit; Ubuntu Linux 20.04.1 LTS, R-release, GCC

## R CMD check results

0 errors | 0 warnings | 1 note

Possibly misspelled words in DESCRIPTION:
  Guerry (3:42, 32:71)
  Guerry's (33:29)
  geospatial (34:76)

This note is points to words essential to the DESCRIPTION which should be retained w/o quoting.
I note that these win-builder spelling checks to not respect the `inst/WORDFILE`.

Package checks for v. 1.8.3 resulting from `adespatial` being archived have now been corrected.

However, the pretest-archived checks are still triggered, requiring manual inspection, and I'm stuck in
a loop. Please APPROVE the package re-submission.


## Reverse dependencies

There are no reverse dependencies

> devtools::revdep()
character(0)

## Version 1.8.4 (2025-01-01)

* Corrected numerous transcription errors in the Guerry data (thx: Kathryn DuBois)
* Added `Guerry_ranks`, with all numeric variables ranked
* Revised vignettes, using corrected data


