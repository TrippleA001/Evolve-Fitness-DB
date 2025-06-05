use evolve_fitness;
-- GetMemberTierBenefits
DELIMITER //
CREATE FUNCTION GetMemberTierBenefits(p_MemberID INT) RETURNS TEXT
DETERMINISTIC
BEGIN
DECLARE v_TierID INT;
DECLARE v_Benefits TEXT;

SELECT TierID INTO v_TierID FROM Members WHERE MemberID = p_MemberID;
SELECT Benefits INTO v_Benefits FROM MembershipTiers WHERE TierID = v_TierID;

RETURN v_Benefits;
END //
DELIMITER ;