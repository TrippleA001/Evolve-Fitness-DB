-- For each instructor, list their name and the average booking rate
-- (percentage) for the classes they teach

SELECT 
    CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName,
    ROUND(AVG((c.CurrentBookings / c.MaxCapacity) * 100), 2) AS AvgBookingRatePercentage
FROM 
    classes c
JOIN 
    instructors i ON c.InstructorID = i.InstructorID
WHERE 
    c.MaxCapacity 
GROUP BY 
    i.FirstName, i.LastName;