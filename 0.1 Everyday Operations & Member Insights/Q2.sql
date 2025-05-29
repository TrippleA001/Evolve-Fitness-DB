CREATE DATABASE Evolve_Fitness;
USE Evolve_Fitness;

SELECT COUNT(MemberID) 
FROM members
WHERE MembershipStatus = 'Expired';