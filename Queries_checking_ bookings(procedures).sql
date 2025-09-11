USE littlelemondb;

DELIMITER $$

CREATE PROCEDURE AddBooking(
    IN bDate DATE,
    IN tNumber INT,
    IN customerID INT
)
BEGIN
    INSERT INTO Bookings (BookingDate, TableNumber, `Customers Detail_CustomerID`)
    VALUES (bDate, tNumber, customerID);
END $$

DELIMITER ;


DELIMITER //

CREATE PROCEDURE CheckBooking(
    IN p_date DATE,
    IN p_table INT
)
BEGIN
    DECLARE table_status VARCHAR(20);

    -- Check if there is already a booking for that table on the given date
    IF EXISTS (
        SELECT 1
        FROM bookings
        WHERE BookingDate = p_date
          AND TableNumber = p_table
    ) THEN
        SET table_status = 'Booked';
    ELSE
        SET table_status = 'Available';
    END IF;

    -- Return the result
    SELECT p_date AS BookingDate, p_table AS TableNumber, table_status AS Status;
END //

DELIMITER ;

SELECT * FROM bookings;

CALL CheckBooking("2025-09-01", 5)



DELIMITER //

CREATE PROCEDURE AddValidBooking(
    IN p_date DATE,
    IN p_table INT,
    IN p_customerID INT
)
BEGIN
    DECLARE table_status INT;

    START TRANSACTION;

    SELECT COUNT(*) INTO table_status
    FROM bookings
    WHERE BookingDate = p_date
      AND TableNumber = p_table;

    IF table_status > 0 THEN
        ROLLBACK;
        SELECT 'Booking failed: Table already booked.' AS Message;
    ELSE
        INSERT INTO bookings (BookingDate, TableNumber, `Customers Detail_CustomerID`)
        VALUES (p_date, p_table, p_customerID);

        COMMIT;
        SELECT 'Booking successful!' AS Message;
    END IF;

END //

DELIMITER ;

CALL AddValidBooking("2025-10-4", 5, 2)



DELIMITER //
CREATE PROCEDURE UpdateBooking(
	 IN booking_id INT, 
     IN new_booking_date DATE
)
BEGIN 
     UPDATE Bookings
     SET BookingDate = new_booking_date
     WHERE BookingID = booking_id;
END //
DELIMITER ;

CALL UpdateBooking(5, "2022-12-19");



DELIMITER //
CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    -- Deletes a booking based on its BookingID
    DELETE FROM Bookings
    WHERE BookingID = booking_id;
END //
DELIMITER ;




