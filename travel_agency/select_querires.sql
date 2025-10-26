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
ROW_NUMBER() OVER (PARTITION BY destinations.destination_name ORDER BY bookings.budget/SUM(itineraries.day_number)DESC) AS rnk
FROM destinations
JOIN bookings ON (destinations.destination_id = bookings.destination_id)
JOIN itineraries ON (bookings.booking_id = itineraries.booking_id)
GROUP BY destinations.destination_id, bookings.budget, bookings.booking_id) AS rnk
WHERE rnk = 1
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
