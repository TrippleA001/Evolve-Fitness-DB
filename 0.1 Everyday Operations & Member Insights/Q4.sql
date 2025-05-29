-- Q4: Find all members who registered on or after January 1, 2025. 
-- Display their FirstName, LastName, and RegistrationDate.

SELECT 
	FirstName, 
    LastName, 
    RegistrationDate
FROM members
WHERE registrationdate >= '2025-01-01';

-- Change the date to database structure that is yyyy-mm-dd
