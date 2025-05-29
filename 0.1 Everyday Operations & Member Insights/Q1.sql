-- Q1: List the FirstName, LastName, Email, and TierName of all 'Active' members.
SELECT m.FirstName, m.LastName, m.Email, mt.tier_name 
FROM members m join membership_tiers mt on m.TierID = mt.TierID
WHERE m.MembershipStatus = 'Active';