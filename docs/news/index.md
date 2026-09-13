# Changelog

## Version 1.8.4 (2025-01-01)

- Corrected numerous transcription errors in the Guerry data (thx:
  Kathryn DuBois)
- Added `Guerry_ranks`, with all numeric variables ranked
- Revised vignettes, using corrected data
- Added a new vignette, `guerry-sf-maps`, showing Guerry’s maps with
  `sf` and
  [`ggplot2::geom_sf()`](https://ggplot2.tidyverse.org/reference/ggsf.html)
- Fixed a clipped variable label in the HE plot in `guerry-multivariate`

## Version 1.8.3 (2023-10-13)

CRAN release: 2023-10-24

A problem with the adegraphics package becoming archived triggered a
warning on Guerry threatening the same fate. I did not reply in time,
and so Guerry was archived. This re-submission fixes that and other
issues found by win-builder.

- Moved some examples to `demo/`
- Edit example in `gfrance85.Rd`
- Restore use of `adegraphics` for vignette `MultiSpat.Rmd`
- The `demo/guerry_ggradar.R` used a non-CRAN package; this package has
  been removed from Suggests: and the example moved to `examples/`.

## Version 1.8.2 (2023-05-10)

- Incorporate parallel coord plots and radar charts in vignette

## Version 1.8.1 (2023-05-05)

CRAN release: 2023-05-05

- This is largely a maintenance release to correct a problem with latin1
  encoding used in the DESCRIPTION and in man/ files. All non-ascii
  characters have been removed.
- Add reference to Friendly (2022)
- Moved a number of examples/ to demo/

## Version 1.8.0 (2022-10-04)

CRAN release: 2022-10-08

- Fixed problems related to retirement of `maptools`
  [\#4](https://github.com/friendly/Guerry/issues/4), deleting Suggests:
  maptools
- Added a new vignette, `guerry-multivariate`, illustrating some
  multivariate methods
- Extensively revised README to give a better sense of the package
  datasets and some plots.

## Version 1.7.4

CRAN release: 2021-09-29

- Restore MultiSpat vignette

## Version 1.7.3

- begin guerry-multivariate vignette
- Fixed problem arising from new spdep when rgeos is not installed
  \[thx: Roger Bivand\]

## Version 1.7.1

CRAN release: 2021-07-29

- translate/update/restore the main vignette, `MultiSpat.html` by
  Stephane Drey

## Version 1.7.0

CRAN release: 2020-01-29

- Update links to Guerry supplementary stuff to resolve CRAN nits
- move `sp` to `Imports:` to resolve CRAN nits
- Removed Suggests: shapefiles
- added a hexsticker to README.md

## Version 1.6-2

- Package development has been moved from R-forge to github,
  <https://github.com/friendly/Guerry>
- Updated Guerry-package.Rd from
  [`utils::promptPackage()`](https://rdrr.io/r/utils/promptPackage.html)

## Version 1.6 (2014-09-23)

- Removed MultiSpat vignette because it is no longer compatible with
  CRAN policies. The old PDF version will be made available on the
  R-Forge project page.

- Removed Suggests: spacemakeR (not on CRAN); moved sp, shapefiles to
  Suggests:

- Removed thinSpatialPoly, as this is now provided in maptools

- Made some examples in gfrance.Rd to reduce check time

## Version 1.5 (2011-11-08)

- Added back MultiSpat.Rnw vignette with MultiSpat.tex disguised as
  MultiSpat.Rnw
- Added NAMESPACE for R 2.14+

## Version 1.4 (2010-02-15)

CRAN release: 2010-02-16

- Remove temporarily MultiSpat.Rnw vignette

## Version 1.3 (2009-11-19)

CRAN release: 2009-12-03

- Added thinnedSpatialPoly to calculate thinned maps
- Added MultiSpat.Rnw vignette

## Version 1.2 (2009-11-12)

- Added MultiSpat.pdf vignette (without .Rnw)

## Version 1.1 (2009-10-28)

CRAN release: 2009-10-30

- Added Angeville data
- Released to CRAN

## Version 1.0 (2009-10-20)

- Initial version uploaded to R-Forge
