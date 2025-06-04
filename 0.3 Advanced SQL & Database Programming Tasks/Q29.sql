-- 3. UDF (User Defined Function)
-- 3A. CalculateMemberAge
DELIMITER //

CREATE FUNCTION CalculateMemberAge(p_DateOfBirth DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Age INT;
    SET v_Age = TIMESTAMPDIFF(YEAR, p_DateOfBirth, CURDATE());
    RETURN v_Age;
END;
//

DELIMITER ;

-- Testing the MemberAge Function
SELECT CalculateMemberAge('1990-01-15') AS Age;


-- 3B. GetMemberTierBenefits

DELIMITER //

CREATE FUNCTION GetMemberTierBenefits(p_MemberID INT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE v_Benefits TEXT;

    SELECT t.Benefits
    INTO v_Benefits
    FROM members m
    JOIN membership_tiers t ON m.TierID = t.TierID
    WHERE m.MemberID = p_MemberID
    LIMIT 1;

    RETURN v_Benefits;
END;
//

DELIMITER ;


-- Testing GetMemberTierBenefits
SELECT GetMemberTierBenefits(1) AS Benefits;


-- 3C. GetClassAvailability

DELIMITER //

CREATE FUNCTION GetClassAvailability(p_ScheduledClassID INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE v_MaxCapacity INT;
    DECLARE v_BookedCount INT;
    DECLARE v_Remaining INT;
    DECLARE v_Result VARCHAR(100);

    -- Get class max capacity
    SELECT c.MaxCapacity
    INTO v_MaxCapacity
    FROM class_sessions cs
    JOIN classes c ON cs.ClassID = c.ClassID
    WHERE cs.SessionID = p_ScheduledClassID;

    -- If not found
    IF v_MaxCapacity IS NULL THEN
        RETURN 'Class Not Found';
    END IF;

    -- Count bookings
    SELECT COUNT(*) INTO v_BookedCount
    FROM bookings
    WHERE SessionID = p_ScheduledClassID;

    SET v_Remaining = v_MaxCapacity - v_BookedCount;

    IF v_Remaining <= 0 THEN
        SET v_Result = 'Full';
    ELSE
        SET v_Result = CONCAT('Available (', v_Remaining, ' spots left)');
    END IF;

    RETURN v_Result;
END;
//

DELIMITER ;


-- Testing GetClassAvailability
SELECT GetClassAvailability(1) AS Availability;

