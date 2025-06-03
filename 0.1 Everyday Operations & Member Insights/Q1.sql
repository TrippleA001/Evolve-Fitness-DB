SELECT 
	m.FirstName, 
	m.LastName, 
	m.Email,
    TierName
FROM members as m
RIGHT JOIN membership_tiers as mt on m.TierID = mt.TierID
WHERE MembershipStatus = 'Active';