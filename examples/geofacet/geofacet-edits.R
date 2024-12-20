library(dplyr)
library(geofacet)
library(ggplot2)

gfrance85_grid_ed <- read.csv(file = "examples/geofacet/gfrance85_grid_edited.csv")
range(gfrance85_grid_ed$row)
range(gfrance85_grid_ed$col)


gfrance85_grid_ed <- gfrance85_grid_ed |>
  mutate(row = row - min(row) + 1,
         col = col - min(col) + 1)

range(gfrance85_grid_ed$row)
range(gfrance85_grid_ed$col)

grid_preview(gfrance85_grid_ed) +
  geom_text(aes(label=name), size=2, nudge_y=0.35) 
#  coord_equal()

write.csv(gfrance85_grid_ed, file = "examples/geofacet/gfrance85_grid_ed.csv")

