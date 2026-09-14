## Test environments
* local Windows 11 x64, R 4.6.1 (2026-06-24 ucrt)
* win-builder R Under development (unstable) (2026-09-13 r90534 ucrt)

## R CMD check results
0 error(s) | 0 warning(s) | 0 note(s)

## Reverse dependencies checks

We checked 2 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

* We saw 0 new problems
* We failed to check 0 packages


## Comments

## Version 1.8.5

* Added a new vignette, `guerry-sf-maps`, showing Guerry's maps with `sf` and `ggplot2::geom_sf()`,
including a reproduction of the six main "moral variables" as small multiples and a discussion of
Guerry's own light/dark color convention, illustrated with his 1833 `Instruction` map
* Fixed a clipped variable label in the HE plot in `guerry-multivariate`
* Added a pkgdown documentation-site badge, section icons and a dynamic version/build-date line to `README.Rmd`
* Migrated dataset documentation from hand-written `man/*.Rd` files to roxygen2 (internal, no
user-facing changes to help pages)
* Restored the `CODE_DEPT`, `COUNT` and `AVE_ID_GEO` shapefile-identifier columns to `gfrance`
and `gfrance85`, inadvertently dropped in the unreleased 1.8.4 data corrections. This had
shifted every later column left by 3, silently breaking `gfrance85`'s own documented example
(`[,5]`/`[,7:12]` positional indexing) and the `adegraphics` package's reverse-dependency tests
and vignette, which index `gfrance85` the same way
* Added `@importClassesFrom sp SpatialPolygonsDataFrame`, clearing the long-standing "Namespace
in Imports field not imported from: 'sp'" `R CMD check` NOTE (`gfrance`/`gfrance85`/`Angeville`
are `sp`-class objects, so `sp` must stay a hard dependency, but nothing in `R/` code called it
directly)

## Version 1.8.4 (2025-01-01)

* Corrected numerous transcription errors in the Guerry data (thx: Kathryn DuBois)
* Added `Guerry_ranks`, with all numeric variables ranked
* Revised vignettes, using corrected data

