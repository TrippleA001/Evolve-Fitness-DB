-- Q9: How many classes is Instructor 'Jane Doe' scheduled to teach ?
SELECT 
    COUNT(*) AS TotalClasses
FROM classes c
JOIN instructors i ON c.InstructorID = i.InstructorID
WHERE i.FirstName = 'Jane' AND i.LastName = 'Doe';