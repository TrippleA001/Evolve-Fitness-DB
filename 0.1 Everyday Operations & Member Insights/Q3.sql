SELECT 
    FirstName,
    LastName,
    NextPaymentDueDate
FROM 
    members
WHERE 
    NextPaymentDueDate <= '2025-06-10';