# biplot using heplots functions

library(heplots)


gdata <- Guerry[,1:9]
gdata <- Guerry[-86,]	# delete Corsica


guerry.pca <- prcomp(gdata[,4:9], scale=TRUE)

op <- par(mar=c(5,4,1,1)+.1)
cols = colorspace::rainbow_hcl(5)
covEllipses(guerry.pca$x, group=gdata$Region, 
            pooled=FALSE, 
            fill=TRUE, fill.alpha=0.1,
            col=cols, 
            label.pos=c(3,0,1,1,3), 
            cex=2,
            xlim=c(-4,4), ylim=c(-4,4),
            xlab = "Dimension 1 (35.7 %)", 
            ylab = "Dimension 2 (20.0 %)",
            cex.lab=1.4
)
points(guerry.pca$x, pch=(15:19)[Guerry$Region], col=cols[Guerry$Region])

candisc::vectors(guerry.pca$rotation, scale=5,  
                 col="black", lwd=3, cex=1.5, 
                 pos = c(NULL,NULL,NULL,NULL,NULL,NULL),
                 xpd=TRUE)
abline(h=0, v=0, col=gray(.70))
par(op)