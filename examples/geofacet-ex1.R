#' ---
#' title: Create gfrance grid for geofacet package
#' ---
#' 

library(geofacet)
library(ggplot2)
library(dplyr)
library(tidyr)
library(Guerry)


# scale a variable into n integer bins
bin <- function(x, n=10){
  1 + floor(n * (x - min(x)) / (max(x) - min(x)))
}

data(gfrance85, package = "Guerry")

dept         <- data.frame(gfrance85)[,"dept"]   
dep.names    <- data.frame(gfrance85)[,"Department"]
region.names <- data.frame(gfrance85)[,"Region"]


# extract department centroids
xy <- coordinates(gfrance85) |>
  as.data.frame() |>
  setNames(c("x", "y")) 

# make the grid data.frame
nbin <- 17
gfrance85_grid <- data.frame(code = dept,
                             name = as.character(dep.names),
                             row = bin(xy$x, nbin),
                             col = bin(xy$y, nbin))
head(gfrance85_grid)

# check for duplicates
which(duplicated(gfrance85_grid[, c("row", "col")]))

write.csv(gfrance85_grid, file = "examples/gfrance85_grid.csv", row.names = FALSE)


grid_preview("gfrance85_grid") +
  geom_text(aes(label=name), size=2, nudge_y=0.35)

