-- Q13: What is the total Amount of 'Paid' payments recorded in the Payments table?
SELECT SUM(Amount) AS TotalPaid
FROM Payments
WHERE PaymentStatus = 'Paid';