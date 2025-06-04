<<<<<<< HEAD
16. Which MembershipTier has generated the most revenue from 'Paid' payments so far?
=======
-- 16. Which MembershipTier has generated the most revenue from 'Paid' payments so far?
>>>>>>> 0fff44e0151cb1fee629f09bd480816edbc23956
-- Show the TierName and total revenue
SELECT mt.TierName, SUM(m.TotalPaymentsMade) AS TotalRevenue
FROM members m
JOIN membership_tiers mt ON m.TierID = mt.TierID
WHERE m.membership_status = 'Active'
GROUP BY mt.TierName
ORDER BY TotalRevenue DESC
<<<<<<< HEAD
LIMIT 1;

=======
LIMIT 1;
>>>>>>> 0fff44e0151cb1fee629f09bd480816edbc23956
