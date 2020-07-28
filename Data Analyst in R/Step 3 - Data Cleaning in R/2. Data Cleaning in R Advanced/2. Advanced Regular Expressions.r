## 1. Introduction ##

library(stringr)
library(readr)

hn  <-  read_csv("hacker_news.csv")
titles  <-  hn$title
sql_pattern  <-  "(?i)SQL"
sql_counts  <-  sum(str_detect(titles, sql_pattern))

## 2. Capture Groups ##

library(dplyr)
library(stringr)
pattern  <-  "(?i)(python [\\d])"
python_flavors  <-  str_match(titles, pattern)[,2]
python_titles_freq  <-  table(str_to_lower(python_flavors))

## 3. Using Capture Groups to Extract Data ##

python_titles <- titles[str_detect(titles,"[Pp]ython [\\d\\.]+")]
pattern <- "[Pp]ython ([\\d\\.]+)"
python_versions <- str_match(python_titles, pattern)[,2]
python_versions_freq <- table(python_versions)

## 4. Counting Mentions of the "C" Language ##

first_10_matches <- function (data, pattern) {
    matches <- str_detect(data, pattern) # finding pattern matches
    matched_df <- data[matches] # subsetting data (keep only matches)
    head(matched_df, 10) # taking the first ten matched elements
}

# pattern  <-  "\\b[Cc]\\b"
pattern  <-  "\\b[Cc]\\b[^.+]"
first_ten  <-  first_10_matches(titles, pattern)

## 5. Using Lookarounds to Control Matches Based on Surrounding Text ##

pattern  <-  "(?<!Series\\s)\\b[Cc]\\b(?![\\+\\.])"
c_mentions  <-  sum(str_detect(titles, pattern))

## 6. BackReferences: Using Capture Groups in a RegEx Pattern ##

pattern  <-  "\\b(\\w+)\\s\\1\\b"

repeated_words  <-  titles[str_detect(titles, pattern)]

## 7. Challenge: Cleaning our dataset ##

library(dplyr)
library(stringr)
pattern  <-  "(?i)(\\w+SQL)"
hn_sql <-  hn %>% 
    filter(str_detect(title, pattern)) %>%
    mutate(flavor = str_match(title, pattern)[,2]) %>%
    mutate(flavor = str_to_lower(flavor))

hn_sql_flavor_avg <- hn_sql %>%
    select(flavor, num_comments) %>%
    group_by(flavor) %>%
    summarise(avg = mean(num_comments))

## 8. Substituting Regular Expression Matches ##

email_variations  <-  c('email', 'Email', 'e Mail',
                        'e mail', 'E-mail', 'e-mail',
                        'eMail', 'E-Mail', 'EMAIL')
pattern  <-  "(?i)e[\\-\\s]?mail"
email_uniform  <-  str_replace(email_variations, pattern, "email")
titles_clean  <-  str_replace(titles, pattern, "email")

## 9. Extracting Domains from URLs ##

test_urls  <-  c(
 'https://www.amazon.com/Technology-Ventures-Enterprise-Thomas-Byers/dp/0073523429',
 'http://www.interactivedynamicvideo.com/',
 'http://www.nytimes.com/2007/11/07/movies/07stein.html?_r=0',
 'http://evonomics.com/advertising-cannot-maintain-internet-heres-solution/',
 'HTTPS://github.com/keppel/pinn',
 'Http://phys.org/news/2015-09-scale-solar-youve.html',
 'https://iot.seeed.cc',
 'http://www.bfilipek.com/2016/04/custom-deleters-for-c-smart-pointers.html',
 'http://beta.crowdfireapp.com/?beta=agnipath',
 'https://www.valid.ly'
)
pattern  <-  "(?i)https?://([\\w\\.]+)"

test_urls_clean  <-  str_match(test_urls, pattern)[,2]
domains  <- str_match(hn$url, pattern)[,2]
top_domains  <-  head(table(domains),20)

## 10. Extracting URL Parts Using Multiple Capture Groups ##

# `test_urls` is available from the previous screen
pattern  <-  "(.+)://([\\w\\.]+)/?(.*)"

test_url_parts  <-  str_match(test_urls, pattern)

hn_urls  <-  hn %>%
    mutate(protocol = str_match(url, pattern)[,2]) %>%
    mutate(domain = str_match(url, pattern)[,3]) %>%
    mutate(page_path = str_match(url, pattern)[,4])