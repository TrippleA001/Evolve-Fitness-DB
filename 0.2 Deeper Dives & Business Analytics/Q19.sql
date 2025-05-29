-- Which classes are the most popular based on the total number of bookings received for each class name (not specific offering)? 
-- Show ClassName and TotalBookings.
SELECT c.ClassName, COUNT(b.BookingID) AS TotalBookings
FROM Bookings b
JOIN Classes c ON c.classID = b.classID
JOIN Instructors co ON c.instructorID = co.instructorID
GROUP BY c.ClassName
ORDER BY TotalBookings DESC;
