-- Q9: How many classes is Instructor 'Jane Doe' scheduled to teach ?
SELECT COUNT(*) AS ClassCount
FROM classes c
JOIN instructors i ON i.InstructorID = c.InstructorID
WHERE i.FirstName = 'Jane' AND i.LastName = 'Doe';
