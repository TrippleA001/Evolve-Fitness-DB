Q14: SELECT Email AS ContactEmail FROM Members WHERE MembershipStatus = 'Active'
UNION
SELECT Email AS ContactEmail FROM Instructors;
