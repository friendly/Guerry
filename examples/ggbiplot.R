# Guerry - biplots


library(ggbiplot)
library(patchwork)
data(Guerry, package="Guerry")


gdata <- Guerry[,1:9]    # keep only main variables;
gdata <- gdata[-86,]   # delete Corsica (region==NA)

guerry.pca <- prcomp(gdata[,4:9], scale=TRUE)
print(guerry.pca, digits=3)

ggs1 <- ggscreeplot(guerry.pca) + theme_bw() + geom_point(size=4)
ggs2 <- ggscreeplot(guerry.pca, type="cev") + theme_bw() + geom_point(size=4)
ggs1 + ggs2

ggbiplot(guerry.pca, groups=gdata$Region, 
         ellipse=TRUE,
         var.scale = 3, varname.size = 5) + 
  theme_bw() + 
  labs(color="Region") +
  theme(legend.position = c(0.1, 0.8))


#--------------------

fviz_pca(guerry.pca, 
         addEllipses = TRUE,
         ellipse.level=0.68,
         habillage = gdata$Region,
         # repel = TRUE, 
         # labelsize = 3
         ) + 
  theme_bw() 
