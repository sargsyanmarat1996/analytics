--Top 5 customers by bookings--
SELECT COUNT(bookings.customer_id) AS bookings_ammount, customers.fullname
FROM bookings
JOIN customers ON (bookings.customer_id=customers.customer_id)
GROUP BY bookings.customer_id
ORDER BY bookings_ammount DESC, fullname ASC
LIMIT 5

# bookings_ammount, fullname
'5', 'John Hicks'
'5', 'Ryan Roberts'
'4', 'Diane Schultz'
'4', 'Mark Thomas'
'4', 'Nathan Donovan'

--Top 5 customers by spent budget--
SELECT SUM(bookings.budget) AS bookings_budget, customers.fullname
FROM bookings
JOIN customers ON (bookings.customer_id=customers.customer_id)
GROUP BY bookings.customer_id
ORDER BY bookings_budget DESC
LIMIT 5

# bookings_budget, fullname
'17025', 'Wayne Davidson'
'15373', 'Ryan Roberts'
'14113', 'Mark Thomas'
'13760', 'Diane Schultz'
'11278', 'Charles Rodriguez'

--Top 1 travel category--
SELECT categories.category_id, COUNT(bookings.destination_id) AS booking_ammount, categories.category_name
FROM bookings
JOIN destination_category ON (bookings.destination_id = destination_category.destination_id)
JOIN categories ON (destination_category.category_id = categories.category_id)
GROUP BY categories.category_id
ORDER BY booking_ammount DESC
LIMIT 1

# category_id, booking_ammount, category_name
'2', '42', 'Mountain'

--Top 1 country visited during COVID-19--
SELECT COUNT(bookings.destination_id) AS bookings_ammount, destinations.country 
FROM bookings
JOIN destinations ON (bookings.destination_id = destinations.destination_id)
WHERE bookings.travel_date BETWEEN '2019-01-01' AND '2023-01-01'
GROUP BY bookings.destination_id
ORDER BY destination_ammount DESC
LIMIT 1

# bookings_ammount, country
'3', 'Egypt'

--Highest price spent per day for each destination--
SELECT destination_name, average_day_price, booking_id
FROM
(SELECT destinations.destination_name, bookings.budget/SUM(itineraries.day_number) AS average_day_price, bookings.booking_id,
ROW_NUMBER() OVER (PARTITION BY destinations.destination_name ORDER BY bookings.budget/SUM(itineraries.day_number)DESC) AS budget_rank
FROM destinations
JOIN bookings ON (destinations.destination_id = bookings.destination_id)
JOIN itineraries ON (bookings.booking_id = itineraries.booking_id)
GROUP BY destinations.destination_id, bookings.budget, bookings.booking_id) AS table_a
WHERE budget_rank = 1
ORDER BY average_day_price DESC

# destination_name, average_day_price, booking_id
'Andersontown', '4476.0000', '90'
'Kimberlystad', '4027.0000', '93'
'East Carlshire', '3748.0000', '45'
'Hollandmouth', '3366.0000', '55'
'West Brett', '3283.0000', '97'
'Port Eddie', '2910.0000', '21'
'West April', '2868.0000', '99'
'West Rickymouth', '2586.0000', '79'
'Joshuaburgh', '2306.0000', '4'
'East Margaret', '2022.0000', '89'
'Williamsberg', '1849.0000', '96'
'Lake Lisatown', '913.8000', '20'
'Bryanhaven', '739.3333', '16'
'South Nicole', '691.4000', '12'
'South Dana', '503.3333', '5'
'Braunborough', '493.6667', '3'
'Port Michelle', '412.8333', '56'
'Port Erika', '375.2500', '42'
'Jacksonton', '241.1429', '60'

--Top 3 places by rating--
SELECT avg_rate, booking_id, destination_name
FROM
(SELECT AVG(reviews.rating) AS avg_rate, bookings.booking_id, destinations.destination_name,
ROW_NUMBER () OVER(PARTITION BY destinations.destination_name ORDER BY AVG(reviews.rating)DESC) AS rate_rank
FROM reviews
JOIN bookings ON (reviews.booking_id = bookings.booking_id)
JOIN destinations ON (bookings.destination_id = destinations.destination_id)
GROUP BY bookings.booking_id, destinations.destination_name) table_b
WHERE rate_rank = 1
ORDER BY avg_rate DESC

# avg_rate, booking_id, destination_name
'5.0000', '26', 'Andersontown'
'5.0000', '3', 'Braunborough'
'5.0000', '35', 'East Carlshire'
'5.0000', '95', 'East Margaret'
'5.0000', '73', 'Hollandmouth'
'5.0000', '31', 'Joshuaburgh'
'5.0000', '71', 'Port Eddie'
'5.0000', '22', 'Port Natashastad'
'5.0000', '51', 'South Nicole'
'5.0000', '25', 'West April'
'5.0000', '8', 'West Brett'
'5.0000', '67', 'Williamsberg'
'4.0000', '19', 'Bryanhaven'
'4.0000', '86', 'Kimberlystad'
'3.3333', '46', 'Jacksonton'
'3.0000', '33', 'South Dana'
'2.7500', '2', 'Port Erika'
'2.0000', '49', 'Lake Lisatown'
'1.0000', '56', 'Port Michelle'

--Average window booking





