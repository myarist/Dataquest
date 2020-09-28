## 1. Independence vs. Exclusivity ##

statement_1 = False
statement_2 = True
statement_3 = True

## 2. Example Walk-through ##

p_spam = 0.2388
p_secret_given_spam = 0.4802
p_secret_given_non_spam = 0.1284
p_non_spam = 1 - p_spam
p_spam_and_secret = p_spam * p_secret_given_spam
p_non_spam_and_secret = p_non_spam * p_secret_given_non_spam
p_secret = p_spam_and_secret + p_non_spam_and_secret

## 3. A General Formula ##

p_boeing = 0.73
p_airbus = 0.27
p_delay_given_boeing = 0.03
p_delay_given_airbus = 0.08

p_delay = p_boeing*p_delay_given_boeing + p_airbus*p_delay_given_airbus

## 4. Formula for Three Events ##

p_boeing = 0.62
p_airbus = 0.35
p_erj = 0.03
p_delay_boeing = 0.06 
p_delay_airbus = 0.09
p_delay_erj = 0.01
p_delay = p_boeing*p_delay_boeing + p_airbus*p_delay_airbus + p_erj*p_delay_erj

## 6. Bayes' Theorem ##

p_boeing = 0.73
p_airbus = 0.27
p_delay_given_boeing = 0.03
p_delay_given_airbus = 0.08
p_delay = p_boeing*p_delay_given_boeing + p_airbus*p_delay_given_airbus
p_airbus_delay = (p_airbus * p_delay_given_airbus) / p_delay

## 7. Prior and Posterior Probability ##

p_spam = 0.2388
p_secret_given_spam = 0.4802
p_secret_given_non_spam = 0.1284
# Exercise 1
p_non_spam = 1 - p_spam
p_secret = p_spam*p_secret_given_spam + p_non_spam*p_secret_given_non_spam
p_spam_given_secret = (p_spam*p_secret_given_spam) / p_secret

# Exercise 2 and 3
prior = p_spam
posterior = p_spam_given_secret

# Exercise 4
ratio = posterior/prior