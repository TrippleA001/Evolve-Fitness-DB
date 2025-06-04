-- 24. Rank members within each Membership Tier by TotalPaymentsMade
SELECT 
  m.MemberID,
  m.FirstName,
  m.LastName,
  mt.TierName,
  m.TotalPaymentsMade,
  RANK() OVER (PARTITION BY m.TierID ORDER BY m.TotalPaymentsMade DESC) AS RankInTier
FROM members m
JOIN membership_tiers mt ON m.TierID = mt.TierID;