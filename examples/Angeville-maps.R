library(Guerry)
library(sp)
library(RColorBrewer)
#library(rgeos)
#library(dplyr, warn.conflicts = FALSE)

data(Guerry)
data(gfrance)
data(Angeville)


my.palette <- rev(brewer.pal(n = 9, name = "PuBu"))

gf <- gfrance   # the SpatialPolygonsDataFrame

# gf$Crime_pers <- rank(gfrance$Crime_pers)
# gf$Crime_prop <- rank(gfrance$Crime_prop)
# gf$Literacy   <- rank(gfrance$Literacy)
# gf$Donations  <- rank(gfrance$Donations)
# gf$Infants    <- rank(gfrance$Infants)
# gf$Suicides   <- rank(gfrance$Suicides)


# Add some Angeville variables
gf$Mortality     <- rank(Angeville$Mortality)
gf$Marriages     <- rank(Angeville$Marriages)
gf$Legit_births  <- rank(Angeville$Legit_births)
gf$Illeg_births  <- rank(Angeville$Illeg_births)
gf$Farmers       <- rank(Angeville$Farmers)
gf$Schoolchildren  <- rank(Angeville$Schoolchildren)


# # do this with dplyr::across() ?
# gf |>
#   mutate(across(Crime_pers:Suicides, rank))

spplot(gf, 
       c("Mortality", "Marriages", "Legit_births",  "Illeg_births", "Farmers", "Schoolchildren"),
       names.attr = c("Mortality", "Marriages", "Legit_births",  "Illeg_births", "Farmers", "Schoolchildren"),
       layout=c(3,2), 
       as.table=TRUE, 
       col.regions = my.palette, 
       cuts = 8, # col = "transparent",
       main="Angeville variables")
