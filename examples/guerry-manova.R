# MANOVA, candisc models for Guerry data


# manova / candisc
library(heplots)
library(candisc)
library(car)
data(Guerry, package="Guerry")

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
