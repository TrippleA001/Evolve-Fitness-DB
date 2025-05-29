Create the following stored procedures:
A. RegisterNewMember


Inputs: p_FirstName, p_LastName, p_DateOfBirth, p_Email, p_Phone, p_TierID, p_RegistrationDate (defaults to CURDATE()), p_InitialPaymentAmount.

DELIMETER //

create table RegisterNewMember (
 p_FirstName varchar(50),
 p_LastName varchar(50),
 p_DateOfBirth date,
 p_Email varchar(50),
 p_Phone varchar(50),
 p_TierID int,
 p_RegistrationDate date,
 p_InitialPaymentAmount int
 
 );
