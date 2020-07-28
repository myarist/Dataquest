## 1. Multiple Random Experiments ##

p_a <- 12/100
p_b <- 17/100
p_a_and_b <- 3/100
p_a_or_b <- p_a + p_b - p_a_and_b

## 2. The Multiplication Rule ##

p_6_6 <- 1/6 * 1/6
p_3_2 <- 1/6 * 1/6
p_even_even <- 3/6 * 3/6
p_1_even <- 1/6 * 3/6

## 3. Independent Events ##

sql_and_ml <- 0.2 * 0.3
ml_or_viz <- 0.3 + 0.4 - (0.3 * 0.4)
at_least_one_skill <- 0.2 + 0.3 + 0.4 - (0.2 * 0.3) - (0.2 * 0.4) - (0.3 * 0.4) - (0.2 * 0.3 * 0.4)

## 4. Independence vs Mutual Exclusivity ##

sql_and_ml_me <- 0
ml_or_viz_me <- 0.3 + 0.4
at_least_one_skill_me <- 0.2 + 0.3 + 0.4

## 5. Complements ##

p_complement_even <- 1/2
p_complement_ace <- 48/52

## 6. Using Complements With Probability ##

p_one_double_6 <- 1 - (35/36)**24

## 7. Another Application: Detecting Dependence ##

p_intersection <- (0.1 * 0.17)
is_independent <- p_intersection == 0.08