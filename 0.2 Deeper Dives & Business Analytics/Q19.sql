-- Q19: Which classes are the most popular based on the total number of bookings 
-- received for each class name (not specific offering)? Show ClassName and TotalBookings

SELECT c.ClassName,
COUNT(b.BookingID) AS TotalBookings
FROM classes c
LEFT JOIN bookings b ON c.ClassID = b.ClassID
GROUP BY c.ClassName
ORDER BY TotalBookings DESC;