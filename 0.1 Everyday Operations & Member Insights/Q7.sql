
SELECT COUNT(*) AS NumberOfClasses
FROM classes c
JOIN instructors i ON c.InstructorID = i.InstructorID
WHERE i.FirstName = 'Jane' AND i.LastName = 'Doe';