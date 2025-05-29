-- Q20: For each instructor, list their name and the 
-- average booking rate (percentage) for the classes they teach.

SELECT i.FirstName, i.LastName,
ROUND(AVG(IFNULL(b.BookingCount / c.MaxCapacity, 0) * 100), 2) AS AvgBookingRate
FROM instructors i
JOIN classes c ON i.InstructorID = c.InstructorID
LEFT JOIN (SELECT ClassID, COUNT(*) AS BookingCount
FROM bookings
GROUP BY ClassID) b ON c.ClassID = b.ClassID
GROUP BY i.InstructorID;