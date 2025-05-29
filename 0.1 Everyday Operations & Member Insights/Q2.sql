-- Q2: How many members are currently in an 'Expired' status?
SELECT COUNT(*) AS expired_member_count
FROM members m
WHERE m.MembershipStatus = 'Expired';
