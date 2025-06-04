SELECT m.FirstName, m.LastName, m.Email, t.TierName
FROM members m
JOIN membership_tiers t ON m.TierID = t.TierID
WHERE m.membership_status = 'Active';