## 2. What is a probability? ##

p_5 <- 1 / 6
p_lottery <- 1 / 350000

## 3. Outcomes vs Events ##

p_heart <- 13 / 52
p_2_or_3 <- 8 / 52

## 4. Empirical Probability ##

p_three <- 18 / 100

## 5. Repeating Experiments ##

set.seed(1)

coin_toss <- function() {
    toss <- runif(1)
    if (toss <= 0.5) {
        return("HEADS")
    } else {
        return("TAILS")
    }
}
heads <- 0
n_experiments <- 10
for (i in 1:n_experiments) {
    toss <- coin_toss()
    if (toss == "HEADS") {
        heads <- heads + 1
    }
}

experiment_one <- heads / n_experiments

n_experiments <- 100
heads_2 <- 0
for (i in 1:n_experiments) {
    toss <- coin_toss()
    if (toss == "HEADS") {
        heads_2 <- heads_2 + 1
    }
}

experiment_two <- heads_2 / n_experiments

## 6. The Law of Large Numbers ##

set.seed(1)

coin_toss <- function() {
    toss <- runif(1)
    if (toss <= 0.5) {
        return("HEADS")
    } else {
        return("TAILS")
    }
}
heads <- 0
n_experiments <- 10
for (i in 1:n_experiments) {
    toss <- coin_toss()
    if (toss == "HEADS") {
        heads <- heads + 1
    }
}

experiment_diff_one <- 0.5 - (heads / n_experiments)

n_experiments <- 100
heads_2 <- 0
for (i in 1:n_experiments) {
    toss <- coin_toss()
    if (toss == "HEADS") {
        heads_2 <- heads_2 + 1
    }
}

experiment_diff_two <- 0.5 - (heads_2 / n_experiments)

n_experiments <- 1000
heads_3 <- 0
for (i in 1:n_experiments) {
    toss <- coin_toss()
    if (toss == "HEADS") {
        heads_3 <- heads_3 + 1
    }
}

experiment_diff_three <- 0.5 - (heads_3 / n_experiments)