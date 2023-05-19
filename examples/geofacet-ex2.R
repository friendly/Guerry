#' ---
#' title: Use gfrance grid for geofacet package
#' ---
#' 

#library(sp)
library(geofacet)
library(ggplot2)
library(dplyr)
library(tidyr)
library(Guerry)


gfrance85_grid <- read.csv(file = "examples/gfrance85_grid.csv")


range(gfrance85_grid$row)
range(gfrance85_grid$col)

grid_preview(gfrance85_grid) +
  geom_text(aes(label=name), size=2, nudge_y=0.35)

# need to reverse the rows to table order
gfrance85_grid$row <- 19 - gfrance85_grid$row
grid_preview(gfrance85_grid) +
  geom_text(aes(label=name), size=2, nudge_y=0.35)

