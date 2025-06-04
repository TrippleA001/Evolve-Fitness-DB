16. Which MembershipTier has generated the most revenue from 'Paid' payments so far?
-- Show the TierName and total revenue
SELECT mt.TierName, SUM(m.TotalPaymentsMade) AS TotalRevenue
FROM members m
JOIN membership_tiers mt ON m.TierID = mt.TierID
WHERE m.membership_status = 'Active'
GROUP BY mt.TierName
ORDER BY TotalRevenue DESC
LIMIT 1;

