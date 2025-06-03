-- Q15: List the top 3 members who have made the highest TotalPaymentsMade. Show their FirstName, LastName, and TotalPaymentsMade.
SELECT m.FirstName, m.LastName, m.TotalPaymentsMade
FROM Members m
ORDER BY m.TotalPaymentsMade DESC
LIMIT 3;
