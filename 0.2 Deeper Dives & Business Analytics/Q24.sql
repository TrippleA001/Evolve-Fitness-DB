-- Rank members within each MembershipTier based on their TotalPaymentsMade (highest first). 
-- Show MemberID, FirstName, LastName, TierName, TotalPaymentsMade, and their RankInTier.
SELECT 
    m.MemberID,
    m.FirstName,
    m.LastName,
    mt.TierName,
    SUM(p.Amount) AS TotalPaymentsMade,
    RANK() OVER (
        PARTITION BY m.TierID
        ORDER BY SUM(p.Amount) DESC
    ) AS RankInTier
FROM Members m
JOIN Membership_Tier mt ON m.TierID = mt.TierID
JOIN Payments p ON m.MemberID = p.MemberID
GROUP BY m.MemberID, m.FirstName, m.LastName, mt.TierName, m.TierID
ORDER BY mt.TierName, RankInTier;
SELECT 
    m.MemberID,
    m.FirstName,
    m.LastName,
    mt.TierName,
    SUM(p.Amount) AS TotalPaymentsMade,
    RANK() OVER (
        PARTITION BY m.TierID
        ORDER BY SUM(p.Amount) DESC
    ) AS RankInTier
FROM Members m
JOIN Membership_Tier mt ON m.TierID = mt.TierID
JOIN Payments p ON m.MemberID = p.MemberID
GROUP BY m.MemberID, m.FirstName, m.LastName, mt.TierName, m.TierID
ORDER BY mt.TierName, RankInTier;
