SELECT COUNT(*) AS ExpiredMembers
FROM members
WHERE membership_status = 'Expired';