## 2. R toolset for Data Analysis: Tidyverse Packages ##

library(readr)

## 3. Describing our dataset ##

dataset_n_cols <- 5L
col_3_name <-"salary_min"
col_4_type <- "numeric"

## 4. Identifying a dataset type ##

q_1 <- FALSE
q_2 <- TRUE
q_3 <- FALSE

## 5. Importing and storing data in R ##

library(readr)
# Add your code below
monster_jobs_clean <- read_csv("monster_jobs_clean.csv")

## 6. Characterizing a dataset ##

#monster_jobs_clean  is available from the previous screen
n_cols_clean <- ncol(monster_jobs_clean)
n_rows_clean <- nrow(monster_jobs_clean)
names_clean <- colnames(monster_jobs_clean)

## 7. Exploring a dataset: View the first lines ##

monster_jobs_clean_head <- head(monster_jobs_clean)

## 8. Exploring a dataset: View the last lines ##

monster_jobs_clean_tail <- tail(monster_jobs_clean)

## 9. Visualizing data science salaries ##

library(ggplot2)

salary_max_viz <- qplot(x = job_id,
                        y = salary_max,
                        data = monster_jobs_clean)

salary_max_viz

## 10. Visualizing data science salaries by job type ##

library(ggplot2)

salary_max_with_color_viz <- qplot(x = job_id,
                                   y = salary_max,
                                   color = job_type,
                                   data = monster_jobs_clean)

salary_max_with_color_viz