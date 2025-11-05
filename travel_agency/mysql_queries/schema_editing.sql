--Set difference between booking_date and travel_date within the range 1 and 100 days--
UPDATE bookings
SET bookings.travel_date = DATE_ADD(bookings.booking_date, INTERVAL FLOOR(1 + RAND()*(100-1)) DAY)
WHERE DATEDIFF(bookings.booking_date, bookings.travel_date) > 1 
OR DATEDIFF(bookings.booking_date, bookings.travel_date) < - 1

UPDATE bookings
SET bookings.booking_date = DATE_ADD(bookings.travel_date, INTERVAL FLOOR(1 + RAND()*(100-1)) DAY)
WHERE DATEDIFF(bookings.booking_date, bookings.travel_date) > 1
OR DATEDIFF(bookings.booking_date, bookings.travel_date) < - 1  

  
--Add sex for clietns--

ALTER TABLE customers ADD sex CHAR(1). 
  
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


--Set difference between dividing budget on day mumber — 100 and 500--

UPDATE bookings
JOIN itineraries ON(bookings.booking_id = itineraries.booking_id)
SET bookings.budget = FLOOR(100 + RAND()*(500-1))
WHERE itineraries.day_number = 1;

UPDATE bookings
JOIN itineraries ON(bookings.booking_id = itineraries.booking_id)
SET bookings.budget = FLOOR(200 + RAND()*(1000-1))
WHERE itineraries.day_number = 2;

UPDATE bookings
JOIN itineraries ON(bookings.booking_id = itineraries.booking_id)
SET bookings.budget = FLOOR(300 + RAND()*(1500-1))
WHERE itineraries.day_number = 3;

UPDATE bookings
JOIN itineraries ON(bookings.booking_id = itineraries.booking_id)
SET bookings.budget = FLOOR(400 + RAND()*(2000-1))
WHERE itineraries.day_number = 4;

UPDATE bookings
JOIN itineraries ON(bookings.booking_id = itineraries.booking_id)
SET bookings.budget = FLOOR(500 + RAND()*(2500-1))
WHERE itineraries.day_number = 5
