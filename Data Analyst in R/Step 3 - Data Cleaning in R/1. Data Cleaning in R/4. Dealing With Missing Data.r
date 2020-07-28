## 1. Exploring Academic Success and Demographics by Borough ##

combined <- read_csv("combined.csv")

## 2. Defining "Missing Data" ##

summary <- combined %>%
  group_by(boro) %>%
  summarize(mean(avg_sat_score))

## 3. Contagious Missing Values ##

summary <- combined %>%
  group_by(boro) %>%
  summarize(mean(avg_sat_score))
summary <- combined %>%
  group_by(boro) %>%
  summarize(mean(avg_sat_score, na.rm = TRUE))

## 4. Dropping Rows With Missing Values for one Variable ##

summary <- combined %>%
  group_by(boro) %>%
  summarize(mean(avg_sat_score, na.rm = TRUE))
summary_2 <- combined %>%
  drop_na(boro) %>%
  group_by(boro) %>%
  summarize(sat_avg = mean(avg_sat_score, na.rm = TRUE))

## 5. Complete Cases: Dropping All Rows With Missing Data ##

summary_3 <- combined %>%
  drop_na() %>%
  group_by(boro) %>%
  summarize(mean(avg_sat_score))

## 6. Using Complete Cases: When to Avoid ##

na_count <- colSums(is.na(combined))

## 7. Understanding Effects of Different Techniques for Handling Missing Data ##

summary_4 <- combined %>%
    drop_na(boro) %>%
    group_by(boro) %>%
    summarize(mean(avg_sat_score, na.rm = TRUE), mean(frl_percent, na.rm = TRUE), mean(`AP Test Takers`, na.rm = TRUE))

## 8. Imputing to Replace Missing Data ##

combined <- combined  %>%
  mutate(`AP Test Takers` = replace_na(`AP Test Takers`, 2.5))
    
combined_2 <- combined %>%
  drop_na(boro)

ggplot(data = combined_2) +
    aes(x = boro, y = `AP Test Takers`) +
    geom_boxplot()