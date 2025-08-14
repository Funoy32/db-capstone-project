USE littlelemondb;

CREATE VIEW OrdersView AS
SELECT 
    o.OrderID,
    oi.Quantity,
    o.TotalCost
FROM Orders o
JOIN Order_Items oi 
    ON o.OrderID = oi.Orders_OrderID
WHERE oi.Quantity > 2;

CREATE VIEW CustomerOrdersView AS
SELECT 
    c.CustomerID,
    c.FullName,
    o.OrderID,
    o.TotalCost,
    m.ItemName,
    m.ItemType
FROM CustomersDetails c
JOIN Bookings b 
    ON c.CustomerID = b.`Customers Detail_CustomerID`
JOIN Orders o 
    ON b.BookingID = o.Bookings_BookingID
JOIN Order_Items oi 
    ON o.OrderID = oi.Orders_OrderID
JOIN Menu m 
    ON oi.Menu_MenuItemID = m.MenuItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;

CREATE VIEW MenuItemsWithOrdersView AS
SELECT ItemName
FROM Menu
WHERE MenuItemID = ANY (
    SELECT Menu_MenuItemID
    FROM Order_Items
    WHERE Quantity > 2
);
