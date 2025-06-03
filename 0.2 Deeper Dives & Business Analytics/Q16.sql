 SELECT t.TierName, SUM(p.Amount) AS TotalRevenue
FROM Payment p
JOIN Member m ON p.MemberID = m.MemberID
JOIN MembershipTiers t ON m.TierID = t.TierID
WHERE p.PaymentStatus = 'Paid'
GROUP BY t.TierName
ORDER BY TotalRevenue DESC
LIMIT 1;