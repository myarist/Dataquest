## 1. Introduction ##

import pandas as pd
import re

hn = pd.read_csv("hacker_news.csv")
titles = hn['title']
sql_pattern = r"SQL"
sql_counts = titles.str.contains(sql_pattern, flags=re.I).sum()

## 2. Capture Groups ##

hn_sql = hn[hn['title'].str.contains(r"\w+SQL", flags=re.I)].copy()
hn_sql["flavor"] = hn_sql["title"].str.extract(r"(\w+SQL)", re.I)
hn_sql["flavor"] = hn_sql["flavor"].str.lower()
sql_pivot = hn_sql.pivot_table(index="flavor",values="num_comments", aggfunc='mean')

## 3. Using Capture Groups to Extract Data ##

pattern = r"[Pp]ython ([\d\.]+)"

py_versions = titles.str.extract(pattern)
py_versions_freq = dict(py_versions.value_counts())

## 4. Counting Mentions of the 'C' Language ##

def first_10_matches(pattern):
    """
    Return the first 10 story titles that match
    the provided regular expression
    """
    all_matches = titles[titles.str.contains(pattern)]
    first_10 = all_matches.head(10)
    return first_10

# pattern = r"\b[Cc]\b"
pattern = r"\b[Cc]\b[^.+]"
first_ten = first_10_matches(pattern)

## 5. Using Lookarounds to Control Matches Based on Surrounding Text ##

pattern = r"(?<!Series\s)\b[Cc]\b(?![\+\.])"
c_mentions = titles.str.contains(pattern).sum()

## 6. BackReferences: Using Capture Groups in a RegEx Pattern ##

pattern = r"\b(\w+)\s\1\b"

repeated_words = titles[titles.str.contains(pattern)]

## 7. Substituting Regular Expression Matches ##

email_variations = pd.Series(['email', 'Email', 'e Mail',
                        'e mail', 'E-mail', 'e-mail',
                        'eMail', 'E-Mail', 'EMAIL'])
pattern = r"\be[-\s]?mail"
email_uniform = email_variations.str.replace(pattern, "email", flags=re.I)
titles_clean = titles.str.replace(pattern, "email", flags=re.I)

## 8. Extracting Domains from URLs ##

test_urls = pd.Series([
 'https://www.amazon.com/Technology-Ventures-Enterprise-Thomas-Byers/dp/0073523429',
 'http://www.interactivedynamicvideo.com/',
 'http://www.nytimes.com/2007/11/07/movies/07stein.html?_r=0',
 'http://evonomics.com/advertising-cannot-maintain-internet-heres-solution/',
 'HTTPS://github.com/keppel/pinn',
 'Http://phys.org/news/2015-09-scale-solar-youve.html',
 'https://iot.seeed.cc',
 'http://www.bfilipek.com/2016/04/custom-deleters-for-c-smart-pointers.html',
 'http://beta.crowdfireapp.com/?beta=agnipath',
 'https://www.valid.ly?param',
 'http://css-cursor.techstream.org'
])
pattern = r"https?://([\w\-\.]+)"

test_urls_clean = test_urls.str.extract(pattern, flags=re.I)
domains = hn['url'].str.extract(pattern, flags=re.I)
top_domains = domains.value_counts().head(5)

## 9. Extracting URL Parts Using Multiple Capture Groups ##

# `test_urls` is available from the previous screen
pattern = r"(https?)://([\w\.\-]+)/?(.*)"

test_url_parts = test_urls.str.extract(pattern, flags=re.I)
url_parts = hn['url'].str.extract(pattern, flags=re.I)

## 10. Using Named Capture Groups to Extract Data ##

# pattern = r"(https?)://([\w\.\-]+)/?(.*)"
pattern = r"(?P<protocol>https?)://(?P<domain>[\w\.\-]+)/?(?P<path>.*)"
url_parts = hn['url'].str.extract(pattern, flags=re.I)