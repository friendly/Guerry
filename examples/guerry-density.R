#' ---
#' title: Density plots of Guerry data
#' ---

library(dplyr)     # A Grammar of Data Manipulation
library(tidyr)
library(ggplot2)   # Create Elegant Data Visualisations Using the Grammar of Graphics
library(scales)    # Scale Functions for Visualization
library(Guerry)    # Maps, Data and Methods Related to Guerry (1833) "Moral Statistics of France"

guerry_long <- Guerry |>
  filter(!is.na(Region)) |>
  select(dept:Suicides) |>
  pivot_longer(cols = Crime_pers:Suicides,
               names_to = "variable",
               values_to = "value")

ggplot(data = guerry_long,
       aes(x=value, fill=Region)) +
  geom_density(alpha=0.2) +
  facet_grid(~variable, scales="free")

