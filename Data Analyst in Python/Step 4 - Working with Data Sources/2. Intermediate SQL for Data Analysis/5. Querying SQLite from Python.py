## 3. Connecting to the Database ##

import sqlite3
conn = sqlite3.connect("jobs.db")

## 6. Creating a Cursor and Running a Query ##

import sqlite3
conn = sqlite3.connect("jobs.db")
cursor = conn.cursor()

query = "select * from recent_grads;"
cursor.execute(query)
results = cursor.fetchall()
print(results[0:2])
query = "select major from recent_grads;"
majors = cursor.execute(query).fetchall()
print(majors[0:3])

## 8. Fetching a Specific Number of Results ##

import sqlite3
conn = sqlite3.connect("jobs.db")
cursor = conn.cursor()
query = "select Major,Major_category from recent_grads;"
cursor.execute(query)
five_results = cursor.fetchmany(5)

## 9. Closing the Database Connection ##

conn = sqlite3.connect("jobs.db")
conn.close()

## 10. Practice ##

conn = sqlite3.connect("jobs2.db")
query = "select Major from recent_grads order by Major desc;"
reverse_alphabetical = conn.cursor().execute(query).fetchall()
conn.close()