# MANOVA, candisc models for Guerry data


# manova / candisc
library(heplots)
library(candisc)
library(car)
library(Guerry)
library(dplyr)
library(sp)
data(Guerry, package="Guerry")

# extract pieces
df           <- data.frame(Guerry)[, 4:9]        # the 6 variables
france.map   <- as(gfrance85, "SpatialPolygons") # the map
xy           <- sp::coordinates(gfrance)         # spatial coordinates
dep.names    <- data.frame(Guerry)[, 3]          # departement names
region.names <- data.frame(Guerry)[, 2]          # region names
col.region   <- colors()[c(149, 254, 468, 552, 26)] # colors for region

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



# What variables predict crime?
crime.mod <- lm(cbind(Crime_pers, Crime_prop) ~ 
                  Region + Literacy + Donations +  Infants + Suicides, data=Guerry)
Anova(crime.mod)

heplot(crime.mod, fill=TRUE, fill.alpha=0.1)

crime.can <- candisc(crime.mod)
crime.can
plot(crime.can)

# What variables discriminate among Regions ?

region.mod <- lm(cbind(Crime_pers, Crime_prop, Literacy, Donations, Infants, Suicides) ~ 
                   Region, data=Guerry)
Anova(region.mod)

heplot(region.mod, fill=TRUE, fill.alpha=0.1)

pairs(region.mod, variables=1:3, fill=TRUE, fill.alpha=0.1)

region.can <- candisc(region.mod)
region.can
plot(region.can)
