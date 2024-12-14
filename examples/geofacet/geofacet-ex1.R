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

# extract department info
dept         <- data.frame(gfrance85)[,"dept"]   
dep.names    <- data.frame(gfrance85)[,"Department"]
region.names <- data.frame(gfrance85)[,"Region"]

# extract department centroids
xy <- coordinates(gfrance85) |>
  as.data.frame() |>
  setNames(c("x", "y")) 

# make the grid data.frame

nbin <- 17
gfrance85_grid <- data.frame(
  #  row =  bin(xy$y, nbin),
  row = nbin - bin(xy$y, nbin) + 2 ,
  col = bin(xy$x, nbin),
  code = dept,
  name = as.character(dep.names),
  name_region =  factor(region.names, labels =c("Central", "East", "North", "South", "West")) 
)

 
names(gfrance85_grid)

# check for duplicates
which(duplicated(gfrance85_grid[, c("row", "col")]))

#count(gfrance85_grid, row, col) %>% arrange(desc(n))


range(gfrance85_grid$row)
range(gfrance85_grid$col)

write.csv(gfrance85_grid, file = "examples/gfrance85_grid.csv", row.names = FALSE)



col.region <- colors()[c(149,254,468,552,26)] |>
  scales::alpha(alpha = 0.2)

gfrance85_grid |>
  ggplot(aes(x = col, y = row, fill = name_region)) +
  geom_tile(color = "black") +
  geom_text(aes(label = code), size = 4, nudge_y = .2) +
  geom_text(aes(label = name), size = 2, nudge_y = -.2) +
  scale_y_reverse() +
  coord_equal() +
  theme_minimal(base_size = 14) +
  theme(legend.position = "none")


grid_preview(gfrance85_grid, label="name")

grid_preview(gfrance85_grid) +
  geom_text(aes(label=name), size=2, nudge_y=0.35) +
  
#Error: Other than 'row' and 'col', variable names of a custom grid must begin with 'code' or 'name'

# works, if I remove 'region'
grid_preview(gfrance85_grid[, -5]) +
  geom_text(aes(label=name), size=2, nudge_y=0.35)


# try grid_auto

grd <- grid_auto(gfrance85, names = "Department", codes = "dept", seed = 47)
range(grd$row)
range(grd$col)

grid_preview(grd, label = "name_Department") +
  geom_text(aes(label=name), size=2, nudge_y=0.35)


# other faceted maps of france
# 7 x 7, including overseas
str(fr_regions_grid1)
grid_preview(fr_regions_grid1)

str(fr_departements_grid1)
grid_preview(fr_departements_grid1)
