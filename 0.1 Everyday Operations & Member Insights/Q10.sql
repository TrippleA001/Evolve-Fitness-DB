SELECT 
    FirstName,
    LastName,
    Email,
    IFNULL(Phone, 'Not Provided') AS modified_Phone
FROM instructors;