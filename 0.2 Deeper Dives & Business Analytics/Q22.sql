SELECT Email AS ContactEmail
FROM members
WHERE MembershipStatus = 'Active'
UNION ALL
SELECT Email AS ContactEmail
FROM instructors;
