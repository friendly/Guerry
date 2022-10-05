#' ---
#' title: Predicting crime, multiple regression
#' ---

library(car)
library(effects)

crime.mod1 <- lm(Crime_pers ~  Region + Literacy + Donations +  Infants + Suicides, data=Guerry)
crime.mod2 <- lm(Crime_prop ~  Region + Literacy + Donations +  Infants + Suicides, data=Guerry)

Anova(crime.mod1)
Anova(crime.mod2)

# diagnostic plots
op <- par(mfrow=c(2,2))
plot(crime.mod1)
par(op)

op <- par(mfrow=c(2,2))
plot(crime.mod2)
par(op)


plot(allEffects(crime.mod1))

plot(predictorEffects(crime.mod1, ~ Region + Literacy + Infants + Suicides))
plot(predictorEffects(crime.mod2, ~ Region + Literacy + Infants + Suicides))

