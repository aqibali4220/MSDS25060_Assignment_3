library(data.table)
library(DBI)
library(RMySQL)  


con <- dbConnect(
  MySQL(),
  host = "localhost",
  user = "aqibali",
  password = "11223344",
  dbname = "sakila"
)

# Load tables as data.tables
film_dt <- as.data.table(dbReadTable(con, "film"))
rental_dt <- as.data.table(dbReadTable(con, "rental"))
inventory_dt <- as.data.table(dbReadTable(con, "inventory"))
customer_dt <- as.data.table(dbReadTable(con, "customer"))
store_dt <- as.data.table(dbReadTable(con, "store"))
payment_dt <- as.data.table(dbReadTable(con, "payment"))
staff_dt <- as.data.table(dbReadTable(con, "staff"))
language_dt <- as.data.table(dbReadTable(con, "language"))

# Close connection
dbDisconnect(con)