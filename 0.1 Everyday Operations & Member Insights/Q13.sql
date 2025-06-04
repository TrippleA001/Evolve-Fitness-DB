-- 13. What is the total Amount of 'Paid' payments recorded in the Payments table?
SELECT SUM(AmountPaid) AS TotalPaid
FROM payments
WHERE PaymentStatus = 'Paid';