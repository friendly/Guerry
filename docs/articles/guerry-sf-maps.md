# Guerry data: Maps with sf and ggplot2

The maps in this package (`gfrance`, `gfrance85`) were originally built
as `sp` `SpatialPolygonsDataFrame` objects, and the other vignettes and
the README use the older
[`sp::spplot()`](https://edzer.github.io/sp/reference/spplot.html)
function to display them. The current standard toolchain for spatial
visualization in R is the [`sf`](https://r-spatial.github.io/sf/)
package, together with
[`ggplot2::geom_sf()`](https://ggplot2.tidyverse.org/reference/ggsf.html).
This short vignette shows how to work with Guerry’s map data that way.

This doesn’t replace the
`sp`/[`spplot()`](https://edzer.github.io/sp/reference/spplot.html)
examples used elsewhere in the package – both remain fully supported –
it’s simply the modern alternative for anyone building on `Guerry`’s map
data in a `ggplot2` workflow.

``` r
library(Guerry)
library(sf)
library(ggplot2)
library(dplyr)
library(tidyr)
data(gfrance85)
data(Guerry_ranks)
```

## Converting to `sf`

Converting the shipped `sp` object to `sf` is a single call to
[`sf::st_as_sf()`](https://r-spatial.github.io/sf/reference/st_as_sf.html):

``` r
gf_sf <- st_as_sf(gfrance85)
class(gf_sf)
#> [1] "sf"         "data.frame"
```

The result is an ordinary data frame with a `geometry` list-column, so
it can be manipulated with usual tools (`dplyr`, `tidyr`, …) before
plotting.

## A basic map

[`geom_sf()`](https://ggplot2.tidyverse.org/reference/ggsf.html) handles
the geometry column automatically; no need to supply `x`/`y` aesthetics.

``` r
ggplot(gf_sf) +
  geom_sf(fill = "grey90", color = "white") +
  theme_void()
```

![](guerry-sf-maps_files/figure-html/sf-basic-1.png)

## Choropleth maps

Mapping a variable to `fill` gives a choropleth map. Here, `Literacy`
(percent of military conscripts who could read and write), using the
same `PuBu` palette used elsewhere in this package for “more is better”
variables.

``` r
ggplot(gf_sf) +
  geom_sf(aes(fill = Literacy), color = "white", linewidth = 0.2) +
  scale_fill_distiller(palette = "PuBu", direction = 1, name = "Literacy") +
  theme_void()
```

![](guerry-sf-maps_files/figure-html/sf-choropleth-1.png)

## Small multiples of the main variables

The package README shows a static image of six choropleth maps of
Guerry’s main “moral variables”. Here is a living, code-generated
version of the same idea, using
[`facet_wrap()`](https://ggplot2.tidyverse.org/reference/facet_wrap.html)
and the pre-ranked `Guerry_ranks` data set (rank 1 = best, 86 = worst on
each variable):

``` r
main_vars <- c("Crime_pers", "Crime_prop", "Literacy", "Donations", "Infants", "Suicides")

ranks_sf <- gf_sf |>
  select(dept) |>
  left_join(Guerry_ranks |> select(dept, all_of(main_vars)), by = "dept") |>
  pivot_longer(cols = all_of(main_vars), names_to = "variable", values_to = "rank")

ggplot(ranks_sf) +
  geom_sf(aes(fill = rank), color = NA) +
  facet_wrap(~ variable) +
  scale_fill_distiller(palette = "PuBu", direction = -1, name = "Rank") +
  theme_void() +
  theme(strip.text = element_text(size = 11, face = "bold"))
```

![](guerry-sf-maps_files/figure-html/sf-facet-1.png)

## Region map with department labels

Finally, a map colored by `Region`, with department names added via
[`geom_sf_text()`](https://ggplot2.tidyverse.org/reference/ggsf.html) –
the `sf`/`ggplot2` equivalent of the
[`plot()`](https://rdrr.io/r/graphics/plot.default.html) +
[`text()`](https://rdrr.io/r/graphics/text.html) approach used for this
same map in the README.

``` r
col.region <- colors()[c(149, 254, 468, 552, 26)]  # same colors used in the README

ggplot(gf_sf) +
  geom_sf(aes(fill = Region), color = "white", linewidth = 0.3) +
  geom_sf_text(aes(label = Department), size = 2, check_overlap = TRUE) +
  scale_fill_manual(values = col.region) +
  theme_void()
```

![](guerry-sf-maps_files/figure-html/sf-region-1.png)

## Next steps

A themed, styled version of these maps using the historical color
palettes and patterns of the
[`ggCheysson`](https://github.com/friendly/ggCheysson) package is
planned once that package reaches CRAN.
