SELECT 
    m.FirstName,
    m.LastName,
    m.Email,
    t.tier_name AS TierName
FROM 
    members m
JOIN 
    membership_tier t ON m.TierID = t.tierID
WHERE 
    m.membershipStatus = 'Active';