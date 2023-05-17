#' ---
#' title: Create gfrance grid for geofacet package
#' ---
#' 

library(sp)
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
                             col = bin(xy$x, nbin),
                             row = bin(xy$y, nbin),
                             region = region.names) |>
  mutate(region = factor(region, 
                         labels =c("Central", "East", "North", "South", "West")))
  
head(gfrance85_grid)

# check for duplicates
which(duplicated(gfrance85_grid[, c("row", "col")]))

# gfrance85_grid |>
#   mutate(label = paste(code, "\n", name)) |>
#   ggplot(aes(x = row, y = col)) +
#   geom_tile(color = "black",
#             fill = scales::alpha("blue", .3)) +
#   geom_text(aes(label = label), size = 2) +
#   coord_equal()

col.region <- colors()[c(149,254,468,552,26)] |>
  scales::alpha(alpha = 0.2)

gfrance85_grid |>
  ggplot(aes(x = col, y = row, fill = region)) +
  geom_tile(color = "black") +
  geom_text(aes(label = code), size = 3, nudge_y = .2) +
  geom_text(aes(label = name), size = 2, nudge_y = -.2) +
  coord_equal()



write.csv(gfrance85_grid, file = "examples/gfrance85_grid.csv", row.names = FALSE)


grid_preview("gfrance85_grid") +
  geom_text(aes(label=name), size=2, nudge_y=0.35)

