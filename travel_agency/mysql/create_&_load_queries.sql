--Сreate a schema for dataset--
CREATE SCHEMA travel
  
--Create a table in schema--
CREATE TABLE travel.categories(
category_id TINYINT,
category_name VARCHAR (10),
PRIMARY KEY (category_id));

CREATE TABLE travel.customers(
customer_id TINYINT,
fullname VARCHAR (30),
email NVARCHAR (255),
phone VARCHAR (14),
travel_preference VARCHAR (20),
PRIMARY KEY (customer_id));

CREATE TABLE travel.destinations(
destination_id TINYINT,
destination_name VARCHAR (20),
country VARCHAR (30),
description TEXT,
PRIMARY KEY (destination_id));

CREATE TABLE travel.bookings(
booking_id TINYINT,
customer_id TINYINT,
destination_id TINYINT,
booking_date DATE,
travel_date DATE,
budget SMALLINT,
PRIMARY KEY (booking_id),
FOREIGN KEY (customer_id) REFERENCES travel.customers (customer_id),
FOREIGN KEY (destination_id) REFERENCES travel.destinations (destination_id));

CREATE TABLE travel.itineraries(
itinerary_id INT,
booking_id TINYINT,
day_number TINYINT,
activity VARCHAR (100),
FOREIGN KEY (booking_id) REFERENCES travel.bookings (booking_id));

CREATE TABLE travel.reviews(
review_id TINYINT, 
booking_id TINYINT,
rating TINYINT,
comment TEXT,
review_date DATE,
FOREIGN KEY (booking_id) REFERENCES travel.bookings (booking_id));

CREATE TABLE travel.destination_category(
destination_id TINYINT,
category_id TINYINT,
FOREIGN KEY (category_id) REFERENCES travel.categories (category_id),
FOREIGN KEY (destination_id) REFERENCES travel.destinations (destination_id));

--Load data into table--
LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/travel_agency/categories.csv'
INTO TABLE travel.categories
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/travel_agency/customers.csv'
INTO TABLE travel.customers
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/travel_agency/destinations.csv'
INTO TABLE travel.destinations
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/travel_agency/bookings.csv'
INTO TABLE travel.bookings
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/travel_agency/itineraries.csv'
INTO TABLE travel.itineraries
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/travel_agency/destination_category.csv'
INTO TABLE travel.destination_category
COLUMNS TERMINATED BY ','
IGNORE 1 LINES;

LOAD DATA
INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/travel_agency/reviews.csv'
INTO TABLE travel.reviews
COLUMNS TERMINATED BY ','
IGNORE 1 LINES
