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

data(gfrance)
str(gfrance@data)
gfrance@data <- Guerry
save(gfrance, file = "data/gfrance.RData")

data(gfrance85)
str(gfrance85@data)
gfrance85@data <- (Guerry |> filter(dept != 200))
save(gfrance85, file = "data/gfrance85.RData")



