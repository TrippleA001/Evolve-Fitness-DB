-- Q2: How many members are currently in an 'Expired' status?
SELECT COUNT(*) AS ExpiredMembersCount
FROM Members
WHERE MembershipStatus = 'Expired';
