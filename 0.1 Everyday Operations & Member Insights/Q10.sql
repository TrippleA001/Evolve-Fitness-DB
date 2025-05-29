-- question 10

SELECT 
    FirstName, 
    LastName, 
    Email, 
    COALESCE(Phone, 'Not Provided') AS Phone
FROM 
    Instructors;