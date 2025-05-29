SELECT 
	FirstName, 
	LastName, 
	TotalPaymentsMade
FROM members
ORDER BY TotalPaymentsMade DESC
LIMIT 3;