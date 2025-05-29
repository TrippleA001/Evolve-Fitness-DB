CREATE DATABASE Evolve_Fitness;
USE Evolve_Fitness;

SELECT DISTINCT ClassName,
CONCAT(ROUND((CurrentBookings / MaxCapacity) * 100, 2), '%') AS Booking_Percentage
FROM classes;
;
SELECT * FROM classes;  
SELECT ClassName, ClassDate, ClassTime, MaxCapacity, 
CONCAT(ROUND((CurrentBookings / MaxCapacity) * 100, 2), '%') AS Booking_Percentage
FROM classes;