# Distribution of crimes against persons at different ages

This dataset comes from Plate IV, "Influence de l'age" of Guerry(1833),
transcribed in Whitt & Reinking's (2002) translation as Table 9A, pp.
38-43. It gives the rank ordering of crimes against persons in seven age
groups, in long form.

## Usage

``` r
data("propensity")
```

## Format

A data frame with 124 observations on the following 4 variables.

- `age`:

  a character vector, with 7 age groups, `<21`, `21-30`, `30-40` ...
  `60-70`, `70-`

- `rank`:

  a numeric vector, rank of the crime within each age group

- `crime`:

  a character vector, label of the crime

- `share`:

  a numeric vector, share (frequency) of the crime in a population of
  1000

## Details

For each age group (both males and females), the 17 most frequent crimes
are listed in rank order, followed by an 'Other crime' category.

## Source

H. P. Whitt and V. W. Reinking (2002). A Translation of Andr\\e-Michel
Guerry's *Essay on the Moral Statistics of France*, Lewiston, N.Y.:
Edwin Mellen Press, 2002.

## References

Guerry, A.-M. (1833). *Essai sur la statistique morale de la France*
Paris: Crochard.

## Examples

``` r
data(propensity)
## maybe str(propensity) ; plot(propensity) ...
```
