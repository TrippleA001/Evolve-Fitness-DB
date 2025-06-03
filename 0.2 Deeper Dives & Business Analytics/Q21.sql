
 -- List all instructors who are currently scheduled to teach more than 1
-- class on the same day. Show the instructor's full name and the count of
-- classes they teach on such days.

SELECT 
    CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName,
    c.ClassDate,
    COUNT(*) AS ClassCount
FROM 
    classes c
JOIN 
    instructors i ON c.InstructorID = i.InstructorID
GROUP BY 
    i.FirstName, i.LastName, c.ClassDate
HAVING 
    COUNT(*) > 1;