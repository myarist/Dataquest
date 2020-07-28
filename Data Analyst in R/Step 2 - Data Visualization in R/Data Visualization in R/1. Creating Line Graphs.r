## 1. Introduction to Data Visualization ##

library(readr)
life_expec <- read_csv("life_expec.csv")

## 4. Data Visualization and the Grammar of Graphics ##

ggplot(data = life_expec)

## 5. Mapping Variables to Axes ##

# ggplot(data = life_expec)
ggplot(data = life_expec,
  aes(x = Year, y = Avg_Life_Expec))

## 6. Adding Geometric Objects to Visualize Data Points ##

# ggplot(data = life_expec, 
#  aes(x = Year, y = Avg_Life_Expec))
ggplot(data = life_expec,
  aes(x = Year, y = Avg_Life_Expec)) +
  geom_line()

## 7. Selecting Data for Visualization ##

life_expec_filter <- life_expec %>%
  filter(Race == "All Races" & Sex == "Both Sexes")

ggplot(data = life_expec_filter,
  aes(x = Year, y = Avg_Life_Expec)) +
  geom_line()

## 8. Adding Graph Titles and Changing Axis Labels ##

# ggplot(data = life_expec_filter,
#  aes(x = Year, y = Avg_Life_Expec)) +
#  geom_line()
ggplot(data = life_expec_filter,
  aes(x = Year, y = Avg_Life_Expec)) +
  geom_line() +
  labs(title = "United States Life Expectancy: 100 Years of Change", y = "Average Life Expectancy (Years)")

## 9. Refining Graph Aesthetics ##

# ggplot(data = life_expec_filter,
#  aes(x = Year, y = Avg_Life_Expec)) +
#  geom_line() +
#  labs(title = "United States Life Expectancy: 100 Years of Change", y = "Average Life Expectancy (Years)")
ggplot(data = life_expec_filter,
  aes(x = Year, y = Avg_Life_Expec)) +
  geom_line() +
  labs(title = "United States Life Expectancy: 100 Years of Change", y = "Average Life Expectancy (Years)") +
  theme(panel.background = element_rect(fill = "white"))