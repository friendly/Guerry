

library(Guerry)
library(sp)
data(Guerry)

spplot(gfrance, "Crime_pers")
spplot(gfrance, "Crime_prop")
spplot(gfrance, "Literacy")

data(Angeville)

library(corrgram)
corrgram(Guerry[,4:9], upper=panel.ellipse)
corrgram(Guerry[,4:9], order=TRUE)
corrgram(Guerry[,4:9], upper=panel.pie, order=TRUE)

vars <- c(4:9, 20)
corrgram(Guerry[,vars], upper=panel.pie, order=TRUE)

corrgram(Angeville[,-1], order=TRUE)

library(ggbiplot)
gdata <- Guerry[,1:9]

wine.pca <- prcomp(wine, scale. = TRUE)
print(ggbiplot(wine.pca, obs.scale = 1, var.scale = 1, groups = wine.class, ellipse = TRUE, circle = TRUE))

guerry.pca <- prcomp(Guerry[,4:9], scale=TRUE)
ggbiplot(guerry.pca, groups=Guerry$Region, ellipse=TRUE, circle=TRUE)



# manova / candisc
library(heplots)
library(candisc)
guerry.mod <- lm(cbind(Crime_pers, Crime_prop, Literacy, Donations, Infants, Suicides) ~ Region, data=Guerry)

heplot(guerry.mod, fill=TRUE, fill.alpha=0.1)

pairs(guerry.mod, variables=1:3, fill=TRUE, fill.alpha=0.1)

guerry.can <- candisc(guerry.mod)
guerry.can
plot(guerry.can)
