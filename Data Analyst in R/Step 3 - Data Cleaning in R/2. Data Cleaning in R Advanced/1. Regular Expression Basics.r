## 1. Introduction ##

library(readr)
hn  <- read_csv("hacker_news.csv")

## 2. The Regular Expression Functions in R ##

library(stringr)
titles <- hn$title
library(dplyr)
pattern <- "Amazon"
matches <- str_detect(titles, pattern)
hn_matches <- if_else(matches, "Match", "No Match")

## 3. Set of characters in Regular Expression ##

pattern <- "[Aa]mazon"
matches <- str_detect(titles, pattern)
amazon_mentions <- sum(matches)

## 4. Alternative patterns ##

pattern <- "2000|2005|2010"
matches <- str_detect(titles, pattern)
hn_matches <- if_else(matches, "Match", "No Match")
hn_group <- hn %>%
    mutate(year_group = hn_matches)

## 5. Using Regular Expressions to Select Data ##

google_titles_logical  <- str_detect(titles, "[Gg]oogle" )
google_titles  <-  titles[google_titles_logical]
hn_google <- hn %>%
    filter(google_titles_logical)

## 6. Quantifiers ##

# The `titles` variable is available from
# previous screens
email_logical  <-  str_detect(titles, "e-?mail")
email_count  <-  sum(email_logical)
email_titles  <-  titles[email_logical]

## 7. Character Classes ##

pattern  <-  "\\[\\w+\\]"
tag_logical  <-  str_detect(titles, pattern)
tag_titles  <-  titles[tag_logical]
tag_count  <-  sum(tag_logical)

## 8. Accessing the Matching Text with Capture Groups ##

tag_titles  <-  titles[str_detect(titles, "\\[\\w+\\]")]
#the previous pattern  is "\\[\\w+\\]"
pattern  <-  "\\[(\\w+)\\]"
tags_text_matches <- str_match(tag_titles, pattern)[,2]
tags_freq <- table(tags_text_matches)

## 9. Negative Character Classes ##

first_10_matches <- function (data, pattern) {
    matches <- str_detect(data, pattern) # finding pattern matches
    matched_df <- data[matches] # subsetting data (keep only matches)
    head(matched_df, 10) # taking the first ten matched elements
}
pattern  <-  "[Jj]ava[^Ss]"
java_titles  <-  titles[str_detect(titles, pattern)]

## 10. Word Boundaries ##

first_10_matches <- function (data, pattern) {
    matches <- str_detect(data, pattern) # finding pattern matches
    matched_df <- data[matches] # subsetting data (keep only matches)
    head(matched_df, 10) # taking the first ten matched elements
}
pattern  <-  "\\b[Jj]ava\\b"
java_titles  <-  titles[str_detect(titles, pattern)]

## 11. Matching at the Start and End of Strings ##

pattern_beginning  <-  "^\\[\\w+\\]"
beginning_count  <-  sum(str_detect(titles, pattern_beginning))

pattern_ending  <-  "\\[\\w+\\]$"
ending_count  <-  sum(str_detect(titles, pattern_ending))

## 12. Challenge: Using Flags to Modify Regex Patterns ##

email_tests  <-  c('email', 'Email', 'e Mail', 'e mail', 'E-mail',
                   'e-mail', 'eMail', 'E-Mail', 'EMAIL')
pattern <- "(?i)e[\\-\\s]?mail"
email_tests_matches <- str_detect(email_tests, pattern)
email_mentions <- sum(str_detect(titles, pattern))