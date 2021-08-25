# a collection of examples, just for testing...

library(Guerry)
library(sp)
library(ggplot2)
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

# library(ggplot2)
# plotmatrix(Guerry[,4:9], colour="gray20") +
#   geom_smooth(method="lm")

# scatterplotmatrix
library(GGally)
ggpairs(Guerry, columns=4:9, aes(color=Region)) + 
  ggtitle("Guerry data")

library(car)
scatterplotMatrix(Guerry[,4:9],
                  ellipse=list(levels=0.68), 
                  smooth=FALSE)



library(ggbiplot)
gdata <- Guerry[,1:9]

guerry.pca <- prcomp(Guerry[,4:9], scale=TRUE)
ggbiplot(guerry.pca, groups=Guerry$Region, ellipse=TRUE, circle=TRUE)


