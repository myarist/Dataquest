## 3. The if statement ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
if (nrow(recent_grads) > 1000) { 
  data_size <- "Large"
} else {
  data_size <- "Small"
}

## 4. The if_else() Function ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
new_recent_grads <- recent_grads %>% 
  mutate(
    median_level = if_else(Median > 50000, "Above Average", "Below Average"),
    greater_prop_gender = if_else(Women > Men, "Women", "Men")
  )

## 5. Moving Beyond Two Branches ##

wpm <- 70
if (wpm < 68) {
  classfication <- "Below Average"
} else if (wpm > 82) {
  classfication <- "Above Average"
} else {
  classification <- "Average"
}

## 6. Using Multiple Conditions ##

wpm <- 70
if (wpm >= 68 && wpm <= 82) {
  classfication <- "Average"
} else {
  classification <- "Not Average"
}

## 8. The case_when() Function ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
new_recent_grads <- recent_grads %>% 
  mutate(
    unemployment_level = case_when(
      Unemployment_rate < 0.2 ~ "<20%",
      Unemployment_rate >= 0.2 && Unemployment_rate < 0.4 ~ "20% to 40%",
      Unemployment_rate >= 0.4 && Unemployment_rate < 0.6 ~ "40% to 60%",
      Unemployment_rate >= 0.6 && Unemployment_rate < 0.8 ~ "60% to 80%",
      Unemployment_rate >= 0.8 ~ ">=80%"
    )
  )

## 9. Other Useful Comparison Operators ##

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
arts_grads <- recent_grads %>% 
  filter(
    Major_category %in% c("Arts", "Humanities and Liberal Arts")
  )

non_engineering_science_grads <- recent_grads %>% 
  filter(
    !(Major_category %in% c("Engineering", "Physical Sciences"))
  )