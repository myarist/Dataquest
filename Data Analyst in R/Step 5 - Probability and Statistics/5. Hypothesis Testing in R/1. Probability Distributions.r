## 2. Useful Qualities of Probability Distributions ##

are_uniforms <- FALSE
most_probable_A <- 1
total_probability_B <- 0.2 + 0.2 + 0.2 + 0.2 + 0.3
is_B_valid <- FALSE

## 4. Example: Sum of Two Dice Rolls ##

prob_2 <- 1/36
prob_4 <- 3/36
prob_7 <- 6/36
prob_10 <- prob_4

## 5. Cumulative Probability ##

prob_leq_6 <- 1/36 + 2/36 + 3/36 + 4/36 + 5/36
prob_gt_9 <- 6/36
prob_btwn_6_and_8 <- 5/36 + 6/36 + 5/36

## 8. Probability Distribution Function for the Normal ##

prob_norm_0 <- dnorm(0)
prob_norm_5 <- dnorm(5, 5, 5)
prob_norm_1 <- dnorm(-1, 1, 2)