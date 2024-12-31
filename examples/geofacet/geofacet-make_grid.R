#' ---
#' title: Try making grids
#' ---

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

data(gfrance, package = "Guerry")
data(gfrance85, package = "Guerry")

# extract department info
dept         <- data.frame(gfrance85)[,"dept"]   
dep.names    <- data.frame(gfrance85)[,"Department"]
region.names <- data.frame(gfrance85)[,"Region"]

# extract department centroids
xy <- coordinates(gfrance85) |>
  as.data.frame() |>
  setNames(c("x", "y")) 

make_grid <- function(nbin) {
  grid <- data.frame(
    #  row =  bin(xy$y, nbin),
    row = nbin - bin(xy$y, nbin) + 2 ,
    col = bin(xy$x, nbin),
    code = dept,
    name = as.character(dep.names),
    name_region =  factor(region.names, labels =c("Central", "East", "North", "South", "West")) 
  )
  dups <- which(duplicated(grid[, c("row", "col")]))
  cat("There are", sum(dups), "duplicates\n")
  if(sum(dup) > 0) {
    count(grid, row, col) |> 
      arrange(desc(n))    |>
      filter(n > 1) |> print()
  }
  cat("Ranges:\n")
  cat("\trow:", range(grid$row))
  cat("\tcol:", range(grid$col), "\n")
  
  return(grid)
}

gfrance85_grid17 <- make_grid(17)
gfrance85_grid16 <- make_grid(16)
gfrance85_grid15 <- make_grid(15)

grid_preview(gfrance85_grid15) +
  geom_text(aes(label=name), size=2, nudge_y=0.35)

#try the designer
grid_design(gfrance85_grid,
            img = "https://github.com/friendly/Guerry/blob/master/man/figures/README-gfrance85-labels-1.png?raw=true",
            label = "code")
