## 2. Fitting a Bivariate Linear Regression Model ##

library(readr)
williamsburg_north <- suppressMessages(read_csv("williamsburg_north.csv"))
condos_lm_fit <- lm(sale_price ~ gross_square_feet, data = williamsburg_north)
summary(condos_lm_fit)

## 3. Estimating the Slope ##

slope <- function(predictor, response){
  mean_predictor <- mean(predictor)
  mean_response <- mean(response)
  numerator <- sum((predictor - mean_predictor) * (response - mean_response))
  denominator <- sum((predictor - mean_predictor)^2)
  beta_1 <- numerator / denominator
  beta_1
}

condos_slope <- slope(predictor = williamsburg_north$gross_square_feet, 
                      response = williamsburg_north$sale_price)

slope_equal <- dplyr::near(condos_slope, coef(condos_lm_fit)[[2]])

## 4. Estimating the Intercept ##

condos_slope <- slope(predictor = williamsburg_north$gross_square_feet, 
                      response = williamsburg_north$sale_price)
intercept <- function(predictor, response, slope){
  beta_0 <- mean(response) - (slope * mean(predictor))
  beta_0
}

condos_intercept <- intercept(predictor = williamsburg_north$gross_square_feet, 
                              response = williamsburg_north$sale_price, 
                              slope = condos_slope)

intercept_equal <- dplyr::near(condos_intercept, coef(condos_lm_fit)[[1]])

## 5. Visualizing Model Fit ##

library(ggplot2)
ggplot(data = williamsburg_north, 
       aes(x = gross_square_feet, y = sale_price)) +
  geom_point() +
  scale_y_continuous(labels = scales::comma) +
  geom_smooth(method = "lm", se = FALSE) + 
  geom_abline(aes(intercept = coef(condos_lm_fit)[[1]], 
                  slope = coef(condos_lm_fit)[[2]]), 
              color = "black", 
              linetype = "dashed",
              size = 1)

## 6. Estimating the Predictions ##

library(dplyr)
condos_lm_fit <- lm(sale_price ~ gross_square_feet, data = williamsburg_north)

williamsburg_north <- williamsburg_north %>% 
  mutate(predictions = coef(condos_lm_fit)[[1]] + 
           coef(condos_lm_fit)[[2]] * gross_square_feet)

near <- dplyr::near(williamsburg_north$predictions, fitted(condos_lm_fit))

## 7. Estimating the Residuals ##

williamsburg_north <- williamsburg_north %>%
  mutate(residuals = sale_price - predictions)

near <- dplyr::near(williamsburg_north$residuals, resid(condos_lm_fit))

## 8. Estimating the Residual Sum of Squares ##

williamsburg_north <- williamsburg_north %>% 
  mutate(resid_squared = residuals^2)

RSS <- williamsburg_north %>% 
  summarise(RSS = sum(resid_squared)) %>% 
  pull()

RSS_from_lm <- deviance(condos_lm_fit)