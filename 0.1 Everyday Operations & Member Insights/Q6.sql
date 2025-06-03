SELECT 
	c.ClassName,
    c.ClassDate,
    c.ClassTime,
    CONCAT(i.firstname, ' ', i.Lastname) AS Instructors_Fullname
FROM classes as c
INNER JOIN Instructors as i
ON c.InstructorID = i.InstructorID
WHERE c.classDate = '2025-06-01';