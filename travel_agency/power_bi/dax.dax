date = CALENDAR("01.01.1950", "01.01.2100")
  
start of month = STARTOFMONTH('date'[date])

bookings = COUNT('travel bookings'[booking_id])

previous year bookings = CALCULATE([bookings], DATEADD('date'[date], -1, YEAR))

age = DATEDIFF('travel customers'[birth date], TODAY(), YEAR)

avg revenue per day 0 and 1 = 
IF([revenue per day]>(AVERAGE('travel bookings'[budget])/AVERAGE('travel itineraries'[day_number])), 0, 
AVERAGE('travel bookings'[budget])/AVERAGE('travel itineraries'[day_number]))

years needed = 
IF([revenue per day]>='travel bookings'[avg revenue per day 0 and 1], 0, 
CEILING(LOG('travel bookings'[avg revenue per day 0 and 1]/[revenue per day], 1.1),1))
