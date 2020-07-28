## 2. Date Representation ##

library(lubridate)
date1 <- "01011970" # should be January 1, 1970
date2 <- "2019-03-04" # should be March 4, 2019
date_standardized1 <- mdy(date1)
date_standardized2 <- ymd(date2)

## 3. Time Representation ##

library(lubridate)
datetime1 <- "01-01-1970-00-00-00" # should be January 1, 1970 at midnight
datetime2 <- "2019-03-14 1:59 AM" # should be March 14, 2019, 1:59 AM
datetime_standardized1 <- mdy_hms(datetime1)
datetime_standardized2 <- ymd_hm(datetime2)

## 5. Component Extraction ##

library(lubridate)
input_date <- "2020-11-13 13:13:13"
answer_month <- month(input_date)
answer_day_of_week <- wday(input_date, label = TRUE)

## 6. Time Span Calculations ##

library(lubridate)
now <- Sys.time() %>% as_datetime
days_since_founding <- now - ymd_hms("2015-03-01 00:00:00")

## 7. Durations and Periods ##

library(lubridate)

start <- ymd("2020/05/01")
duration_end <- start + duration(day = 5, hour = 12)
period_end <- start + period(month = 1, day = 1)