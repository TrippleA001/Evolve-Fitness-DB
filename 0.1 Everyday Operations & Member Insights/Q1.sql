-- Q1: List the FirstName, LastName, Email, and TierName of all 'Active' members.
SELECT 
    m.FirstName,
    m.LastName,
    m.Email,
    t.TierName
FROM Members m
JOIN Membership_Tier t ON m.TierID = t.TierID
WHERE m.MembershipStatus = 'Active';
