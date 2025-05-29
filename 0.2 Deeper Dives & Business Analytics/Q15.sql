-- question 15
-- List the top 3 members who have made the highest
-- TotalPaymentsMade. Show their FirstName, LastName, and TotalPaymentsMade
SELECT FirstName, LastName, SUM(TotalPaymentsMade) AS TotalPaid
FROM Members
GROUP BY FirstName, LastName
ORDER BY TotalPaid DESC
LIMIT 3;

