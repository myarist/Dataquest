## 2. The Mean ##

distribution  <-  c(0,2,3,3,3,4,13)
mean  <-  sum(distribution) / length(distribution)
center  <-  FALSE

values_above  <-  distribution[distribution > mean]
values_below  <-  distribution[distribution < mean]

distances_above <- values_above - mean
distances_below <- mean - values_below

equal_distances  <-  sum(distances_above) == sum(distances_below)

## 3. Generating a distribution ##

set.seed(1)
distribution <- sample.int(100, size=10)
ndistribution <- replicate(n=50, expr=sample.int(25, size=5))

## 4. The Mean as a Balance Point ##

set.seed(1)

checkDist <- function(){
    distribution <- sample.int(1000, size=10)
    mean  <-  sum(distribution) / length(distribution)
    round(sum(distribution - mean)) == 0
}

equal_distances <- sum(replicate(n=5000, expr=checkDist()))

## 5. Defining the Mean Algebraically ##

one  <-  FALSE # we don't use the symbol mu for the sample mean
two  <-  FALSE # Should be N = 8, not n = 8
three  <-  FALSE # x-bar denotes the sample mean, not the population mean

## 6. An Alternative Definition ##

distribution_1  <-  c(42, 24, 32, 11)
distribution_2  <-  c(102, 32, 74, 15, 38, 45, 22)
distribution_3  <-  c(3, 12, 7, 2, 15, 1, 21)
compute_mean <- function(distribution) {
    N <- length(distribution)
    sum_of_the_distribution = 0
    for ( i in 1:N) {
        sum_of_the_distribution <- sum_of_the_distribution + distribution[i]
    }

    sum_of_the_distribution / N
}

mean_1  <-  compute_mean(distribution_1)
mean_2  <-  compute_mean(distribution_2)
mean_3  <-  compute_mean(distribution_3)

## 7. Introducing the Data ##

library(readr)
houses  <-  read_tsv('AmesHousing_1.txt')

one  <-  TRUE # every column that describes years is measured on an interval scale
two  <-  FALSE # `SalePrice` is measured on a ratio scale
three  <-  TRUE # The data set has less values than the initial one with 3970 rows which we don't know either whether it represents a population

## 8. Mean House Prices ##

compute_mean <- function(distribution) {
    N <- length(distribution)
    sum_of_the_distribution = 0
    for ( i in 1:N) {
        sum_of_the_distribution <- sum_of_the_distribution + distribution[i]
    }

    sum_of_the_distribution / N
}
computed_mean  <-  compute_mean(houses$SalePrice)
r_mean  <-  mean(houses$SalePrice)
means_are_equal  <-  (computed_mean == r_mean)

## 9. Challenge: Estimating the Population Mean ##

library(tibble)
library(ggplot2)
library(purrr)

set.seed(4)

parameter  <-  mean(houses$SalePrice)

sample_sizes  <-  seq(5, by=29, length.out=100)

sampling_errors <- map_dbl(sample_sizes, 
                           function(x) parameter - mean(sample(houses$SalePrice, 
                                                               size=x)) )

df <- tibble(x = sample_sizes, y = sampling_errors)

ggplot(data = df, aes(x = sample_sizes, y = sampling_errors)) +
    geom_point(size=2) +
    geom_hline(yintercept = 0) +
    geom_vline(xintercept = 2930) + 
    labs(x = "Sample size", 
         y = "Sampling error")

## 10. Estimates from Low-Sized Samples ##

library(tibble)
library(ggplot2)
set.seed(1)
mean_points <- replicate(n = 10000, 
                         expr = mean(sample(houses$SalePrice, 
                                            size = 100)))

ggplot(data = tibble(mean_points), aes(x = mean_points)) +
    geom_histogram(bins = 100,
                   position = "identity", 
                   alpha = 0.5) +
    geom_vline(aes(xintercept = mean(houses$SalePrice))) +
    xlab("Sample mean") + 
    ylab("Frequency") +
    xlim(0, 500000)

## 12. The Sample Mean as an Unbiased Estimator ##

population  <-  c(3, 7, 2)
library(purrr)

samples  <-  list(c(3, 7), 
                  c(3, 2),
                  c(7, 2), 
                  c(7, 3),
                  c(2, 3),
                  c(2, 7))

sample_means <- map_dbl(samples, function(x) mean(x))

population_mean  <-  mean(population)

mean_of_sample_means  <-  mean(sample_means)

unbiased  <-  (population_mean == mean_of_sample_means)