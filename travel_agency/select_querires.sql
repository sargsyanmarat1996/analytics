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

