-- Q18: Calculate the current booking percentage for each scheduled class instance (how full is it?). 
-- Show ClassName, ClassDate, ClassTime, MaxCapacity, 
-- CurrentBookings (assuming you have this column updated by triggers or in your ScheduledClasses table), 
-- and the calculated booking percentage ((CurrentBookings / MaxCapacity) * 100). 
-- Format the percentage nicely if you can!

SELECT c.ClassID, c.ClassName, c.ClassDate, c.ClassTime, c.MaxCapacity,
COUNT(b.BookingID) AS CurrentBookings,
ROUND((COUNT(b.BookingID) / c.MaxCapacity) * 100, 2) AS BookingPercentage
FROM classes c
LEFT JOIN bookings b ON c.ClassID = b.ClassID
GROUP BY c.ClassID;
