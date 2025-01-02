# a collection of examples, just for testing...

library(Guerry)
library(sp)
library(ggplot2)
library(corrgram)
data(Guerry)

spplot(gfrance, "Crime_pers")
spplot(gfrance, "Crime_prop")
spplot(gfrance, "Literacy")

data(Angeville)

corrgram(Guerry[,4:9], upper=panel.ellipse, order=TRUE)
corrgram(Guerry[,4:9], order=TRUE)
corrgram(Guerry[,4:9], upper=panel.pie, order=TRUE)

vars <- c(4:9, 11, 13, 14)
corrgram(Guerry[,vars], 
         upper=panel.ellipse, 
         cex.labels = 1.3, lwd=2,
         order = TRUE)

corrgram(Angeville[,-1], order=TRUE, cex.labels=1.2)


Guerry |> 
  dplyr::select(where(is.numeric), -dept) |>
  tidyr::drop_na() |>
  corrgram(order = TRUE)


# try all numeric variables, with variable ordering
library(corrplot)
library(dplyr)

Guerry.cor <- Guerry |> 
  dplyr::select(where(is.numeric), -dept) |>
  tidyr::drop_na() |>
  cor() 

corrplot.mixed(Guerry.cor,
  order = "AOE", 
  lower = "ellipse",
  upper = "pie",
  tl.pos = "lt",
  tl.col = "black")


# library(ggplot2)
# plotmatrix(Guerry[,4:9], colour="gray20") +
#   geom_smooth(method="lm")

# scatterplotmatrix
library(GGally)
ggpairs(Guerry, columns=4:9, 
        upper = list(continuous="points"),
        aes(color=Region)) + 
  ggtitle("Guerry data")

library(car)
scatterplotMatrix(Guerry[,4:9],
                  ellipse=list(levels=0.68), 
                  smooth=FALSE)



library(ggbiplot)
gdata <- Guerry[,1:9]

Guerry <- Guerry[1:85,]  # remove Corsica
guerry.pca <- prcomp(Guerry[, 4:9], scale=TRUE)
ggbiplot(guerry.pca, groups=Guerry$Region, ellipse=TRUE, circle=TRUE)


