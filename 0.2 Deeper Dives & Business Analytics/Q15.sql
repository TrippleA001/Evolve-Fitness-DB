-- Q15: List the top 3 members who have made the highest TotalPaymentsMade. 
-- Show their FirstName, LastName, and TotalPaymentsMade.

SELECT FirstName, LastName, TotalPaymentsMade
FROM members
ORDER BY TotalPaymentsMade DESC
LIMIT 3;