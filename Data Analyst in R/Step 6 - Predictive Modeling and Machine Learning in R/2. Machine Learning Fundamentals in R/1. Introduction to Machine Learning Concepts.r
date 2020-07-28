## 2. Exploring the Airbnb dataset ##

library(readr)
dc_listings <- read.csv('dc_airbnb.csv')
colnames(dc_listings)
has_missing <- TRUE

## 3. The k-nearest neighbors algorithm ##

predicted_rent <- mean(c(476, 750, 1128))

## 4. A numerical description for similarity ##

dc_listings <- read.csv('dc_airbnb.csv')
first_row_acc_value <- dc_listings$accommodates[1]
our_acc_value <- 3

first_distance <- abs(our_acc_value - first_row_acc_value)

## 5. Calculate distance for all observations ##

dc_listings <- read.csv('dc_airbnb.csv')
our_acc_value <- 3
dc_listings <- dc_listings %>%
  mutate(
    distance = abs(accommodates - our_acc_value)
  )

## 6. Using randomization ##

dc_listings <- dc_listings %>%
  mutate(
    distance = abs(accommodates - our_acc_value)
  )
zero_distance_indices <- which(dc_listings$distance == 0)
random_three_indices <- sample(zero_distance_indices, 3, replace = FALSE)

## 7. Cleaning the `price` column ##

dc_listings <- dc_listings %>%
  mutate(
    distance = abs(accommodates - our_acc_value)
  )
zero_distance_indices <- which(dc_listings$distance == 0)
random_three_indices <- sample(zero_distance_indices, 3, replace = FALSE)
dc_listings <- dc_listings %>%
  mutate(
    price = as.character(price),
    tidy_price = str_replace_all(price, "\\$", ""),
    tidy_price = str_replace_all(tidy_price, ",", ""),
    tidy_price = as.numeric(tidy_price)
  )

## 8. Calculating average price ##

dc_listings <- dc_listings %>%
  mutate(
    distance = abs(accommodates - our_acc_value)
  )
zero_distance_indices <- which(dc_listings$distance == 0)
random_three_indices <- sample(zero_distance_indices, 3, replace = FALSE)

dc_listings <- dc_listings %>%
  mutate(
    price = as.character(price),
    tidy_price = str_replace_all(price, "\\$", ""),
    tidy_price = str_replace_all(tidy_price, ",", ""),
    tidy_price = as.numeric(tidy_price)
  )
mean_price <- mean(dc_listings$tidy_price[random_three_indices])