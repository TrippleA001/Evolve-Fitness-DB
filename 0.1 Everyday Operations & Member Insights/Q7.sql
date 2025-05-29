SELECT c.ClassName, cs.ClassDate, cs.ClassTime,
       CONCAT(i.FirstName, ' ', i.LastName) AS Instructor
FROM class_sessions cs
JOIN classes c ON cs.ClassID = c.ClassID
JOIN instructors i ON cs.InstructorID = i.InstructorID
WHERE cs.ClassDate = '2025-06-01';