library(Guerry)
library(car)
data(Guerry)

set.seed(12315)
with(Guerry,{
	dataEllipse(Literacy, Crime_pers,
		levels = 0.68,
  	ylim = c(0,40000), xlim = c(0, 80),
  	ylab="Pop. per crime against persons",
  	xlab="Percent who can read & write",
  	pch = 16,
  	grid = FALSE,
  	id = list(method="mahal", n = 8, labels=Department, location="avoid", cex=1.2),
  	center.pch = 3, center.cex=5,
  	cex.lab=1.5)
	dataEllipse(Literacy, Crime_pers,
		levels = 0.95, add=TRUE,
  	ylim = c(0,40000), xlim = c(0, 80),
  	lwd=2, lty="longdash",
  	col="gray",
  	center.pch = FALSE
  	)
  
  abline( lm(Crime_pers ~ Literacy), lwd=2)	
  lines(loess.smooth(Literacy, Crime_pers), col="red", lwd=3)
  }
  	)


# redo this as crimes per 100,000 persons

Guerry$Crime_pers_rate <- 100000 / Guerry$Crime_pers

set.seed(12315)
with(Guerry,{
	dataEllipse(Literacy, Crime_pers_rate,
		levels = 0.68,
  	ylim = c(-5,45), 
		xlim = c(-5, 80),
  	ylab = "Crimes against persons / 100k pop",
  	xlab="Percent who can read & write",
  	pch = 16,
  	grid = FALSE,
  	id = list(method="mahal", n = 8, labels=Department, location="avoid", cex=1.2),
  	center.pch = 3, center.cex=5,
  	cex.lab=1.5)
	dataEllipse(Literacy, Crime_pers_rate,
		levels = 0.95, add=TRUE,
  	ylim = c(-5,45), 
  	xlim = c(-5, 80),
  	lwd=2, lty="longdash",
  	col="gray",
  	center.pch = FALSE
  	)
  
  abline( lm(Crime_pers_rate ~ Literacy), lwd=2)	
  lines(loess.smooth(Literacy, Crime_pers_rate), col="red", lwd=3)
  }
  	)
