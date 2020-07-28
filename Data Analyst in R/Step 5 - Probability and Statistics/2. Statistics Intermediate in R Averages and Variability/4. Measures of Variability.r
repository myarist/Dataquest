## 1. The Range ##

library(readr)
# Heads up that the following instruction can generate a column specification warnings, you can ignore that.
# These warnings are related to that `readr` has misguidedly guessed the type of values in the column `Pool QC`. 
# To avoid this warning we can manually specify the type of this column the `col_types` parameter.
houses  <-  read_tsv('AmesHousing_1.txt', col_types = cols(`Pool QC` = col_character()))
library(dplyr)

sale_price_range <- houses %>%
    group_by(`Yr Sold`) %>%
    summarize(range_by_year = max(SalePrice) - min(SalePrice))

one  <-  FALSE
two  <-  TRUE

## 2. The Average Distance ##

C  <-  c(1,1,1,1,1,1,1,1,1,21)
average_distance <- function(vector) {
    distances  <-  vector - mean(vector)
    sum(distances) / length(distances)
}

avg_distance  <-  average_distance(C)

## 3. Mean Absolute Deviation ##

C  <-  c(1,1,1,1,1,1,1,1,1,21)

#average_distance <- function(vector) {
#    distances  <-  vector - mean(vector)
#    sum(distances) / length(distances)
#}
mean_absolute_deviation <- function(vector) {
    distances  <-  abs(vector - mean(vector)) #we only add abs function here
    sum(distances) / length(distances)
}

mad  <-  mean_absolute_deviation(C)

## 4. Variance ##

C  <-  c(1,1,1,1,1,1,1,1,1,21)

#mean_absolute_deviation <- function(vector) {
#    distances  <-  abs(vector - mean(vector))
#    sum(distances) / length(distances)
#}
variance <- function(vector) {
    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
    sum(distances) / length(distances)
}

variance_C  <-  variance(C)

## 5. Standard Deviation ##

C  <-  c(1,1,1,1,1,1,1,1,1,21)

#variance <- function(vector) {
#    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
#    sum(distances) / length(distances)
#}
standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 
    sqrt(sum(distances) / length(distances)) #adding sqrt at this line
}

standard_deviation_C  <-  standard_deviation(C)

## 6. Average Variability Around the Mean ##

library(dplyr)

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
    sqrt(sum(distances) / length(distances))
}
# Measure first the variability for each year
houses_years_std <- houses %>%
    group_by(`Yr Sold`) %>%
    summarize(st_dev = standard_deviation(SalePrice)) %>%
    arrange(st_dev)

# Get years of max and min variability
greatest_variability  <-  houses_years_std %>%
  filter(st_dev == max(st_dev)) %>% 
  pull(`Yr Sold`)

lowest_variability  <-  houses_years_std %>%
  filter(st_dev == min(st_dev)) %>% 
  pull(`Yr Sold`)

## 7. A Measure of Spread ##

set.seed(10)

sample1  <-  sample(x = houses$`Year Built`, size = 50)
sample2  <-  sample(x = houses$`Year Built`, size = 50)

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
    sqrt(sum(distances) / length(distances))
}
bigger_spread  <-  'sample 2'
st_dev1  <-  standard_deviation(sample1)
st_dev2  <-  standard_deviation(sample2)

## 8. The Sample Standard Deviation ##

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
    sqrt(sum(distances) / length(distances))
}

library(ggplot2)
set.seed(1)
std_points  <-  replicate(n = 5000, expr = standard_deviation(sample(x = houses$SalePrice, size = 10)))

std_points_tibble <- tibble::tibble(std_points)

ggplot(data = std_points_tibble, aes(x = std_points)) +
    geom_histogram(bins = 10, position = "identity") +
    geom_vline(aes(xintercept = standard_deviation(houses$SalePrice))) +
    xlab("Sample standard deviation") + 
    ylab("Frequency")

## 10. Bessel's Correction ##

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
    sqrt(sum(distances) / length(distances))
}

library(ggplot2)
set.seed(1)

std_points  <-  replicate(n = 5000, expr = standard_deviation(sample(x = houses$SalePrice, size = 10)))

#ggplot(data = tibble::tibble(std_points), aes(x = std_points)) +
#    geom_histogram(bins = 10, position = "identity") +
#    geom_vline(aes(xintercept = standard_deviation(houses$SalePrice))) +
#    xlab("Sample standard deviation") + 
#    ylab("Frequency")

population_stdev  <-  standard_deviation(houses$SalePrice)
standard_deviation_bessel_correction <- function(vector) {
    distances  <-  (vector - mean(vector))**2 
    sqrt(sum(distances) / (length(distances) - 1) ) #Only this line has to change
}

library(ggplot2)
set.seed(1)

std_points  <-  replicate(n = 5000, expr = standard_deviation_bessel_correction(sample(x = houses$SalePrice, size = 10)))

std_points_tibble <- tibble::tibble(std_points)

ggplot(data = std_points_tibble, aes(x = std_points)) +
    geom_histogram(bins = 10, position = "identity") +
    geom_vline(aes(xintercept = population_stdev)) +
    xlab("Sample standard deviation") + 
    ylab("Frequency")

## 11. Standard Notation ##

set.seed(1)

sample_sales  <-  sample(x=houses$SalePrice, size=100)

variance_bessel_correction <- function(vector) {
    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
    sum(distances) / (length(distances) - 1)
}

standard_deviation_bessel_correction <- function(vector) {
    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
    sqrt(sum(distances) / (length(distances)-1) )
}
computed_stdev  <-  standard_deviation_bessel_correction(sample_sales)
stdev_r  <-  sd(sample_sales)
equal_stdevs  <-  computed_stdev == stdev_r

computed_var  <-  variance_bessel_correction(sample_sales)
var_r  <-  var(sample_sales)
equal_vars  <-  computed_var == var_r

## 12. Sample Variance — Unbiased Estimator ##

population  <-  c(0, 3, 6)

samples  <-  list(c(0,3), c(0,6),
               c(3,0), c(3,6),
               c(6,0), c(6,3)
)

variance <- function(vector) {
    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
    sum(distances) / length(distances)
}

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 #we only need to compute the squared distances here
    sqrt(sum(distances) / length(distances) )
}
population_var  <-  variance(population)
population_std  <-  standard_deviation(population)

st_devs  <-  purrr::map_dbl(samples,sd)
variances  <-  purrr::map_dbl(samples,var)

mean_std  <-  mean(st_devs)
mean_var  <-  mean(variances)

equal_stdev  <-  population_std == mean_std
equal_var  <-  population_var == mean_var