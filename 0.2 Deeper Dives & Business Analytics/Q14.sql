-- Q14: Generate a combined list of contact emails. Include emails from all 'Active' members and all instructors. 
-- Call the resulting column ContactEmail. Then ensure each email appears only once, even if an instructor is also 
-- an active member.
SELECT Email AS ContactEmail FROM Members WHERE MembershipStatus = 'Active'
UNION
SELECT Email AS ContactEmail FROM Instructors;