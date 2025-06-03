<<<<<<< HEAD
-- Q20: For each instructor, list their name and the average booking rate (percentage) for the classes they teach.
SELECT
    CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName,
    AVG((c.CurrentBookings / c.MaxCapacity) * 100) AS AverageBookingPercentage
FROM Instructors i
JOIN Classes c ON i.InstructorID = c.InstructorID
GROUP BY InstructorFullName;
=======
-- Q20 for each instructor, list their name and average booking rate for the classes they teach.
-- (i.e. bookings / capacity)
SELECT
    CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName,
    ROUND(AVG(c.CurrentBookings / c.MaxCapacity) * 100, 1) AS AvgBookingRate
FROM Classes c
JOIN Instructors i ON c.InstructorID = i.InstructorID
GROUP BY i.InstructorID, i.FirstName, i.LastName;
>>>>>>> f2750c1b4542d02984063721846aa0315d2e6809
