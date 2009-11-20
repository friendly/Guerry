thinnedSpatialPoly <- function(SP, tolerance, minarea=0) {
  if (!require(shapefiles)) stop("shapefiles package is required")
  stopifnot(inherits(SP, "SpatialPolygons"))

	# set default for tolerance unless supplied
	if (missing(tolerance))  {
		bbox <- slot(SP, "bbox")
		tolerance <- min(bbox[,2]-bbox[,1])/100
	}
	# TODO: suppress warnings: "In Polygon(crds_s) : Non-finite label point detected and replaced"
	ow <- options(warn=-1)
  pls <- slot(SP, "polygons")
  pls_dp <- vector(mode="list", length=length(pls))
  for (i in 1:length(pls)) {
    Pls <- slot(pls[[i]], "Polygons")
    Pls_dp <- vector(mode="list", length=length(Pls))
    for (j in 1:length(Pls)) {
      crds <- slot(Pls[[j]], "coords")
      crds_s <- dp(list(x=crds[,1], y=crds[,2]), tolerance=tolerance)
      crds_s <- do.call("cbind", crds_s)
      if(!identical(crds_s[1,], crds_s[nrow(crds_s),]))
        crds_s <- rbind(crds_s, crds_s[1,])
      Pls_dp[[j]] <- Polygon(crds_s)
    }
    Keep <- logical(length(Pls_dp))
    for (j in 1:length(Pls_dp)) {
      Keep[j] <- TRUE
      if (slot(Pls_dp[[j]], "area") < minarea) Keep[j] <- FALSE
    }
    Pls_dp <- Pls_dp[Keep]
    pls_dp[[i]] <- Polygons(Pls_dp, ID=slot(pls[[i]], "ID"))
  }
  options(ow)
	SP_dp <- SpatialPolygons(pls_dp, proj4string=slot(SP, "proj4string"))
  if(inherits(SP, "SpatialPolygonsDataFrame")) {
    data <- slot(SP, "data")
    SP_dp <- SpatialPolygonsDataFrame(SP_dp, data=data)
  }
  SP_dp
}
