-- Q8: Display all scheduled classes (show ClassName, ClassDate, ClassTime, 
-- and Instructor's full name) occurring on June 1, 2025.
SELECT
    c.ClassName,
    c.ClassDate,
    c.ClassTime,
    CONCAT(i.FirstName, ' ', i.LastName) AS FullName
FROM classes c
JOIN instructors i ON c.InstructorID = i.InstructorID
WHERE c.ClassDate = '2025-06-01';