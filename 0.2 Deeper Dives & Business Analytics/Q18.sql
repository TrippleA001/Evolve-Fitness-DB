<<<<<<< HEAD
SELECT
  ClassName,
  ClassDate,
  ClassTime,
  MaxCapacity,
  CurrentBookings,
  ROUND((CurrentBookings * 100.0) / MaxCapacity, 2) AS BookingPercentage
FROM
  ScheduledClasses;
  
  CREATE TABLE ScheduledClasses (
  ClassID INT PRIMARY KEY,
  ClassName VARCHAR(100),
  ClassDate DATE,
  ClassTime TIME,
  MaxCapacity INT,
  CurrentBookings INT
);
=======
 SELECT 
	 ClassName,
	 ClassDate,
	 ClassTime,
	 MaxCapacity,
	 CurrentBookings,
ROUND((CurrentBookings / MaxCapacity) * 100) AS booking_percentage
FROM Classes;
>>>>>>> 3041424cabc4d7b0036c3443704e477f8260a90b
