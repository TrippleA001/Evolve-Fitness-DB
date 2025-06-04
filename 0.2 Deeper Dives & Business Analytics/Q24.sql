-- Q24 Rank members within each tier by TotalPaymentsMade
SELECT 
  m.MemberID, m.FirstName, m.LastName, t.tier_name, m.TotalPaymentsMade,
  RANK() OVER (PARTITION BY m.TierID ORDER BY m.TotalPaymentsMade DESC) AS RankInTier
FROM Members m
JOIN Membership_Tiers t ON m.TierID = t.TierID;
