## 3. Using Bayes' Theorem ##

p_spam <- 0.5
p_non_spam <- 0.5
p_new_message <- 0.5417
p_new_message_given_spam <- 0.75
p_new_message_given_non_spam <- 0.3334
p_spam_given_new_message <- (p_spam * p_new_message_given_spam) / p_new_message
p_non_spam_given_new_message <- (p_non_spam * p_new_message_given_non_spam) / p_new_message

classification <- "spam"

## 4. Using Proportionality ##

p_spam <- 0.5
p_non_spam <- 0.5
p_new_message_given_spam <- 0.75
p_new_message_given_non_spam <- 0.3334
p_spam_given_new_message <- p_spam * p_new_message_given_spam
p_non_spam_given_new_message <- p_non_spam * p_new_message_given_non_spam

classification <- 'spam'

## 5. Classifying One Word Messages ##

p_spam_given_secret <- 8/21
p_non_spam <- 1/3
p_secret_given_non_spam <- 1/4
p_non_spam_given_secret <- p_non_spam * p_secret_given_non_spam
classification <- 'spam'

## 6. Classifying Multiple Word Messages ##

p_spam_given_w1_w2_w3_w4 <- 64/4802
p_non_spam <- 2/4
p_w1_given_non_spam <- 2/9
p_w2_given_non_spam <- 1/9
p_w3_given_non_spam <- 2/9
p_w4_given_non_spam <- 2/9

p_non_spam_given_w1_w2_w3_w4 <- (p_non_spam *
                                p_w1_given_non_spam * p_w2_given_non_spam *
                                p_w3_given_non_spam * p_w4_given_non_spam
                               )

classification <- 'spam'

## 9. Edge Case: Words Not In Vocabulary ##

p_spam <- 2/4
p_secret_given_spam <- 4/7
p_the_given_spam <- 0/7
p_money_given_spam <- 2/7
p_spam_given_message <- (p_spam * p_secret_given_spam *
                        p_the_given_spam * p_money_given_spam)
p_non_spam <- 2/4
p_secret_given_non_spam <- 2/9
p_the_given_non_spam <- 1/9
p_money_given_non_spam <- 0/9
p_non_spam_given_message <- (p_non_spam * p_secret_given_non_spam *
                            p_the_given_non_spam * p_money_given_non_spam)


print(p_spam_given_message)
print(p_non_spam_given_message)

## 10. Additive Smoothing ##

p_spam <- 2/4
p_secret_given_spam <- (4 + 1) / (7 + 9)
p_the_given_spam <- (0 + 1) / (7 + 9)
p_money_given_spam <- (2 + 1) / (7 + 9)
p_spam_given_message <- (p_spam * p_secret_given_spam *
                        p_the_given_spam * p_money_given_spam)
p_non_spam <- 2/4
p_secret_given_non_spam <- (2 + 1) / (9 + 9)
p_the_given_non_spam <- (1 + 1) / (9 + 9)
p_money_given_non_spam <- (0 + 1) / (9 + 9)
p_non_spam_given_message <- (p_non_spam * p_secret_given_non_spam *
                            p_the_given_non_spam * p_money_given_non_spam)

classification <- 'spam'