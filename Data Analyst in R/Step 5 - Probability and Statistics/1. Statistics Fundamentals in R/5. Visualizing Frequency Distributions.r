## 2. Bar Charts ##

ggplot(data = wnba, 
       aes(x = Exp_ordinal, fill = Exp_ordinal)) +
  geom_bar() + 
  theme(legend.position = "none")

ggplot(data = wnba, 
       aes(x = Exp_ordinal, fill = Exp_ordinal)) +
  geom_bar() + 
  coord_flip() +  
  theme(legend.position = "none")

## 3. Proportions with Bar Charts ##

ggplot(data = wnba, 
       aes(x = Exp_ordinal, 
           y = ..prop.. * 100, 
           group = 1, 
           fill = factor(..x..))) +
  geom_bar() + 
  theme(legend.position = "none") +
  labs(x = "Experience Level",
       y = "Percentage")

## 4. Stacked Bar Charts ##

library(stringr)
exp_prop <- wnba %>% 
  group_by(Exp_ordinal) %>% 
  summarize(Prop = n() / nrow(wnba))

ggplot(data = exp_prop, 
       aes(x = "", y = Prop, fill = Exp_ordinal)) + 
  geom_bar(stat = "identity", width = 0.25) +
  coord_flip() +
  geom_text(aes(label = str_c(round(Prop * 100), "%")), 
            position = position_stack(vjust = 0.5)) + 
  labs(x = NULL, 
       y = NULL, 
       fill = NULL, 
       title = "Player Distribution by Experience Level") + 
  theme_classic() + 
  theme(axis.line = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())

## 5. Pie Charts ##

exp_prop <- 
  wnba %>% 
  group_by(Exp_ordinal) %>% 
  summarize(Prop = n() / nrow(wnba))
ggplot(data = exp_prop, 
       aes(x = "", y = Prop, fill = Exp_ordinal)) + 
  geom_bar(stat = "identity", width = 0.25) +
  coord_polar(theta = "y") +
  geom_text(aes(label = str_c(round(Prop * 100), "%")), 
            position = position_stack(vjust = 0.5)) + 
  labs(x = NULL, 
       y = NULL, 
       fill = NULL, 
       title = "Player Distribution by Experience Level") + 
  theme_classic() + 
  theme(axis.line = element_blank(),
          axis.text = element_blank(),
          axis.ticks = element_blank())

## 6. Histograms ##

ggplot(data = wnba, 
       aes(x = Games_Played)) +
  geom_histogram()

## 7. Binning for Histograms ##

# ggplot(data = wnba, 
#        aes(x = Games_Played)) +
#   geom_histogram()

# ggplot(data = wnba, 
#        aes(x = Games_Played)) +
#   geom_histogram(bins = 10)
ggplot(data = wnba, 
       aes(x = Games_Played)) +
  geom_histogram(bins = 4)

ggplot(data = wnba, 
       aes(x = Games_Played)) +
  geom_histogram(bins = 60)

## 8. The Statistics Behind Histograms ##

wnba <- wnba %>% 
  mutate(games_categories = cut(Games_Played, breaks = 10, dig.lab = 4))
games_binwidth <- (max(wnba$Games_Played) - min(wnba$Games_Played)) / 10

ggplot(data = wnba, 
       aes(x = Games_Played)) +
  geom_histogram(boundary = min(wnba$Games_Played), 
                 binwidth = games_binwidth)

## 9. Improving Axis Tick Marks ##

games_binwidth <- (max(wnba$Games_Played) - min(wnba$Games_Played)) / 10
ggplot(data = wnba, 
       aes(x = Games_Played)) +
  geom_histogram(boundary = min(wnba$Games_Played), 
                 binwidth = games_binwidth) +
  scale_x_continuous(breaks = seq(0, 35, by = 5))

## 11. Skewed Distributions ##

assists_dist <- 'right skewed'
ft_percent_dist <- 'left skewed'

## 12. Symmetrical Distributions ##

normal_distribution <- 'Height'