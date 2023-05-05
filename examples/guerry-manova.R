#' ---
#' title: MANOVA, candisc models for Guerry data
#' ---


# manova / candisc
library(heplots)
library(candisc, warn.conflicts = FALSE)
library(car)
library(Guerry)
library(dplyr)
#library(sp)
data(Guerry, package="Guerry")

# extract pieces
df           <- data.frame(Guerry)[, 4:9]        # the 6 variables
#france.map   <- as(gfrance85, "SpatialPolygons") # the map
#xy           <- sp::coordinates(gfrance)         # spatial coordinates
dep.names    <- data.frame(Guerry)[, 3]          # departement names
region.names <- data.frame(Guerry)[, 2]          # region names
col.region   <- colors()[c(149, 254, 468, 552, 26)] # colors for region


# What variables predict crime?
crime.mod <- lm(cbind(Crime_pers, Crime_prop) ~ 
                Region + Literacy + Donations +  Infants + Suicides, data=Guerry)
Anova(crime.mod)

# bivariate confidence intervals for coefficients
coefplot(crime.mod, fill = TRUE, fill.alpha = 0.1, level=0.68)

coefplot(crime.mod, fill = TRUE, fill.alpha = 0.1, level=0.68, parm = 6:9)


# diagnostic plot for multivariate normality and outliers
labels <- paste0(Guerry$dept,":", Guerry$Department)
cqplot(crime.mod, id.n=4, labels=labels)

heplot(crime.mod, 
       fill=TRUE, fill.alpha=0.05, 
       cex=1.4, cex.lab=1.3
      )


crime.can <- candisc(crime.mod)
crime.can
#plot(crime.can)

heplot(crime.can, fill=TRUE, fill.alpha=0.1,
       var.col = "black", 
       var.cex = 1.3,
       cex=1.4, cex.lab=1.3)

# Use ranks

Guerry_ranks <- Guerry |>
  select(1:9) |>
  mutate(
    Crime_pers = dense_rank(Crime_pers),
    Crime_prop = dense_rank(Crime_prop),
    Literacy   = dense_rank(Literacy),
    Donations  = dense_rank(Donations),
    Infants    = dense_rank(Infants),
    Suicides   = dense_rank(Suicides)
  )

# Guerry_ranks <- Guerry |> 
#   select(1:9) |>
#   mutate(across(Crime_pers:Suicides, dense_rank))
    

crime.modr <- lm(cbind(Crime_pers, Crime_prop) ~ 
                  Region + Literacy + Donations +  Infants + Suicides, data=Guerry_ranks)
Anova(crime.modr)

heplot(crime.modr, 
       fill=TRUE, fill.alpha=0.05, 
       cex=1.4, cex.lab=1.2
)

crime.canr <- candisc(crime.modr)
crime.canr
#plot(crime.can)

heplot(crime.canr)



# What variables discriminate among Regions ?

region.mod <- lm(cbind(Crime_pers, Crime_prop, Literacy, Donations, Infants, Suicides) ~ 
                   Region, data=Guerry)
Anova(region.mod)

heplot(region.mod, fill=TRUE, fill.alpha=0.1)

pairs(region.mod, variables=1:3, fill=TRUE, fill.alpha=0.1)

region.can <- candisc(region.mod)
region.can
plot(region.can)
