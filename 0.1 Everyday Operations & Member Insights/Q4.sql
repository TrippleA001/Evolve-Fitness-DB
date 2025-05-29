-- question 4
-- Find all members who registered on or after January 1, 2025. Display
-- their FirstName, LastName, and RegistrationDate
SELECT FirstName, LastName, RegistrationDate
FROM Members
WHERE RegistrationDate >= '2025-01-01';
