# Question 1
q1_result <- film_dt[rating == "PG" & rental_duration > 5, 
                     .(film_id, title, rating, rental_duration)]
print("Question 1: Films with PG rating and rental duration > 5")
print(q1_result)