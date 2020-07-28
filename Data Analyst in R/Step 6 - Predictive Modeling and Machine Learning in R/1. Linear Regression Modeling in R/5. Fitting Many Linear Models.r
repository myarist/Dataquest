## 2. Tidy model outputs with broom::tidy() ##

library(readr)
williamsburg_north <- suppressMessages(read_csv("williamsburg_north.csv"))
library(broom)

condos_lm_fit <- lm(sale_price ~ gross_square_feet, data = williamsburg_north)

condos_lm_tidied <- tidy(x = condos_lm_fit, conf.int = TRUE)

## 4. Nested data ##

library(tidyr)
library(dplyr)
brooklyn_nested <- brooklyn_top_ten %>% 
  group_by(neighborhood) %>% 
  nest()

# Return neighborhood name with:
# brooklyn_nested$neighborhood[[6]]

# Return dataframe for Madison
Madison <- brooklyn_nested$data[[6]]

## 5. Generate many linear models ##

library(purrr)
# brooklyn_nested <- brooklyn_top_ten %>% 
#   group_by(neighborhood) %>% 
#   nest()
brooklyn_nested <- brooklyn_top_ten %>% 
  group_by(neighborhood) %>% 
  nest() %>% 
  mutate(linear_model = map(.x = data, 
                            .f = ~lm(sale_price ~ gross_square_feet, data = .)))

## 6. Returning tidy model outputs ##

library(broom)
# brooklyn_nested <- brooklyn_top_ten %>% 
#   group_by(neighborhood) %>% 
#   nest() %>% 
#   mutate(linear_model = map(.x = data, 
#                             .f = ~lm(sale_price ~ gross_square_feet, data = .)))
brooklyn_nested <- brooklyn_top_ten %>% 
  group_by(neighborhood) %>% 
  nest() %>% 
  mutate(linear_model = map(.x = data, 
                            .f = ~lm(sale_price ~ gross_square_feet, 
                                     data = .))) %>%
  mutate(tidy_coefficients = map(.x = linear_model, 
                              .f = tidy, 
                              conf.int = TRUE))

## 7. Unnesting to return tidy data summaries ##

# brooklyn_nested <- brooklyn_top_ten %>% 
#   group_by(neighborhood) %>% 
#   nest() %>% 
#   mutate(linear_model = map(.x = data, 
#                             .f = ~lm(sale_price ~ gross_square_feet, 
#                                      data = .))) %>%
#   mutate(tidy_coefficients = map(.x = linear_model, 
#                               .f = tidy, 
#                               conf.int = TRUE))
brooklyn_coefficients <- brooklyn_nested %>% 
  select(neighborhood, tidy_coefficients) %>% 
  unnest(cols = tidy_coefficients)

brooklyn_slope <- brooklyn_coefficients %>%   
  filter(term == "gross_square_feet") %>% 
  arrange(estimate)

## 8. Tidy summary statistics with broom::glance() ##

# brooklyn_nested <- brooklyn_top_ten %>% 
#   group_by(neighborhood) %>% 
#   nest() %>% 
#   mutate(linear_model = map(.x = data, 
#                             .f = ~lm(sale_price ~ gross_square_feet, 
#                                      data = .))) %>%
#   mutate(tidy_coefficients = map(.x = linear_model, 
#                               .f = tidy, 
#                               conf.int = TRUE))
brooklyn_nested <- brooklyn_top_ten %>% 
  group_by(neighborhood) %>% 
  nest() %>% 
  mutate(linear_model = map(.x = data, 
                            .f = ~lm(sale_price ~ gross_square_feet, 
                                     data = .))) %>%
  mutate(tidy_coefficients = map(.x = linear_model, 
                                 .f = tidy, 
                                 conf.int = TRUE)) %>% 
  mutate(tidy_summary_stats = map(.x = linear_model,
                                  .f = glance))

brooklyn_summary_stats <- brooklyn_nested %>% 
  select(neighborhood, tidy_summary_stats) %>% 
  unnest(cols = tidy_summary_stats)

## 9. Augment dataframes with broom::augment() ##

brooklyn_nested <- brooklyn_top_ten %>% 
  group_by(neighborhood) %>% 
  nest() %>% 
  mutate(linear_model = map(.x = data, 
                            .f = ~lm(sale_price ~ gross_square_feet, 
                                     data = .))) %>%
  mutate(tidy_coefficients = map(.x = linear_model, 
                                 .f = tidy, 
                                 conf.int = TRUE)) %>% 
  mutate(tidy_summary_stats = map(.x = linear_model,
                                  .f = glance)) %>% 
  mutate(data_augmented = map2(.x = linear_model, 
                          .y = data, 
                          .f = augment))
brooklyn_augmented <- brooklyn_nested %>%
  select(neighborhood, data_augmented) %>% 
  unnest(data_augmented)