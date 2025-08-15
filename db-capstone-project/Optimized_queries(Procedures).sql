USE littlelemondb;



DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN 
   SELECT MAX(Quantity) AS Max_Quantity
   FROM order_items;
END //

DELIMITER ;



PREPARE GetOrderDetail 
FROM 
'SELECT o.OrderID, oi.Quantity, o.TotalCost
 FROM Orders o
 JOIN Order_Items oi 
   ON o.OrderID = oi.Orders_OrderID
 JOIN Bookings b
   ON o.Bookings_BookingID = b.BookingID
 WHERE b.`Customers Detail_CustomerID` = ?';




DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderId INT)
BEGIN
    DELETE FROM Orders
    WHERE OrderID = orderId;
END //

DELIMITER ;
