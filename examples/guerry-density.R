#' ---
#' title: Density plots of Guerry data
#' ---

library(dplyr)     # A Grammar of Data Manipulation
library(tidyr)
library(ggplot2)   # Create Elegant Data Visualisations Using the Grammar of Graphics
library(scales)    # Scale Functions for Visualization
library(Guerry)    # Maps, Data and Methods Related to Guerry (1833) "Moral Statistics of France"

data("Guerry", package="Guerry")
guerry_long <- Guerry |>
  filter(!is.na(Region)) |>
  select(dept:Suicides) |>
  pivot_longer(cols = Crime_pers:Suicides,
               names_to = "variable",
               values_to = "value")
guerry_long

# density plot of each variable
ggplot(data = guerry_long,
       aes(x=value, fill=TRUE)) +
  geom_density(alpha=0.2) +
  facet_wrap(~variable, scales="free") +
  theme_bw(base_size = 16) +
  theme(legend.position = "none",
        axis.ticks.y=element_blank(),
        axis.text.y=element_blank())

# by region
col.region   <- colors()[c(149, 254, 468, 552, 26)] # colors for region
ggplot(data = guerry_long,
       aes(x=value, fill=Region)) +
  geom_density(alpha=0.2) +
  facet_wrap(~variable, scales="free") +
  scale_fill_manual(values=col.region) +
  theme_bw(base_size = 16) +
  theme(legend.position = "bottom",
        axis.ticks.y=element_blank(),
        axis.text.y=element_blank())

     

