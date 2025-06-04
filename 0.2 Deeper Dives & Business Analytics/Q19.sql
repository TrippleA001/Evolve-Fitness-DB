-- Q19: Which classes are the most popular based on the total number of bookings received for each class name?
SELECT c.ClassName, COUNT(*) AS TotalBookings
FROM Classes c
JOIN Bookings b ON c.ClassID = b.ClassID
GROUP BY c.ClassName
ORDER BY TotalBookings DESC;
