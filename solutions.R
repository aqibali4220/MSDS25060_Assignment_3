# Question 1
q1_result <- film_dt[rating == "PG" & rental_duration > 5, 
                     .(film_id, title, rating, rental_duration)]
print("Question 1: Films with PG rating and rental duration > 5")
print(q1_result)

# Question 2
q2_result <- film_dt[, .(avg_rental_rate = mean(rental_rate)), by = rating]
print("Question 2: Average rental rate by rating")
print(q2_result)

# Question 3
film_language <- merge(film_dt, language_dt, 
                       by.x = "language_id", 
                       by.y = "language_id")

q3_result <- film_language[, .(film_count = .N), by = name]
setnames(q3_result, "name", "language")
print("Question 3: Total films by language")
print(q3_result)