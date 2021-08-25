library(dplyr)
library(ggplot2)
library(ggradar)
library(scales)
library(Guerry)
data(Guerry)

guerry_sumry <- Guerry[,c(2,4:9)] %>%
  group_by(Region) %>%
  summarise(Crime_pers= mean(Crime_pers),
            Crime_prop = mean(Crime_prop),
            Literacy = mean(Literacy),
            Donations = mean(Donations),
            Infants = mean(Infants),
            Suicides = mean(Suicides),
            ) %>%
  ungroup() %>%
  mutate_at(vars(-Region), rescale)

guerry_sumry %>%
  ggradar(
    grid.label.size = 4, axis.label.size = 2.7,
    group.point.size = 3,
    legend.position = "bottom",legend.text.size = 7,
    plot.title = "Radar plot of Guerry data") +
  theme(
    legend.text = element_text(size=9, family = ""),
    legend.title = element_text(face="bold", size=12, family = ""),
    legend.position = c(1,0),
    legend.justification = c(1, 0),
    legend.key  = element_rect(fill = NA, color = NA),
    text = element_text(family = "", size = 8, color = "black"),
    plot.title = element_text(size = 20,
                              face = "bold", color="#2a475e"),
    plot.subtitle = element_text(family = "", size = 15, 
                                 face = "bold", color="#1b2838"),
    rect = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    plot.title.position = "plot",
    panel.grid.major.y = element_blank(),
    axis.ticks = element_blank(),
    axis.line = element_blank(),
    plot.background = element_rect(fill = '#fbf9f4', color = '#fbf9f4')
  )

