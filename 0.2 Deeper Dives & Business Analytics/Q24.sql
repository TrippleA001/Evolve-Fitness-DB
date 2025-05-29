SELECT 
  m.MemberID,
  m.FirstName,
  m.LastName,
  t.TierName,
  m.TotalPaymentsMade,
  RANK() OVER (PARTITION BY t.TierName ORDER BY m.TotalPaymentsMade DESC) AS RankInTier
FROM members m
JOIN membershiptiers t ON m.TierID = t.TierID;
