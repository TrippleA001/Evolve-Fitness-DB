-- Q32: User-Defined Function — GetMemberTierBenefits
DELIMITER $$

CREATE FUNCTION GetMemberTierBenefits(p_MemberID INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
  DECLARE benefits TEXT;
  SELECT t.Benefits INTO benefits
  FROM Members m
  JOIN Membership_Tiers t ON m.TierID = t.TierID
  WHERE m.MemberID = p_MemberID;

  RETURN benefits;
END $$

DELIMITER ;

-- Test
SELECT GetMemberTierBenefits(1) AS Benefits;