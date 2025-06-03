SELECT DISTINCT Email AS ContactEmail FROM Members WHERE MembershipStatus = 'Active'
UNION
SELECT DISTINCT Email AS ContactEmail FROM Instructors;
