## 1. Individual Values ##

library(readr)
# Heads up that the following instruction can generate a column specification warnings, you can ignore that.
# These warnings are related to that `readr` has misguidedly guessed the type of values in the column `Pool QC`. 
# To avoid this warning we can manually specify the type of this column the `col_types` parameter.
houses  <-  read_tsv('AmesHousing_1.txt', col_types = cols(`Pool QC` = col_character())) 

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 
    sqrt(sum(distances) / length(distances) )
}

st_dev  <-  standard_deviation(houses$SalePrice)
mean  <-  mean(houses$SalePrice)

library(ggplot2)
#ggplot(data = houses,
#    aes(x = SalePrice)) +
#    geom_density(alpha = 0.1, 
#                 color='blue', 
#                 fill='blue') +
#    geom_vline(aes(xintercept = mean, 
#                   color = 'Mean'), 
#               size = 1.2 ) +
#    geom_vline(aes(xintercept = 220000, 
#                   color = '220,000'), 
#               size = 1.2 ) +
#    geom_vline(aes(xintercept = mean+st_dev, 
#                   color = 'Standard deviation'), 
#               size = 1.2 ) +
#    scale_y_continuous(labels = scales::comma) +
#    scale_x_continuous(labels = scales::comma, 
#                       lim = c(min(houses$SalePrice), 
#                               max(houses$SalePrice))) +
#    scale_colour_manual(values = c("Mean"="black", 
#                                   "220,000"="red", 
#                                   "Standard deviation"="orange"), 
#                        name = "") +
#    theme_bw() + 
#    theme(legend.position='top') +
#    xlab("Sale Price") + 
#    ylab("Density")
very_expensive  <-  FALSE

## 2. Number of Standard Deviations ##

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 
    sqrt(sum(distances) / length(distances) )
}
distance  <-  220000 - mean(houses$SalePrice)
st_devs_away  <-  distance / standard_deviation(houses$SalePrice)

## 3. Z-scores ##

min_val  <-  min(houses$SalePrice)
mean_val  <-  mean(houses$SalePrice)
max_val  <-  max(houses$SalePrice) 

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 
    sqrt(sum(distances) / length(distances) )
}
z_score <- function(value, vector, bessel = FALSE) {
    mean  <-  mean(vector)
    
    st_dev <- ifelse(!bessel, sd(vector), standard_deviation(vector)) 
    
    (value - mean) / st_dev
}

min_z  <-  z_score(min_val, houses$SalePrice)
mean_z  <-  z_score(mean_val, houses$SalePrice)
max_z  <-  z_score(max_val, houses$SalePrice)

## 4. Locating Values in Different Distributions ##

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 
    sqrt(sum(distances) / length(distances) )
}

z_score <- function(value, vector, bessel = FALSE) {
    mean  <-  mean(vector)
    
    st_dev <- ifelse(!bessel, sd(vector), standard_deviation(vector)) 
    
    (value - mean) / st_dev
}

target_neighborhoods <- c('NAmes', 'CollgCr', 'OldTown', 'Edwards', 'Somerst')
# Filter only the interesting locations from the dataset
# Group by neighborhood and find the z-score for 200000 for every location
# Sort the result by zcore
library(dplyr)
houses %>%
    filter(Neighborhood %in% target_neighborhoods) %>%
    group_by(Neighborhood) %>%
    summarise(zscore = abs(z_score(200000, SalePrice))) %>%
    ungroup() %>%
    arrange(zscore)

# Find the location with the z-score closest to 0
best_investment  <-  'College Creek'

## 5. Transforming Distributions ##

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 
    sqrt(sum(distances) / length(distances) )
}

library(dplyr)
houses <- houses %>%
    mutate(z_prices = (SalePrice - mean(SalePrice)) / standard_deviation(SalePrice))
z_mean_price  <-  mean(houses$z_prices)
z_stdev_price  <-  standard_deviation(houses$z_prices)

# Transforming 'Lot Area'
houses <- houses %>%
    mutate(z_area = (`Lot Area` - mean(`Lot Area`)) / standard_deviation(`Lot Area`))

z_mean_area  <-  mean(houses$z_area)
z_stdev_area  <-  standard_deviation(houses$z_area)

## 6. The Standard Distribution ##

population  <-  c(0, 8, 0, 8)

standard_deviation <- function(vector) {
    distances  <-  (vector - mean(vector))**2 
    sqrt(sum(distances) / length(distances) )
}
mean_pop  <-  mean(population)
stdev_pop  <-  standard_deviation(population)

standardized_pop  <-  (population - mean_pop) / stdev_pop

mean_z  <-  mean(standardized_pop)
stdev_z  <-  standard_deviation(standardized_pop)

## 7. Standardizing Samples ##

sample  <-  c(0, 8, 0, 8)

x_bar  <-  mean(sample)
s  <-  sd(sample)

standardized_sample  <-  (sample - x_bar) / s
stdev_sample  <-  sd(standardized_sample)

## 8. Using Standardization for Comparisons ##

standard_deviation <- function(vector) {
  distances  <-  (vector - mean(vector))**2 
  sqrt(sum(distances) / length(distances) )
}

houses <- houses %>%
  mutate(index_1 = SalePrice/ 100000 + 37) %>%
  mutate(index_1 = replace(index_1,  row_number() %% 2 != 0, NA_real_) ) %>%
  mutate(index_2 = SalePrice/ 90000 - 2.8) %>%
  mutate(index_2 = replace(index_2,  row_number() %% 2 == 0, NA_real_) )

mean_index_1  <-  mean(houses$index_1, na.rm = T)
mean_index_2  <-  mean(houses$index_2, na.rm = T)

sd_index_1  <-  standard_deviation(na.omit(houses$index_1))
sd_index_2  <-  standard_deviation(na.omit(houses$index_2))
houses <- houses %>%
  mutate(z_1 = (index_1 - mean_index_1) / sd_index_1 ) %>%
  mutate(z_2 = (index_2 - mean_index_2) / sd_index_2 ) 

head(houses %>% select(z_1, z_2), 2)

better  <-  'first'

## 9. Converting Back from Z-scores ##

houses_merged <- bind_rows(houses_1,houses_2) %>%
    mutate(z_1 = tidyr::replace_na(z_1,0)) %>%
    mutate(z_2 = tidyr::replace_na(z_2,0)) %>%
    mutate(z_merged = z_1 +  z_2)
mean  <-  50
st_dev  <-  10
houses_merged <- houses_merged %>%
    mutate(transformed = z_merged * st_dev + mean)
                            
mean_transformed  <-  mean(houses_merged$transformed)
stdev_transformed  <-  standard_deviation(houses_merged$transformed)