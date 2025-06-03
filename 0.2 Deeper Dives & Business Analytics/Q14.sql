SELECT DISTINCT Email AS ContactEmail
FROM (
    SELECT Email FROM members WHERE MembershipStatus = 'Active'
    UNION
    SELECT Email FROM instructors
) AS combined;