# Q16: List all instructors who are currently scheduled to teach more than 1 
#class on the same day. Show the instructor's full name and the count of 
#classes they teach on such days.
SELECT 
    i.InstructorID, 
    CONCAT(i.FirstName, ' ', i.LastName) AS FullName,
    c.ClassDate,
    COUNT(*) AS ClassCount
FROM 
    Classes c
JOIN 
    Instructors i ON c.InstructorID = i.InstructorID
GROUP BY 
    i.InstructorID, i.FirstName, i.LastName, c.ClassDate
ORDER BY 
    ClassCount DESC;

