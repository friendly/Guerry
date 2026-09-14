#library(readxl)
library(dplyr)
# #Guerry_new <- read_excel("data-raw/Guerry_new.xlsx") |> as.data.frame()
# Guerry_new <- read.csv("data-raw/Guerry_new.csv") 
# 
# 
# Guerry_new$Department <- factor(Guerry_new$Department)
# #Guerry_new$dept <- as.numeric(Guerry_new$dept)
# Guerry_new <- Guerry_new |>
#   arrange(dept)
# 
# 
# #View(Guerry_new)
# 
# data(Guerry)
# 
# common <- names(Guerry)[names(Guerry) %in% names(Guerry_new)]
# dvars <- c("Crime_pers", "Infants", "Wealth", "Commerce", "Clergy", "Infanticide")
# 
# wh_crime <- which(Guerry$Crime_pers != Guerry_new$Crime_pers)
# wh_crime <- which(abs(Guerry$Crime_pers - Guerry_new$Crime_pers) > 0)
# wh_crime
# Guerry[wh_crime, dvars]
# 
# cbind(Guerry[wh_crime, c("dept", "Crime_pers")], Guerry_new[wh_crime, c("dept", "Crime_pers")])
# 
# library(diffdf)
# dd<- diffdf(Guerry[, common], Guerry_new)
# 
# diffdf_issuerows(Guerry, dd)
# 
# library(arsenal)
# comparedf(Guerry[, common], Guerry_new, by.x = dept, by.y = dept)
# 
# 
# for(var in dvars) {
#   dif <- Guerry[, var] - Guerry_new[, var]
#   wh <- which(abs(dif) >0 )
# 
# #  Guerry[, var] <- Guerry_new[, var]
#   cat("Variable:", var, "\n")
#   print(wh)
#   cbind(Guerry[wh, c("dept", var)], Guerry_new[wh, c("dept", var)], dif[wh]) 
# }

# made corrections manually in data-raw/Guerry.csv
Guerry <- read.csv("data-raw/Guerry.csv") 

Guerry <- Guerry |>
  mutate(Region = factor(Region),
         Department = factor(Department),
         MainCity = ordered(MainCity))

save(Guerry, file = "data/Guerry.RData")
str(Guerry)

# NB (2026-09-13): the original version of this script did
# `gfrance@data <- Guerry` / `gfrance85@data <- (Guerry |> filter(dept != 200))`,
# which replaced the *entire* @data slot and silently dropped the shapefile
# identifier columns CODE_DEPT/COUNT/AVE_ID_GEO that gfrance/gfrance85 (but not
# plain Guerry) originally carried -- shifting every later column left by 3 and
# breaking gfrance85.R's own @examples (`[,5]`/`[,7:12]` positional indexing)
# plus adegraphics' reverse-dependency tests/vignette, which index gfrance85 the
# same way. Restore those 3 columns from the pre-correction backups so the
# column layout (and row names, which must match the polygon IDs) matches the
# original shapefile-derived objects.

load("data-raw/gfrance-old.RData")   # gfrance (pre-correction), for CODE_DEPT/COUNT/AVE_ID_GEO
id_cols_france <- gfrance@data[, c("CODE_DEPT", "COUNT", "AVE_ID_GEO", "dept")]

data(gfrance)
str(gfrance@data)
gfrance@data <- id_cols_france |>
  left_join(Guerry, by = "dept")
row.names(gfrance@data) <- sapply(gfrance@polygons, function(p) p@ID)
save(gfrance, file = "data/gfrance.RData", compress = "xz")

load("data-raw/gfrance85-old.RData") # gfrance85 (pre-correction), for CODE_DEPT/COUNT/AVE_ID_GEO
id_cols_france85 <- gfrance85@data[, c("CODE_DEPT", "COUNT", "AVE_ID_GEO", "dept")]

data(gfrance85)
str(gfrance85@data)
gfrance85@data <- id_cols_france85 |>
  left_join(Guerry |> filter(dept != 200), by = "dept")
row.names(gfrance85@data) <- sapply(gfrance85@polygons, function(p) p@ID)
save(gfrance85, file = "data/gfrance85.RData", compress = "xz")



