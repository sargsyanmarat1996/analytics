--Set difference between booking_date and travel_date within the range 1 and 150 days--
UPDATE bookings
SET bookings.travel_date = DATE_ADD(bookings.booking_date, INTERVAL FLOOR(1 + RAND()*(100-1)) DAY)
WHERE DATEDIFF(bookings.booking_date, bookings.travel_date) > 190 
OR DATEDIFF(bookings.booking_date, bookings.travel_date) < - 190


--Add sex for clietns--
UPDATE customers SET sex = 'M';

UPDATE customers SET sex = 'F'
WHERE customers.fullname LIKE 'S%'
OR customers.fullname LIKE 'E%'
OR customers.fullname LIKE 'V%'
OR customers.fullname = 'Amber West'
OR customers.fullname = 'Brenda Ramos'
OR customers.fullname = 'Cynthia Mills MD'
OR customers.fullname = 'Diane Schultz'
OR customers.fullname = 'Elizabeth Woods'
OR customers.fullname = 'Diane Schultz'
OR customers.fullname = 'Katrina Perry'
OR customers.fullname = 'Nicole Thomas'
OR customers.fullname = 'Teresa Barnett'
OR customers.fullname = 'Tracy Sandoval'
OR customers.fullname = 'Teresa Barnett'
OR customers.fullname = 'Teresa Barnett'
