<<<<<<< HEAD
SELECT 
    ClassName,
    SUM(CurrentBookings) AS TotalBookings
FROM 
    ScheduledClasses
GROUP BY 
    ClassName
ORDER BY 
    TotalBookings DESC;
=======
 SELECT distinct
 c.ClassName,
 sum(bookingID) as TotalBookings
 from classes as c
 join bookings as b on c.ClassID = b.ClassID
 GROUP BY ClassName;
>>>>>>> 3041424cabc4d7b0036c3443704e477f8260a90b
