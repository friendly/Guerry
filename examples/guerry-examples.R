# a collection of examples, just for testing...

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

guerry.pca <- prcomp(Guerry[,4:9], scale=TRUE)
ggbiplot(guerry.pca, groups=Guerry$Region, ellipse=TRUE, circle=TRUE)


