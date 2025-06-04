-- Q21 List all instructors scheduled to teach more than 1 class on the same day.
-- Show instructor’s full name and count of such classes.
SELECT 
    CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName,
    c.ClassDate,
    COUNT(*) AS ClassesOnSameDay
FROM Classes c
JOIN Instructors i ON c.InstructorID = i.InstructorID
GROUP BY i.InstructorID, c.ClassDate, i.FirstName, i.LastName
HAVING COUNT(*) > 1;