library(Guerry)
library(sp)
library(RColorBrewer)
library(rgeos)

data(Guerry)


#plot(gfrance)   ## just show the map outline

my.palette <- rev(brewer.pal(n = 9, name = "PuBu"))

gf <- gfrance

gf$Crime_pers <- rank(gfrance$Crime_pers)
gf$Crime_prop <- rank(gfrance$Crime_prop)
gf$Literacy <- rank(gfrance$Literacy)
gf$Donations <- rank(gfrance$Donations)
gf$Infants <- rank(gfrance$Infants)
gf$Suicides <- rank(gfrance$Suicides)


spplot(gf, 
       c("Crime_pers", "Crime_prop", "Literacy", "Donations", "Infants", "Suicides"),
       names.attr = c("Personal crime", "Property crime", "% Read & Write",
                      "Donations to Poor", "Out of Wedlock", "Suicides"),
  layout=c(3,2), as.table=TRUE, 
  col.regions = my.palette, cuts = 8, # col = "transparent",
  main="Guerry's main moral variables")


names$gfrance

centers <- gCentroid(gfrance, byid=TRUE)
cdnters$label <- gfrance


# Libraries for GIS
library('sp')

# Library for plot
library('latticeExtra')

# Load data ---------------------------------------------------------------

# Points
x <- c(1199999, 1080000, 1093067, 1090190, 1087977, 1070419, 1180419)
y <- c(957803,937803, 894366, 872153, 853703, 825353, 805353)

# Create SpatialPoints
SP <- SpatialPoints(coords = cbind(x,y))

# Add label variable
SP$ID <- paste("point", 1:7, sep = "")

# Plot
plot <- spplot(SP, zcol = "ID")
labels <- layer(sp.text(coordinates(SP), txt = SP$ID, pos = 1))

# plot + label layer
plot + labels
