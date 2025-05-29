-- Q10: List all instructors. If an instructor's phone number (Phone) is missing (NULL) 
-- in the Instructors table, display 'Not Provided' instead. 
-- Show the instructor's FirstName, LastName, Email, and the modified Phone.
SELECT 
    FirstName,
    LastName,
    Email,
    COALESCE(Phone, 'Not Provided') AS Phone
FROM instructors;

# All work welldone by teammembers
