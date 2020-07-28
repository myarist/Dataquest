## 2. Introduction To The Data ##

library(tidyverse)
student_scores <- read_csv("scores.csv")

## 3. Preparing Our Function ##

library(tidyverse)
percent_string <- "74%"
format_score <- function(score) {
  fmt_string <- str_replace(score, "%", "")
  num <- as.numeric(fmt_string)
  
  return(num)
}

converted_string <- format_score(percent_string)

## 4. The map Function ##

library(tidyverse)
input_scores <- c("83%", "29%", "76%")

format_score <- function(score) {
  fmt_string <- str_replace(score, "%", "")
  num <- as.numeric(fmt_string)
  
  return(num)
}
output_scores <- map(input_scores, format_score)
third_element <- output_scores[[3]]

## 5. Creating New Columns With map ##

library(tidyverse)
student_scores <- read_csv("scores.csv")
format_score <- function(score) {
  fmt_string <- str_replace(score, "%", "")
  num <- as.numeric(fmt_string)
  
  return(num)
}

student_scores <- student_scores %>%
  mutate(
    new_writing_score = unlist(map(writing_score, format_score))
  )
student_scores <- student_scores %>%
  mutate(
    new_math_score = unlist(map(math_score, format_score)),
    new_science_score = unlist(map(science_score, format_score))
  )

## 6. Two Input Variation of map ##

input_score <- 50
add_extra_credit <- function(score, note) {
  if (note == "None") {
      points_to_add <- 0
  } else if (note == "Low") {
      points_to_add <- 1
  } else {
      points_to_add <- 5
  }
    
  return(score + points_to_add)
}

no_extra_credit_score <- add_extra_credit(input_score, "None")
low_extra_credit_score <- add_extra_credit(input_score, "Low")
high_extra_credit_score <- add_extra_credit(input_score, "High")

## 7. Two Input Variation of map ##

library(tidyverse)
student_scores <- read_csv("scores.csv")

format_score <- function(score) {
  fmt_string <- str_replace(score, "%", "")
  num <- as.numeric(fmt_string)
  
  return(num)
}

student_scores <- student_scores %>%
  mutate(
    new_writing_score = unlist(map(writing_score, format_score)),
    new_math_score = unlist(map(math_score, format_score)),
    new_science_score = unlist(map(science_score, format_score))
  )

add_extra_credit <- function(score, note) {
  if (note == "None") {
      points_to_add <- 0
  } else if (note == "Low") {
      points_to_add <- 1
  } else {
      points_to_add <- 5
  }
    
  return(score + points_to_add)
}
student_scores <- student_scores %>%
  mutate(
    adjusted_math_score = map2(new_math_score, math_extra_credit, add_extra_credit)
  )

## 9. Lists As Inputs ##

library(tidyverse)
input_list <- list(
  1:10,
  11:20,
  21:30, 
  31:40,
  41:50
)
averages <- map(input_list, mean)

## 10. Vectorizing Summaries ##

high_scores_by_student <- student_scores %>%
  group_by(names) %>%
  summarize(
    highest_writing = max(new_writing_score),
    highest_math = max(modified_math_score),
    highest_science = max(new_science_score)
  )