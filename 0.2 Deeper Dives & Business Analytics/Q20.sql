-- Q20 for each instructor, list their name and average booking rate for the classes they teach.
-- (i.e. bookings / capacity)
SELECT
    CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName,
    ROUND(AVG(c.CurrentBookings / c.MaxCapacity) * 100, 1) AS AvgBookingRate
FROM Classes c
JOIN Instructors i ON c.InstructorID = i.InstructorID
GROUP BY i.InstructorID, i.FirstName, i.LastName;