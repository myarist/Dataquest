## 2. Data Suitable for Linear Regression ##

library(readr)
williamsburg_north <- read_csv("williamsburg_north.csv")

## 3. Exploring Bivariate Relationships with Scatterplots ##

library(ggplot2)

ggplot(data = williamsburg_north, 
       aes(x = year_built, y = sale_price)) +
       scale_y_continuous(labels = scales::comma) +
       geom_point()

ggplot(data = williamsburg_north, 
       aes(x = gross_square_feet, y = sale_price)) +
       scale_y_continuous(labels = scales::comma) +
       geom_point()

## 4. Linearity ##

# question_1 <-
# question_2 <-
question_1 <- FALSE
question_2 <- TRUE

## 5. Strength ##

brooklyn_sales <- suppressMessages(read_csv("williamsburg_north.csv"))
library(dplyr)
set.seed(1)
williamsburg_all <- brooklyn_sales %>% 
  # Remove year-built zero years (assumed to be missing data)
  filter(year_built > 0) %>% 
  # Remove transactions assumed to be between family members
  filter(sale_price > 10000) %>% 
  # Select condominum category
  filter(building_class_category == "13 Condos - Elevator Apartments") %>% 
  # Select building class "CONDO; RESIDENTIAL UNIT IN ELEVATOR BLDG."
  filter(building_class_at_time_of_sale == "R4") %>% 
  # Choose all Williamburg neighborhoods
  filter(stringr::str_detect(neighborhood, "Williamsburg")) %>% 
  # Include only unique entries
  distinct() %>% 
  # Select random sample of 50
  sample_n(50)

ggplot(data = williamsburg_all, 
       aes(x = gross_square_feet, y = sale_price, color = neighborhood)) +
  scale_y_continuous(labels = scales::comma) +
  geom_point() +
  theme(legend.position="bottom")

stronger_relationship <- "williamsburg_north"

## 6. Outliers ##

# sale_price quartiles
quartiles <- quantile(williamsburg_north$sale_price)
# 75% minus 25% = interquartile range (iqr)
iqr <- quartiles[[4]] - quartiles[[2]]
# Outlier boundaries
lower_bound <- quartiles[[2]] - (1.5 * iqr)
upper_bound <- quartiles[[4]] + (1.5 * iqr)

# Isolate outlier(s)
outliers <- williamsburg_north %>% 
  filter(sale_price > upper_bound | sale_price < lower_bound)
ggplot(data = williamsburg_north, 
       aes(x = gross_square_feet, y = sale_price)) +
  geom_point(data = outliers, aes(gross_square_feet, sale_price), 
             color = "orangered3", size = 4) + 
  geom_point() +
  scale_y_continuous(labels = scales::comma) +
  geom_smooth(method = "lm", se = FALSE)

## 8. Correlation ##

library(tibble)
correlation_wburg_all <- williamsburg_all %>%
  select(gross_square_feet, sale_price) %>%
  cor(use = "pairwise.complete.obs") %>% 
  as_tibble(rownames = "variable")

greater_correlation <- "williamsburg_north"