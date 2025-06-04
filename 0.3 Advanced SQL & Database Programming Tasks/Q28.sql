-- 2A. Creating stored procedure to register new member

DELIMITER //

CREATE PROCEDURE RegisterNewMember (
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_DateOfBirth DATE,
    IN p_Email VARCHAR(100),
    IN p_Phone VARCHAR(20),
    IN p_TierID INT,
    IN p_RegistrationDate DATE,
    IN p_InitialPaymentAmount DECIMAL(8,2)
)
proc: BEGIN
    DECLARE v_ExistingMemberID INT DEFAULT NULL;
    DECLARE v_TierExists INT DEFAULT 0;
    DECLARE v_NewMemberID INT;

    -- If RegistrationDate not provided, default to today
    IF p_RegistrationDate IS NULL THEN
        SET p_RegistrationDate = CURDATE();
    END IF;

    -- Check if the TierID exists
    SELECT COUNT(*) INTO v_TierExists FROM membership_tiers WHERE TierID = p_TierID;
    IF v_TierExists = 0 THEN
        SELECT 'Registration Failed: Invalid Membership TierID.' AS Message;
        LEAVE proc;
    END IF;

    -- Check if email already registered
    SELECT MemberID INTO v_ExistingMemberID FROM members WHERE Email = p_Email LIMIT 1;
    IF v_ExistingMemberID IS NOT NULL THEN
        SELECT 'Registration Failed: Email already registered.' AS Message;
        LEAVE proc;
    END IF;

    -- Insert new member
    INSERT INTO members (
        FirstName, LastName, DOB, Email, Phone, RegistrationDate, membership_status,
        TierID, LastPaymentDate, NextPaymentDueDate, TotalPaymentsMade
    )
    VALUES (
        p_FirstName, p_LastName, p_DateOfBirth, p_Email, p_Phone, p_RegistrationDate, 'Active',
        p_TierID, p_RegistrationDate, DATE_ADD(p_RegistrationDate, INTERVAL 1 MONTH), p_InitialPaymentAmount
    );

    -- Get new MemberID
    SET v_NewMemberID = LAST_INSERT_ID();

    -- Record initial payment
    INSERT INTO payments (MemberID, PaymentDate, AmountPaid, PaymentStatus)
    VALUES (v_NewMemberID, p_RegistrationDate, p_InitialPaymentAmount, 'Paid');

    -- Return success message and new MemberID
    SELECT 'Registration Successful' AS Message, v_NewMemberID AS MemberID;
END;
//

DELIMITER ;

-- checking parameters in RegisterNewMembers
SHOW CREATE PROCEDURE RegisterNewMember;

-- checking for parameters in RegisterNewMember
SELECT 
  PARAMETER_NAME, DATA_TYPE, DTD_IDENTIFIER, ORDINAL_POSITION
FROM information_schema.PARAMETERS
WHERE SPECIFIC_NAME = 'RegisterNewMember'
  AND SPECIFIC_SCHEMA = 'evolve_fitness';


-- Basic successful registration
CALL RegisterNewMember(
    'Alice',
    'Johnson',
    '1990-05-15',
    'alice@example.com',
    '123-456-7890',
    1,               -- assuming TierID 1 exists
    NULL,            -- to use default CURDATE() for RegistrationDate
    50.00            -- initial payment amount
);


-- Test duplicate (failure cases)
CALL RegisterNewMember(
    'Alice',
    'Johnson',
    '1990-05-15',
    'alice@example.com',  -- same email as before
    '123-456-7890',
    1,
    NULL,
    50.00
);

-- testing for edges cases
-- testing with specific registration date
CALL RegisterNewMember(
    'Bob',
    'Smith',
    '1985-10-20',
    'bob.smith@example.com',
    '555-987-6543',
    2,  -- make sure TierID 2 exists
    '2025-05-15',  -- specific registration date
    70.00
);


-- Testing with invalid TierID(foreign ID violation)
CALL RegisterNewMember(
    'Carol',
    'White',
    '1992-02-28',
    'carol.white@example.com',
    '555-111-2222',
    9999,  -- assuming this TierID does NOT exist
    NULL,
    60.00
);


-- 2B. Creating BookClass stored procedure

DELIMITER //

CREATE PROCEDURE BookClass(
    IN p_MemberID INT,
    IN p_ScheduledClassID INT
)
proc: BEGIN
    DECLARE v_MemberStatus VARCHAR(20);
    DECLARE v_ClassMaxCapacity INT;
    DECLARE v_CurrentBookings INT;
    DECLARE v_AlreadyBooked INT;
    DECLARE v_SessionExists INT;

    -- Check if member exists and is 'Active'
    SELECT membership_status INTO v_MemberStatus FROM members WHERE MemberID = p_MemberID LIMIT 1;
    IF v_MemberStatus IS NULL THEN
        SELECT 'Booking Failed: Member Not Found.' AS Message;
        LEAVE proc;
    ELSEIF v_MemberStatus != 'Active' THEN
        SELECT 'Booking Failed: Member Not Active.' AS Message;
        LEAVE proc;
    END IF;

    -- Check if class session exists
    SELECT COUNT(*) INTO v_SessionExists FROM class_sessions WHERE SessionID = p_ScheduledClassID;
    IF v_SessionExists = 0 THEN
        SELECT 'Booking Failed: Class Session Not Found.' AS Message;
        LEAVE proc;
    END IF;

    -- Check if already booked
    SELECT COUNT(*) INTO v_AlreadyBooked FROM bookings WHERE MemberID = p_MemberID AND SessionID = p_ScheduledClassID;
    IF v_AlreadyBooked > 0 THEN
        SELECT 'Booking Failed: Already Booked for this Session.' AS Message;
        LEAVE proc;
    END IF;

    -- Get max capacity for this class session's class
    SELECT c.MaxCapacity
    INTO v_ClassMaxCapacity
    FROM classes c
    JOIN class_sessions cs ON c.ClassID = cs.ClassID
    WHERE cs.SessionID = p_ScheduledClassID;

    -- Get current booking count for this session
    SELECT COUNT(*) INTO v_CurrentBookings FROM bookings WHERE SessionID = p_ScheduledClassID;

    IF v_CurrentBookings >= v_ClassMaxCapacity THEN
        SELECT 'Booking Failed: Class Session Full.' AS Message;
        LEAVE proc;
    END IF;

    -- Insert booking with current datetime in BookingTimestamp_DT column
    INSERT INTO bookings (MemberID, SessionID, BookingTimestamp_DT)
    VALUES (p_MemberID, p_ScheduledClassID, NOW());

    SELECT 'Booking Successful' AS Message;
END;
//

DELIMITER ;

-- Testing edges cases
CALL BookClass(9999, 1); -- Non-existent member  
CALL BookClass(1, 9999); -- Non-existent session  
CALL BookClass(1, 1); -- Normal booking  
CALL BookClass(1, 1); -- Double booking, should fail