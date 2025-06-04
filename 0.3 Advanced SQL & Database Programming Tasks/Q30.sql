-- Q30: Stored Procedure — BookClass
-- Task: Check constraints, insert booking.
DELIMITER $$

CREATE PROCEDURE BookClass (
  IN p_MemberID INT,
  IN p_ClassID INT
)
BEGIN
  DECLARE member_status VARCHAR(20);
  DECLARE current_bookings INT;
  DECLARE max_capacity INT;
  DECLARE already_booked INT;

  -- Check if member exists and is active
  SELECT MembershipStatus INTO member_status
  FROM Members
  WHERE MemberID = p_MemberID;

  IF member_status != 'Active' THEN
    SELECT 'Booking Failed: Member not active' AS Status;
  ELSE

    -- Check if member already booked
    SELECT COUNT(*) INTO already_booked
    FROM Bookings
    WHERE MemberID = p_MemberID AND ClassID = p_ClassID;

    IF already_booked > 0 THEN
      SELECT 'Booking Failed: Already Booked' AS Status;
    ELSE

      -- Check capacity
      SELECT CurrentBookings, MaxCapacity INTO current_bookings, max_capacity
      FROM Classes
      WHERE ClassID = p_ClassID;

      IF current_bookings >= max_capacity THEN
        SELECT 'Booking Failed: Class Full' AS Status;
      ELSE

        -- Insert booking
        INSERT INTO Bookings (MemberID, ClassID, BookingTimestamp)
        VALUES (p_MemberID, p_ClassID, NOW());

        SELECT 'Booking Successful' AS Status;

      END IF;
    END IF;
  END IF;
END $$

DELIMITER ;

-- Test
CALL BookClass(3, 5);