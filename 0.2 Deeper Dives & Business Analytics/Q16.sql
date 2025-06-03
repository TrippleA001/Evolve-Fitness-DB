-- Q16: Which MembershipTier has generated the most revenue from 'Paid' payments so far? Show the TierName and total revenue.
SELECT mt.Tier_Name, SUM(p.Amount) AS TotalRevenue
FROM Payments p
JOIN Members m ON p.MemberID = m.MemberID
JOIN Membership_Tiers mt ON m.TierID = mt.TierID
WHERE p.PaymentStatus = 'Paid'
GROUP BY mt.Tier_Name
ORDER BY TotalRevenue DESC
LIMIT 1;
