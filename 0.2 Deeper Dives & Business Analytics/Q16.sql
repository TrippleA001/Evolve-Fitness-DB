-- 	Q16: Which MembershipTier has generated the most revenue from 'Paid' payments? Show the TierName and total
-- revenue.
SELECT t.tier_name, SUM(p.Amount) AS TotalRevenue
FROM Payments p
JOIN Members m ON p.MemberID = m.MemberID
JOIN membership_tiers t ON m.TierID = t.TierID
WHERE p.PaymentStatus = 'Paid'
GROUP BY t.tier_name
ORDER BY TotalRevenue DESC
LIMIT 1;
