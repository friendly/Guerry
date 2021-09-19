# Guerry - biplots


library(ggbiplot)
data(Guerry, package="Guerry")

# keep only main variables; delete Corsica (region==NA)
gdata <- Guerry[1:9]
gdata <- Guerry[-86,]

guerry.pca <- prcomp(gdata[,4:9], scale=TRUE)
ggscreeplot(guerry.pca) + theme_bw() + geom_point(size=4)


ggbiplot(guerry.pca, groups=gdata$Region, 
         ellipse=TRUE,
         var.scale = 3, varname.size = 5) + 
  theme_bw() + 
  labs(color="Region") +
  theme(legend.position = c(0.1, 0.8))



