--Set difference between booking_date and travel_date within range 1 and 150 days--
UPDATE bookings
SET bookings.travel_date = DATE_ADD(bookings.booking_date, INTERVAL FLOOR(1 + RAND()*(100-1)) DAY)
WHERE DATEDIFF(bookings.booking_date, bookings.travel_date) > 190 
OR DATEDIFF(bookings.booking_date, bookings.travel_date) < - 190


--Add sex for clietns--
