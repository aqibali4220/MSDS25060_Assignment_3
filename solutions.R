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

# Question 4
q4_result <- customer_dt[, .(customer_id, 
                             customer_name = paste(first_name, last_name),
                             store_id)]
print("Question 4: Customers and their stores")
print(q4_result)

# Question 5
payment_staff <- merge(payment_dt, staff_dt, 
                       by.x = "staff_id", 
                       by.y = "staff_id")

q5_result <- payment_staff[, .(payment_id, 
                               amount, 
                               payment_date,
                               staff_name = paste(first_name, last_name))]
print("Question 5: Payment details with staff")
print(head(q5_result, 20)) 

# Question 6

rented_films <- unique(merge(rental_dt, inventory_dt, 
                             by = "inventory_id")$film_id)


q6_result <- film_dt[!film_id %in% rented_films, 
                     .(film_id, title)]
print("Question 6: Films not rented")
print(q6_result)

# Question 7: Plot average rental rate by rating
library(ggplot2)

plot_data <- film_dt[, .(avg_rental_rate = mean(rental_rate),
                         film_count = .N), 
                     by = rating]

ggplot(plot_data, aes(x = rating, y = avg_rental_rate, fill = rating)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = round(avg_rental_rate, 2)), 
            vjust = -0.5, size = 3.5) +
  labs(title = "Average Rental Rate by Film Rating",
       x = "Rating",
       y = "Average Rental Rate ($)",
       caption = "Sakila Database Analysis") +
  theme_minimal() +
  theme(legend.position = "none")

# Save the plot
ggsave("rental_rate_by_rating.png", width = 10, height = 6)









