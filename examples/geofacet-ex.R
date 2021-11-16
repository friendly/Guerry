library(geofacet)
library(ggplot2)
library(Guerry)
library(sp)

#ggplot(state_ranks, aes(variable, rank, fill = variable)) +
#  geom_col() +
#  coord_flip() +
#  theme_bw() +
#  facet_geo(~ state, grid = "us_state_grid2")

grid_preview("fr_regions_grid1")  

grid_preview("fr_departements_grid1")
grid_preview("fr_departements_grid2")

# modify grid to collapse Corsica (2A, 2B) and remove territories

fr_departements_1830 <- fr_departements_grid1 %>%
	filter(nchar(code) < 3) %>%
	filter(code != "2B") %>%
	mutate(code = ifelse(code == "2A", "200", code)) 

str(fr_departements_1830)
	


# extract pieces
df           <- data.frame(Guerry)[, 4:9]    # the 6 variables
dept         <- 
dep.names    <- data.frame(Guerry)[, 3]       # departement names
region.names <- data.frame(Guerry)[, 2]       # region names
col.region   <- colors()[c(149, 254, 468, 552, 26)] # colors for region

df <- Guerry[,1:9]
# ranks

#df %>% mutate_all(funs(dense_rank(desc(.))))


df %>% mutate(
             Crime_pers = dense_rank(Crime_pers),
             Crime_prop = dense_rank(Crime_prop),
             Literacy   = dense_rank(Literacy),
             Donations  = dense_rank(Donations),
             Infants    = dense_rank(Infants),
             Suicides   = dense_rank(Suicides)
) -> df_ranks

ggplot(df_ranks, aes(Crime, pers)) +
	geom_point() +
	facet_geo(~dept, gr 

# transform to long format

gather(df_ranks, 

ggplot(df_ranks, aes  