-- Q10: List all instructors. If an instructor's phone number (Phone) is missing (NULL) in the Instructors table, display 'Not Provided' instead. Show the instructor's FirstName, LastName, Email, and the modified Phone.
SELECT * FROM Instructors;

SELECT * FROM Instructors
WHERE Phone = NULL;

SELECT FirstName, LastName, Email, Phone
FROM instructors;
