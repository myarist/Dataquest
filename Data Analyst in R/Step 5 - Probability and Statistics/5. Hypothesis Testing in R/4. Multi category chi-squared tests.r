## 2. Calculating expected values ##

males_over50k <- .67 * .241 * 32561
males_under50k <- .67 * .759 * 32561
females_over50k <- .33 * .241 * 32561
females_under50k <- .33 * .759 * 32561

## 3. Calculating the chi-squared statistic ##

chisq_gender_income <- 0
observed <- c(6662, 1179, 15128, 9592)
expected <- c(5257.6, 2589.6, 16558.2, 8155.6)

for (i in 1:length(observed)) {
    O <- observed[i]
    E <- expected[i]
    chisq_gender_income <- chisq_gender_income + (O - E)^2 / E
}

## 4. Calculating degrees of freedom ##

r <- 2
c <- 2
df <- (r - 1) * (c - 1)

## 5. Calculating p-value ##

pvalue <- 1 - pchisq(1517, 1)
reject_null <- TRUE

## 6. R's built-in chi-squared test function ##

library(readr)
income <- read.csv("income.csv")
race_education_table <- table(income$race, income$education)
chisq.test(race_education_table)
reject_null <- TRUE