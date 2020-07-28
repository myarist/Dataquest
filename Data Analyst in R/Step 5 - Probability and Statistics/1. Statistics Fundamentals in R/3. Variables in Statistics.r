## 2. Quantitative and Qualitative Variables ##

library(readr)
wnba <- read_csv("wnba.csv")

# variables <- c("Three_PA", "Age", "AST", "Birth_Place", "Birthdate", "BMI", "College", 
#                "DREB", "Experience", "FGA", "FGM", "FT_perc", "FTA", "FTM", "Games_Played", 
#                "Height", "MIN", "Name", "OREB", "Pos", "PTS", "REB", "Team", "Weight")
qualitative_vars <- c("Birth_Place", "College", "Name", "Pos", "Team")

quantitative_vars <- c("Three_PA", "Age", "AST", "Birthdate", "BMI", "DREB", "Experience", 
                       "FGA", "FGM", "FT_perc", "FTA", "FTM", "Games_Played", "Height", 
                       "MIN", "OREB", "PTS", "REB", "Weight")

qualitative_vars <- sort(qualitative_vars)
quantitative_vars <- sort(quantitative_vars)

## 4. The Nominal Scale ##

# variables <- c("Three_PA", "Age", "AST", "Birth_Place", "Birthdate", 
#                "BMI", "College", "DREB", "Experience", "FGA", 
#                "FGM", "FT_perc", "FTA", "FTM", "Games_Played", 
#                "Height", "MIN", "Name", "OREB", "Pos", 
#                "PTS", "REB", "Team", "Height_labels")
nominal_scale <- sort(c("Name", "Team", "Pos", "Birth_Place", "College"))

## 5. The Ordinal Scale ##

question_1 <- TRUE
question_2 <- FALSE
question_3 <- FALSE
question_4 <- TRUE
question_5 <- FALSE
question_6 <- FALSE

## 7. The Difference Between Ratio and Interval Scales ##

# quantitative_vars <- c("Three_PA", "Age", "AST", "Birthdate", "BMI", "DREB", "Experience", 
#                        "FGA", "FGM", "FT_perc", "FTA", "FTM", "Games_Played", "Height", 
#                        "MIN", "OREB", "PTS", "REB", "Weight", "Weight_deviation")
interval_scale <- sort(c("Birthdate", "Weight_deviation"))
ratio_scale <- sort(c("Three_PA", "Age", "AST", "BMI", "DREB", "Experience", "FGA", "FGM", "FT_perc", "FTA", "FTM", 
                "Games_Played", "Height", "MIN", "OREB", "PTS", "REB", "Weight"))

## 9. Discrete and Continuous Variables ##

# ratio_scale <- sort(c("Three_PA", "Age", "AST", "BMI", "DREB", "Experience", "FGA", "FGM", "FT_perc", "FTA", "FTM", 
#                 "Games_Played", "Height", "MIN", "OREB", "PTS", "REB", "Weight"))
continuous <- sort(c("Age", "BMI", "Experience", "FT_perc", "Height", "MIN", "Weight"))
discrete <- sort(c("Three_PA", "AST", "DREB", "FGA", "FGM", "FTA", "FTM", "Games_Played", "OREB", "PTS", "REB"))

## 10. Real Limits ##

# bmi <- list(
#   "21.201" = c(, ),
#   "21.329" = c(, ),
#   "23.875" = c(, ),
#   "24.543" = c(, ),
#   "25.469" = c(, ))
bmi <- list(
  "21.201" = c(21.2005, 21.2015),
  "21.329" = c(21.3285, 21.3295),
  "23.875" = c(23.8745, 23.8755),
  "24.543" = c(24.5425, 24.5435),
  "25.469" = c(25.4685, 25.4695))

bmi