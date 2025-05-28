-- 1.  List the FirstName, LastName, Email, and TierName of all 'Active' members.
SELECT FirstName, LastName, Email, TierName 
	FROM members M
LEFT JOIN membership_tier T
ON M.TierID=T.TierID
WHERE membershipstatus='Active';