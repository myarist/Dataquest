## 1. The Importance of Data Cleaning ##

sat_results <- read_csv("sat_results.csv") 
ap_2010 <- read_csv("ap_2010.csv") 
class_size <- read_csv("class_size.csv")
demographics <- read_csv("demographics.csv") 
graduation <- read_csv("graduation.csv") 
hs_directory <- read_csv("hs_directory.csv")

## 3. SAT Data: Changing Data Types and Creating New Variables ##

sat_results <- sat_results %>%
    mutate(`Num of SAT Test Takers` =  as.numeric(`Num of SAT Test Takers`),
         `SAT Writing Avg. Score` = as.numeric(`SAT Writing Avg. Score`), 
         `SAT Critical Reading Avg. Score` = as.numeric(`SAT Critical Reading Avg. Score`),
         `SAT Math Avg. Score` = as.numeric(`SAT Math Avg. Score`)) %>%
    mutate(avg_sat_score = `SAT Writing Avg. Score` + `SAT Critical Reading Avg. Score` + `SAT Math Avg. Score`)

## 4. AP Exam Data: Changing Data Types and Creating a New Variable ##

ap_2010 <- ap_2010 %>%
  mutate_at(3:5, as.numeric) %>%
  mutate(exams_per_student = `Total Exams Taken` / `AP Test Takers`) %>%
  mutate(high_score_percent = (`Number of Exams with scores 3 4 or 5`/`Total Exams Taken`)*100)

## 5. Class Size Data: Simplifying the Data Frame ##

class_size <- class_size %>%
  filter(GRADE == "09-12", `PROGRAM TYPE` == "GEN ED")

## 6. Class Size Data: Calculating School Averages ##

class_size <- class_size %>%
  group_by(CSD, `SCHOOL CODE`, `SCHOOL NAME`) %>%
  summarize(avg_class_size = mean(`AVERAGE CLASS SIZE`), 
            avg_largest_class = mean(`SIZE OF LARGEST CLASS`),
            avg_smallest_class = mean(`SIZE OF SMALLEST CLASS`))

## 7. Class Size Data: Creating a Key Using String Manipulation ##

class_size <- class_size %>%
  mutate(DBN = str_c(CSD, `SCHOOL CODE`, sep = "")) %>%
  mutate(DBN = str_pad(DBN, width = 6, side = 'left', pad = "0"))

## 8. Graduation Data: Simplifying the Data Frame ##

graduation <- graduation %>%
  filter(Cohort == "2006" & Demographic == "Total Cohort") %>%
  select(DBN, `School Name`, `Total Grads - % of cohort`, `Dropped Out - % of cohort`)

## 9. Demographics Data: Simplifying the Data Frame ##

demographics <- demographics %>%
  filter(schoolyear == "20112012" & grade9 != "NA") %>%
  select(DBN, Name, frl_percent, total_enrollment, ell_percent, 
         sped_percent, asian_per, black_per, 
         hispanic_per, white_per, male_per, female_per)

## 10. Demographics Data: Removing Variables to Simplify Dataframe ##

demographics_clean <- demographics %>%
  select(-Name, -female_per)

## 11. High School Directory: Simplifying the Data Frame ##

hs_directory <- hs_directory %>%
  rename(DBN = dbn) %>%
  select(DBN, school_name, `Location 1`)

## 12. Confirm that Data Frames are Prepared for Joining ##

ny_schools <- list(sat_results, ap_2010, class_size, demographics, graduation, hs_directory)
names(ny_schools) <- c("sat_results", "ap_2010", "class_size", "demographics", "graduation", "hs_directory")

duplicate_DBN <- ny_schools %>%
  map(mutate, is_dup = duplicated(DBN))  %>%
  map(filter, is_dup == "TRUE")

## 13. Removing Duplicate Rows ##

ap_2010 <- ap_2010 %>%
  filter(SchoolName != "YOUNG WOMEN'S LEADERSHIP SCH")