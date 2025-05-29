-- Q8: Display all scheduled classes (show ClassName, ClassDate, ClassTime, and Instructor's full name) occurring on 
-- June 1, 2025.
SELECT c.ClassName, c.ClassDate, c.ClassTime, 
       CONCAT(i.FirstName, ' ', i.LastName) AS InstructorFullName
FROM classes c
JOIN Instructors i ON c.InstructorID = i.InstructorID
WHERE c.ClassDate = '2025-06-01';-- Q10: List all instructors. If an instructor's phone number (Phone) is missing (NULL) in the Instructors table, 
-- display 'Not Provided' instead. Show the instructor's FirstName, LastName, Email, and the modified Phone.
SELECT FirstName, LastName, Email, 
       COALESCE(Phone, 'Not Provided') AS Phone
FROM Instructors;