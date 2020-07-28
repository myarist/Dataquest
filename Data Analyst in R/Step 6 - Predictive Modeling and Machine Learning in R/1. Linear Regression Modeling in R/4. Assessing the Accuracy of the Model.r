## 2. Plotting the Residuals ##

library(readr)
williamsburg_north <- suppressMessages(read_csv("williamsburg_north.csv"))
library(dqanswerchecking)
condos_lm_fit <- lm(sale_price ~ gross_square_feet, data = williamsburg_north)

library(ggplot2)
residuals_df <- data.frame(condos_lm_fit$residuals)

ggplot(data = residuals_df, aes(x = condos_lm_fit.residuals)) +
  geom_histogram()

## 4. The t-statistic ##

t_statistic <- (1926.6 - 0) / 169.5

## 5. The p-value ##

p_value <- coef(summary(condos_lm_fit))[, 4][[2]]
reject_null_hypothesis <- TRUE

## 6. Confidence Intervals ##

slope_CI_lower <- condos_lm_fit$coefficients[[2]] - 2 * 
  coef(summary(condos_lm_fit))[, 2][[2]]

slope_CI_upper <- condos_lm_fit$coefficients[[2]] + 2 * 
  coef(summary(condos_lm_fit))[, 2][[2]]

slope_CI <- confint(condos_lm_fit)[2,]

## 7. Residual Standard Error ##

library(dplyr)
# Add residuals and squared-residuals
williamsburg_north <- williamsburg_north %>%
  mutate(residuals = resid(condos_lm_fit)) %>% 
  mutate(resid_squared = residuals^2)
# Compute the residual sum of squares (RSS)
RSS <- williamsburg_north %>% 
  summarise(RSS = sum(resid_squared)) %>% 
  pull()
# Extract RSS from model output
RSS_from_lm <- deviance(condos_lm_fit)
# Optional: check RSS equality
near(RSS, deviance(condos_lm_fit))
# Manual RSE
RSE <- sqrt(RSS / (nrow(williamsburg_north) - 2))
# Alternate method for RSE
RSE <- sqrt(1 / (nrow(williamsburg_north) - 2) * RSS)
lm_fit_sigma <- sigma(condos_lm_fit)
are_equal <- near(RSE, lm_fit_sigma)

## 8. The R-squared Statistic ##

# Add residuals and squared-residuals
williamsburg_north <- williamsburg_north %>%
  mutate(residuals = resid(condos_lm_fit)) %>% 
  mutate(resid_squared = residuals^2)
# Compute the residual sum of squares (RSS)
RSS <- williamsburg_north %>% 
  summarise(RSS = sum(resid_squared)) %>% 
  pull()
TSS <- sum((williamsburg_north$sale_price - 
              mean(williamsburg_north$sale_price))^2)

r_squared <- 1 - RSS/TSS

lm_r_squared <- summary(condos_lm_fit)$r.squared

are_equal <- near(r_squared, lm_r_squared)

adj_r_squared <- summary(condos_lm_fit)$adj.r.squared