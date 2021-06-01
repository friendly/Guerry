data(Guerry, package="Guerry")
library(ggplot2)
library(ggrepel)
library(ggpmisc)

ggplot(aes(x=Literacy, y=Crime_pers/1000 , label=Department), data=Guerry) +
  geom_point(size=2) +
  stat_ellipse(level=0.68, color="blue", size=1.2) +  
  stat_ellipse(level=0.95, color="gray", size=1, linetype=2) + 
  geom_smooth(method="lm", formula=y~x, fill="lightblue") +
  geom_smooth(method="loess", formula=y~x, color="red", se=FALSE) +
  stat_dens2d_filter(geom = "text_repel", keep.fraction = 0.1) +
  theme_bw()

ggplot(aes(x=Literacy, y=Crime_prop/1000 , label=Department), data=Guerry) +
  geom_point(size=2) +
  stat_ellipse(level=0.68, color="blue", size=1.2) +  
  stat_ellipse(level=0.95, color="gray", size=1, linetype=2) + 
  geom_smooth(method="lm", formula=y~x, fill="lightblue") +
  geom_smooth(method="loess", formula=y~x, color="red", se=FALSE) +
  stat_dens2d_filter(geom = "text_repel", keep.fraction = 0.1) +
  theme_bw()


# use Mahalanobis Dsq
gdf <- Guerry[, c("Literacy", "Crime_pers", "Department")]
gdf$dsq <- mahalanobis(gdf[,1:2], colMeans(gdf[,1:2]), cov(gdf[,1:2]))

ggplot(aes(x=Literacy, y=Crime_pers/1000 , label=Department), data=gdf) +
  geom_point(size=2) +
  stat_ellipse(level=0.68, color="blue", size=1.2) +  
  stat_ellipse(level=0.95, color="gray", size=1, linetype=2) + 
  geom_smooth(method="lm", formula=y~x, fill="lightblue") +
  geom_smooth(method="loess", formula=y~x, color="red", se=FALSE) +
  geom_label_repel(data = gdf[gdf$dsq > 4.6,]) +
  theme_bw()



