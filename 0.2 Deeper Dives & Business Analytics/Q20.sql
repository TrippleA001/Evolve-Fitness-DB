-- Q20: For each instructor, list their name and the average booking rate (percentage) for the classes they teach.
SELECT
    CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName,
    AVG((c.CurrentBookings / c.MaxCapacity) * 100) AS AverageBookingPercentage
FROM Instructors i
JOIN Classes c ON i.InstructorID = c.InstructorID
GROUP BY InstructorFullName;
