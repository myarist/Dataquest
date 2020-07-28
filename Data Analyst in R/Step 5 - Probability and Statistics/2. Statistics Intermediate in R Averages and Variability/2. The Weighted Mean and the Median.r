## 1. Introduction ##

library(readr)
# Heads up that the following instruction can generate a column specification warnings, you can ignore that.
# These warnings are related to that `readr` has misguidedly guessed the type of values in the column `Pool QC`. 
# To avoid this warning we can manually specify the type of this column the `col_types` parameter.
houses  <-  read_tsv('AmesHousing_1.txt', col_types = cols(`Pool QC` = col_character())) 

library(dplyr)
houses_per_year  <-  houses %>%
    mutate(Year = `Yr Sold`) %>%
    group_by(Year) %>%
    summarize(MeanPrice = mean(SalePrice), 
              HousesSold = n() ) %>%
    arrange(HousesSold)
mean_new  <-  mean(houses_per_year$MeanPrice)
mean_original  <-  mean(houses$SalePrice)
difference  <-  mean_original - mean_new

## 2. Different Weights ##

houses_per_year  <- houses_per_year %>%
    mutate(sum_per_year = MeanPrice * HousesSold)

all_sums_together  <-  sum(houses_per_year$sum_per_year)
total_n_houses  <-  sum(houses_per_year$HousesSold)
weighted_mean  <-  all_sums_together / total_n_houses

mean_original  <-  mean(houses$SalePrice)

difference  <-  round(mean_original, digits = 10) - round(weighted_mean, digits = 10)

## 3. The Weighted Mean ##

compute_weighted_mean <- function(distribution, weights) {
    weighted_distribution  <-  distribution * weights    
    sum(weighted_distribution) / sum(weights)
}

computed_weighted_mean  <-  compute_weighted_mean(houses_per_year$MeanPrice, houses_per_year$HousesSold)
weighted_mean_r  <-  weighted.mean(houses_per_year$MeanPrice, houses_per_year$HousesSold)

equal  <-  round(computed_weighted_mean, 10) == round(weighted_mean_r, 10)

## 5. The Median for Open-ended Distributions ##

distribution1  <-  c(23, 24, 22, '20 years or lower,', 23, 42, 35)
distribution2  <-  c(55, 38, 123, 40, 71)
distribution3  <-  c(45, 22, 7, '5 books or lower', 32, 65, '100 books or more')
median1  <-  23
median2  <-  55
median3  <-  32

## 6. Distributions with Even Number of Values ##

# Sort the values
rooms  <-  houses$`TotRms AbvGrd`
rooms  <-  as.numeric(stringr::str_replace(rooms, '10 or more', '10'))
rooms_sorted  <-  sort(rooms)

# Find the median 
middle_indices  <-  c(length(rooms_sorted) / 2,
                      (length(rooms_sorted) / 2) + 1
                 ) # 2930 is even so we need two indices.
middle_values  <-  rooms_sorted[middle_indices]
median  <-  mean(middle_values)

## 8. Finding outliers using Boxplots ##

library(ggplot2)

ggplot(data = houses,
    aes(x = "", y = `Lot Area`)) +
    geom_boxplot() +
    xlab("Lot Area") + 
    ylab("")

ggplot(data = houses,
    aes(x = "", y = SalePrice)) +
    geom_boxplot() +
    xlab("Sale Price") + 
    ylab("")

lotarea_difference  <-  mean(houses$`Lot Area`) - median(houses$`Lot Area`)
saleprice_difference  <-  mean(houses$`SalePrice`) - median(houses$`SalePrice`)

## 9. The Median for Ordinal Scales ##

mean  <-  mean(houses$`Overall Cond`)
median  <-  median(houses$`Overall Cond`)

ggplot(data = houses, aes(x = `Overall Cond`)) +
    geom_histogram(bins = 9, 
                   position = "identity", 
                   alpha = 0.6, 
                   fill='blue') + 
    #geom_vline(xintercept = mean, color = 'red', size=1) +
    #geom_vline(xintercept = median, color = 'green', size=1) +
    xlab("Overall Cond") + 
    ylab("Frequency")

more_representative  <-  'mean' 

#Extra comment:
#The mean seems more representative and more informative because it captures the
#fact that there are more houses rated above 5 than rated under 5. Because of this,
#the mean is slightly shifted above 5.