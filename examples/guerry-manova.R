# MANOVA, candisc models for Guerry data


# manova / candisc
library(heplots)
library(candisc)
library(car)
library(Guerry)
library(dplyr)
data(Guerry, package="Guerry")

# extract pieces
df           <- data.frame(Guerry)[, 4:9]    # the 6 variables
france.map   <- as(gfrance85, "SpatialPolygons") # the map
xy           <- coordinates(gfrance)           # spatial coordinates
dep.names    <- data.frame(Guerry)[, 3]       # departement names
region.names <- data.frame(Guerry)[, 2]       # region names
col.region   <- colors()[c(149, 254, 468, 552, 26)] # colors for region

# ranks

#df %>% mutate_all(funs(dense_rank(desc(.))))

df %>% multate(
               Crime_pers = dense_rank(Crime_pers),
               Crime_prop = dense_rank(Crime_prop),
               Literacy   = dense_rank(Literacy),
               Donations  = dense_rank(Donations),
               Infants    = dense_rank(Infants),
               Suicides   = dense_rank(uicides)
) -> df_ranks



# What variables predict crime?
crime.mod <- lm(cbind(Crime_pers, Crime_prop) ~ Region + Literacy + Donations +  Infants + Suicides, data=Guerry)
Anova(crime.mod)

heplot(crime.mod, fill=TRUE, fill.alpha=0.1)





# What variables discriminate among Regions ?

region.mod <- lm(cbind(Crime_pers, Crime_prop, Literacy, Donations, Infants, Suicides) ~ Region, data=Guerry)

heplot(region.mod, fill=TRUE, fill.alpha=0.1)

pairs(region.mod, variables=1:3, fill=TRUE, fill.alpha=0.1)

guerry.can <- candisc(region.mod)
guerry.can
plot(guerry.can)
