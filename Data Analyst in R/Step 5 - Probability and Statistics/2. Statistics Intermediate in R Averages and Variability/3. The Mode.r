## 1. Introduction ##

library(readr)
houses  <-  read_tsv('AmesHousing_1.txt')

scale_land  <-  'ordinal'
scale_roof  <-  'nominal'
kitchen_variable  <-  'discrete'

## 2. The Mode for Ordinal Variables ##

library(dplyr)

compute_mode <- function(vector) {
    counts_df  <-  tibble(vector) %>% 
        group_by(vector) %>% 
        summarise(frequency=n()) %>% 
        arrange(desc(frequency)) 

    counts_df$vector[1]
}

computed_mode  <-  compute_mode(houses$`Land Slope`)

## 3. The Mode for Nominal Variables ##

# The function we wrote (you can copy-paste yours from the previous screen)
library(dplyr)

compute_mode <- function(vector) {
    counts_df  <-  tibble(vector) %>% 
        group_by(vector) %>% 
        summarise(frequency = n()) %>% 
        arrange(desc(frequency)) 

    counts_df$vector[1]
}
compute_mode_table <- function(vector) {
    counts_df  <-  tibble(vector) %>% 
        group_by(vector) %>% 
        summarise(frequency = n()) %>% 
        arrange(desc(frequency)) 
    
    list('mode' = counts_df$vector[1], 'values' = counts_df$frequency)
}

mode <- compute_mode_table(houses$`Roof Style`)$mode
value_counts  <-  compute_mode_table(houses$`Roof Style`)$values

## 4. The Mode for Discrete Variables ##

library(dplyr)

compute_mode <- function(vector) {
    counts_df  <-  tibble(vector) %>% 
        group_by(vector) %>% 
        summarise(frequency = n()) %>% 
        arrange(desc(frequency)) 

    counts_df$vector[1]
}
bedroom_variable  <-  'discrete'
bedroom_mode  <-  compute_mode(houses$`Bedroom AbvGr`)

price_variable  <-  'continuous'
price_mode <- compute_mode(houses$SalePrice)

## 5. Special Cases ##

library(dplyr)

houses %>% 
    mutate(intervals_group = cut(SalePrice, 
                                 breaks = seq(0,800000,100000))) %>%
    group_by(intervals_group) %>% 
    summarize(frequency = n())
mode  <-  150000
mean  <-  mean(houses$SalePrice)
median  <-  median(houses$SalePrice)

sentence_1  <-  TRUE
sentence_2  <-  TRUE

## 6. Skewed Distributions ##

distribution_1  <-  c('mean' = 3021 , 'median' = 3001, 'mode' = 2947)
distribution_2  <-  c('median' = 924 , 'mode' = 832, 'mean' = 962)
distribution_3  <-  c('mode' =  202, 'mean' =  143, 'median' = 199)
shape_1  <-  'right skew'
shape_2  <-  'right skew'
shape_3  <-  'left skew'

## 7. Challenge: Symmetrical Distributions ##

library(dplyr)

compute_mode <- function(vector) {
    counts_df  <-  tibble(vector) %>% 
        group_by(vector) %>% 
        summarise(frequency = n()) %>% 
        arrange(desc(frequency)) 

    counts_df$vector[1]
}
library(ggplot2)

ggplot(data = houses,
    aes(x = `Mo Sold`)) +
    geom_density(alpha = 0.1, 
                 color='blue', 
                 fill='blue') +
    geom_vline(aes(xintercept = compute_mode(`Mo Sold`), 
                   color = 'Mode'), 
               size = 1.2 ) +
    geom_vline(aes(xintercept = median(`Mo Sold`), 
                   color = 'Median'), 
               size = 1.2 ) +
    geom_vline(aes(xintercept = mean(`Mo Sold`), 
                   color = 'Mean'), 
               size = 1.2 ) +
    scale_y_continuous(labels = scales::comma) +
    xlim(1,12)+
    scale_colour_manual(values = c("Mode" = "green", 
                                   "Median" = "black", 
                                   "Mean" = "orange"), 
                        name = "") +
    theme_bw() + 
    theme(legend.position='top') +
    xlab("Mo Sold") + 
    ylab("Density")