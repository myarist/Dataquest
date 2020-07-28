## 3. Connecting to the Database ##

library(RSQLite)
library(DBI)
conn <- dbConnect(SQLite(), "jobs.db")
tables <- dbListTables(conn)

## 4. Running queries with our connection ##

conn <- dbConnect(SQLite(), "jobs.db")
query <- "SELECT Major FROM recent_grads"
majors <- dbGetQuery(conn, query)

## 5. Fetching a subset of results with dbFetch() ##

conn <- dbConnect(SQLite(), "jobs.db")
query <- "SELECT Major, Major_category FROM recent_grads"
result <- dbSendQuery(conn, query)
five_results <- dbFetch(result, n = 5)

## 6. Cleaning up after ourselves ##

conn <- dbConnect(SQLite(), "jobs.db")
query <- "SELECT Major FROM recent_grads ORDER BY Major DESC"
result <- dbSendQuery(conn, query)
reverse_alphabetical <- dbFetch(result)

dbClearResult(result)
dbDisconnect(conn)