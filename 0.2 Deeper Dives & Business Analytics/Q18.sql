 SELECT 
	 ClassName,
	 ClassDate,
	 ClassTime,
	 MaxCapacity,
	 CurrentBookings,
ROUND((CurrentBookings / MaxCapacity) * 100) AS booking_percentage
FROM Classes;