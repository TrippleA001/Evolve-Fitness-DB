-- Q5: Find all members whose FirstName starts with 'S' OR whose LastName contains the letters 'on'. 
-- Display their FirstName, LastName, and Email.
SELECT 
    FirstName,
    LastName,
    Email
FROM members
WHERE FirstName LIKE 'S%' OR LastName LIKE '%on%';
