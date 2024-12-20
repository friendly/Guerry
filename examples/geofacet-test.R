
gfrance85_grid <- read.csv(file = "examples/gfrance85_grid.csv")

data(Guerry_ranks)

library(dplyr)
library(tidyr)
library(geofacet)
library(ggplot2)

# documentation example
ggplot(state_ranks, aes(variable, rank, fill = variable)) +
  geom_col() +
  coord_flip() +
  facet_geo(~ state, grid = "us_state_grid2") +
  theme(panel.spacing = unit(0.1, "lines"))


Guerry_ranks_long <- Guerry_ranks |>
  select(dept:Suicides) |>
  filter(dept != 200) |>
  pivot_longer(cols=Crime_pers:Suicides, 
               names_to = "variable",
               values_to = "rank")

ggplot(Guerry_ranks_long, aes(variable, rank, fill = variable)) +
  geom_col() +
  coord_flip() +
  facet_geo(~ dept, grid = gfrance85_grid) +
  theme(panel.spacing = unit(0.1, "lines"))
