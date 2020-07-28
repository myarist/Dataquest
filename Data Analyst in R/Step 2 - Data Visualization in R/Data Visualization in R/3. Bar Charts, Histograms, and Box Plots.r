## 1. Visualizing Distributions to Investigate Movie Review Bias ##

reviews <- read_csv("movie_reviews.csv")

## 2. Comparing Averages Among Rating Sites ##

review_avgs <- reviews %>%
  group_by(Rating_Site) %>%
  summarize(mean(Rating))

## 3. Visualizing Differences Among Groups Using Bar Charts ##

review_avgs <- reviews %>%
  group_by(Rating_Site) %>%
  summarize(avg = mean(Rating))
ggplot(data = review_avgs,
  aes(x = Rating_Site, y = avg)) +
  geom_bar(stat = "identity")

## 4. Using Histograms to Understand Distributions ##

ggplot(data = reviews, 
  aes(x = Rating)) +
  geom_histogram(bins = 30)

## 5. Comparing Distributions of Multiple Variables: Faceted Plots ##

# ggplot(data = reviews, 
#   aes(x = Rating)) +
#   geom_histogram(bins = 30)
ggplot(data = reviews, 
  aes(x = Rating)) +
  geom_histogram(bins = 30) +
  facet_wrap(~Rating_Site, nrow= 2)

## 6. Comparing Distributions of Multiple Variables: Specifying Aesthetics ##

# ggplot(data = reviews, 
#  aes(x = Rating)) +
#  geom_histogram(bins = 30)
ggplot(data = reviews, 
  aes(x = Rating, fill= Rating_Site)) +
  geom_histogram(bins = 30)

## 7. Visualizing Averages and Variation ##

ggplot(data = reviews,
  aes(x = Rating_Site, y = Rating)) +
  geom_boxplot()

## 8. Anatomy of a Box Plot ##

# ggplot(data = reviews,
#   aes(x = Rating_Site, y = Rating)) +
#   geom_boxplot()
ggplot(data = reviews,
  aes(x = Rating_Site, y = Rating)) +
  geom_boxplot() +
  labs(title = "Comparison of Movie Ratings") +
  theme(panel.background = element_rect(fill = "white"))