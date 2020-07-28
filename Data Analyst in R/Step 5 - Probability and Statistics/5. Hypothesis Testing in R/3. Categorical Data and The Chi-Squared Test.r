## 2. Observed Data vs Expected Data ##

female_diff <- (10771 - 16280.5) / 16280.5
male_diff <- (21790 - 16280.5) / 16280.5

## 3. Dealing With Cancellation ##

female_diff_sq <- (10771 - 16280.5)^2 / 16280.5
male_diff_sq <- (21790 - 16280.5)^2 / 16280.5
squared_diff_sum <- female_diff_sq + male_diff_sq

## 5. Developing a null hypothesis ##

pvalue <- 1 - pchisq(3728, 1)
reject_null <- TRUE

## 6. Importance of sample size ##

pvalue <- 1 - pchisq(1.8, 1)
reject_null <- FALSE

## 7. Considering More Categories ##

race_chisq <- 0
observed <- c(27816, 3124, 1039, 311, 271)
expected <- c(26146.5, 3939.9, 944.3, 260.5, 1269.8)

for (i in 1:length(observed)) {
    E <- expected[i]
    O <- observed[i]
    race_chisq <- race_chisq + ((O - E)^2/E)
}

## 8. Adjusting The Distribution Under The Null ##

pvalue <- 1 - pchisq(785, 4)