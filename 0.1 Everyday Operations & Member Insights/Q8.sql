-- Q8 Display all scheduled classes (show ClassName, ClassDate, ClassTime, and Instructor's full name) occurring on June 1, 2025.
SELECT ClassName, ClassDate, ClassTime, CONCAT(FirstName, " ", LastName) AS FullName
FROM classes
JOIN Instructors
ON classes.InstructorID = Instructors.InstructorID
WHERE ClassDate = "6/1/2025";
