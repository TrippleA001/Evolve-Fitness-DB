SELECT COUNT(*) AS ExpiredMemberCount
FROM members
WHERE membershipStatus = 'Expired';