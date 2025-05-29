-- Q16: Which MembershipTier has generated the most revenue from 'Paid' payments so far? 
-- Show the TierName and total revenue.

SELECT m.TierID, SUM(p.Amount) AS TotalRevenue
FROM payments p
JOIN members m ON p.MemberID = m.MemberID
WHERE p.PaymentStatus = 'Paid'
GROUP BY m.TierID
ORDER BY TotalRevenue DESC
LIMIT 1;