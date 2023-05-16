data(gfrance85, package = "Guerry")
require(sp)

# extract some useful components
df <- data.frame(gfrance85)[,7:12]       # main moral variables
xy <- coordinates(gfrance85)             # department centroids
dept <- data.frame(gfrance85)[,"dept"]   # department number
dep.names <- data.frame(gfrance85)[,"Department"]
region.names <- data.frame(gfrance85)[,"Region"]
col.region <- colors()[c(149,254,468,552,26)] |>
  scales::alpha(alpha = 0.2)

# plot the map showing regions by color with department labels
op <-par(mar=rep(0.1,4))
plot(gfrance85, col=col.region[region.names])
text(xy, labels=dep.names, cex=0.65)
par(op)

