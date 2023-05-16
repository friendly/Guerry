library(geofacet)
library(ggplot2)
library(dplyr)
library(tidyr)
library(Guerry)
library(sp)

#ggplot(state_ranks, aes(variable, rank, fill = variable)) +
#  geom_col() +
#  coord_flip() +
#  theme_bw() +
#  facet_geo(~ state, grid = "us_state_grid2")

grid_preview("fr_regions_grid1")  

grid_preview("fr_departements_grid1")
#grid_preview("fr_departements_grid2")

# includes 970s outside metro france
z1 <- grid_preview("fr_departements_grid1") +
   geom_text(aes(label=name), size=2, nudge_y=0.35)

# excludes those and Corsica
z2 <- grid_preview("fr_departements_grid2") +
  geom_text(aes(label=name), size=2, nudge_y=0.35)

# modify grid to collapse Corsica (2A, 2B) and remove territories

fr_departements_1830 <- fr_departements_grid1 %>%
	filter(nchar(code) < 3) %>%
	filter(code != "2B") %>%
	mutate(code = ifelse(code == "2A", "200", code))

fr_departements_1830 <- fr_departements_grid2 %>%
  filter(nchar(code) < 3) %>%
  filter(code != "2B") %>%
  mutate(code = ifelse(code == "2A", "200", code))


str(fr_departements_1830)
grid_preview("fr_departements_1830")	

# grid 'fr_departements_1830' not found in package, checking online...
# Error in get_grid(x) : grid 'fr_departements_1830' not recognized...

# extract pieces
df           <- data.frame(Guerry)[, 4:9]    # the 6 variables
dept         <- 
dep.names    <- data.frame(Guerry)[, 3]       # departement names
region.names <- data.frame(Guerry)[, 2]       # region names
col.region   <- colors()[c(149, 254, 468, 552, 26)] # colors for region

df <- Guerry[,1:9]
# ranks


df %>% mutate(
             Crime_pers = dense_rank(Crime_pers),
             Crime_prop = dense_rank(Crime_prop),
             Literacy   = dense_rank(Literacy),
             Donations  = dense_rank(Donations),
             Infants    = dense_rank(Infants),
             Suicides   = dense_rank(Suicides)
) -> df_ranks

ggplot(df_ranks, aes(Crime_pers)) +
	geom_point() +
	facet_geo(~dept, grid = "fr_departements_1830")

# Some values in the specified facet_geo column 'dept' do not match the 'code' column of the specified grid and will be removed: 1,
# 2, 3, 4, 5, 7, 8, 9, 17, 22, 23, 29, 50, 55, 59, 61, 62, 69, 70, 78, 87, 89, 200
# Error in `levels<-`(`*tmp*`, value = as.character(levels)) : 
#   factor level [33] is duplicated

# transform to long format

tidyr::pivot_longer(df_ranks, cols = Crime_pers:Suicides, names_to = "variable") 

#ggplot(df_ranks, aes  