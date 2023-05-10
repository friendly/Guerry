#' ---
#' title: Guerry - Parallel coordinates plot
#' ---

data(Guerry, package = "Guerry")
library(ggpcp)
library(dplyr)
library(ggplot2)
library(seriation)

guerry <- Guerry[, c(2, 3, 4:9)]

Guerry_ranks <- Guerry |>
  select(1:9) |>
  mutate(across(Crime_pers:Suicides, dense_rank))


#'## find an ordering of variables to put highly correlated variables together
guerry.order <- Guerry_ranks |>
  filter(!is.na(Region)) |>
  select(Crime_pers:Suicides) |>
  seriate(method = "PCA_angle") |> 
  get_order(2)

Guerry_ranks |>
  filter(!is.na(Region)) |>
  mutate(Region = factor(Region, 
                         labels =c("Central", "East", "North", "South", "West"))) |>
  mutate(across(Crime_pers:Suicides, dense_rank)) |>

  pcp_select(Region, names(guerry.order)) |>
  pcp_scale(method="uniminmax") |>
  pcp_arrange() |>
  ggplot(aes_pcp()) + 
  geom_pcp_axes() + 
  geom_pcp(aes(colour = Region), linewidth = 1) +
  geom_pcp_labels() +
  xlab("Variable") +
  ylab("Percent of maximum rank") +
  theme_bw(base_size = 14) +
  theme(legend.position = 'bottom') 

