## 1. The Importance of Counting ##

n_outcomes <- 6 * 6

p_six_six <- 1 / n_outcomes
p_five_five <- 1 / n_outcomes
p_not_five_five <- 1 - p_five_five

## 2. Extending The Rule of Product ##

total_outcomes <- 6 * 6 * 6 * 52
p_666_ace_diamonds <- 1 / total_outcomes
p_no_666_ace_diamonds <- 1 - p_666_ace_diamonds

## 3. A More Concrete Example ##

total_outcomes_4_pin <- 10^4 # 10 multiplied by itself 4 times
p_crack_4 <- 1 / total_outcomes_4_pin

total_outcomes_6_pin <- 10^6 # 10 multiplied by itself 6 times
p_crack_6 <- 1/total_outcomes_6_pin

## 4. With Replacement vs Without Replacement ##

size_num_4 <- 10 * 9 * 8 * 7
size_num_6 <- 10 * 9 * 8 * 7 * 6 * 5

## 5. Permutations ##

factorial <- function(n) {
    final_product <- 1
    for (i in 1:n) {
        final_product = final_product * i
    }
    return(final_product)
}

permutations_1 <- factorial(6) # because there are 6 letters
permutations_2 <- factorial(52)

## 6. More About Permutations ##

factorial <- function(n) {
    final_product <- 1
    for (i in 1:n) {
        final_product = final_product * i
    }
    return(final_product)
}
permutation <- function(n, k) {
    return(factorial(n) / factorial(n - k))
}

perm_3_52 <- permutation(52,3)
perm_4_20 <- permutation(20, 4)

## 7. Sometimes Order Doesn't Matter ##

factorial <- function(n) {
    final_product <- 1 
    for (i in 1:n) {
        final_product <- final_product * i
    }
    return(final_product)
}

permutation <- function(n, k) {
    return(factorial(n) / factorial(n - k))
}
c <- permutation(52, 5) / factorial(5)
p_aces_7 <- 1/c

c_lottery <- permutation(49,6) / factorial(6)
p_big_prize <- 1/c_lottery

## 8. Combination Notation ##

factorial <- function(n) {
    final_product <- 1 
    for (i in 1:n) {
        final_product <- final_product * i
    }
    return(final_product)
}
combination <- function(n, k) {
    return(factorial(n)/(factorial(n - k) * factorial(k)))
}

c_18 <- combination(34, 18)

p_Y <- 1/c_18
p_non_Y <- 1 - p_Y