
data(Guerry, package="Guerry")

# Guerry_ranks <- Guerry |>
#   mutate(
#     Crime_pers = dense_rank(Crime_pers),
#     Crime_prop = dense_rank(Crime_prop),
#     Literacy   = dense_rank(Literacy),
#     Donations  = dense_rank(Donations),
#     Infants    = dense_rank(Infants),
#     Suicides   = dense_rank(Suicides)
#   )

# do it for all numeric
Guerry_ranks<- Guerry |> 
  mutate(across(!dept & where(is.numeric), dense_rank))

save(Guerry_ranks, file=here::here("data", "Guerry_ranks.RData"))


# transform main variables to long, fur some uses

library(tidyr)

Guerry_ranks_long <- Guerry_ranks |>
  select(dept:Suicides) |>
  pivot_longer(cols=Crime_pers:Suicides, 
               names_to = "variable",
               values_to = "rank")
