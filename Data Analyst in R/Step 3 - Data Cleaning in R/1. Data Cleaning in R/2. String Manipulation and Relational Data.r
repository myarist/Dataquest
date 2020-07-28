## 1. Importing the Cleaned NYC Schools Data into R ##

library(readr)
sat_results <- read_csv("sat_results_1.csv")
ap_2010 <- read_csv("ap_2010_1.csv") 
class_size <- read_csv("class_size_1.csv")
demographics <- read_csv("demographics_1.csv") 
graduation <- read_csv("graduation_1.csv") 
hs_directory <- read_csv("hs_directory_1.csv")

## 3. Parsing Numbers from Strings ##

graduation <- graduation %>%
  mutate(`Total Grads - % of cohort` = parse_number(`Total Grads - % of cohort`),
         `Dropped Out - % of cohort` = parse_number(`Dropped Out - % of cohort`))

## 4. Extracting Numeric Data From Strings: Creating New Variables ##

split_location <- str_split(hs_directory$`Location 1`, "\n", simplify = TRUE) 
hs_directory <- hs_directory %>%
  mutate(lat_long = split_location[,3])

## 5. Splitting Strings ##

lat_and_long <- str_split(hs_directory$lat_long, ",", simplify = TRUE)

hs_directory <- hs_directory %>%
  mutate(lat = lat_and_long[,1], long = lat_and_long[,2])

## 6. Subsetting strings ##

hs_directory <- hs_directory %>%
  mutate(lat = str_sub(lat, 2, -1), long = str_sub(long, 1, -2))%>%
  mutate_at(vars(lat, long), as.numeric)

## 8. Inner Joins ##

sat_class_size <- sat_results %>%
  inner_join(class_size, by = "DBN")

ggplot(data = sat_class_size) +
      aes(x = avg_class_size, y = avg_sat_score) +
      geom_point()

## 9. Outer Joins ##

demo_sat_left <- sat_results %>%
  left_join(demographics, by = "DBN")

demo_sat_right <- sat_results %>%
  right_join(demographics, by = "DBN")

demo_sat_full <- sat_results %>%
  full_join(demographics, by = "DBN")

## 10. Using Joins to Create A Single Data Frame ##

combined <- sat_results %>%
  full_join(ap_2010, by = "DBN") %>%
  left_join(class_size, by = "DBN") %>%
  left_join(demographics, by = "DBN") %>%
  left_join(graduation, by = "DBN") %>%
  left_join(hs_directory, by = "DBN")