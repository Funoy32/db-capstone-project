USE LittleLemonDB;
-- IMPORTANT: POPULATE THE DB AS YOU NEEDED, FOR EXAMPLE, SOME PROCEDURES(AVAIBLE IN THE RESPECTIVE FILES)LIKE CANCEL A BOOKING
-- MAKES SENSE BEFORE YOU ATTACHED ORDERS TO IT AND SO ON.
-- =====================================
-- Insert records for CustomersDetails
-- CustomerID is AUTO_INCREMENT
-- =====================================
INSERT INTO CustomersDetails (FullName, PhoneNumber, Email) VALUES
  ('Alice Johnson',   '555-1010', 'alice.johnson@email.com'),
  ('Bob Smith',       '555-2020', 'bob.smith@email.com'),
  ('Charlie Brown',   '555-3030', 'charlie.brown@email.com'),
  ('Diana Prince',    '555-4040', 'diana.prince@email.com'),
  ('Ethan Hunt',      '555-5050', 'ethan.hunt@email.com');

-- =====================================
-- Insert records for Bookings
-- BookingID is AUTO_INCREMENT
-- =====================================
INSERT INTO Bookings (BookingDate, TableNumber, `Customers Detail_CustomerID`) VALUES
  ('2025-09-01', 5, 1),
  ('2025-09-02', 3, 2),
  ('2025-09-03', 2, 3),
  ('2025-09-04', 4, 4),
  ('2025-09-05', 1, 5);
  
  -- =====================================
-- Insert records for Staff Information
-- StaffID is AUTO_INCREMENT
-- =====================================
INSERT INTO `Staff Information` (FullName, Role, Salary) VALUES
  ('Maria Lopez',  'Manager', 5500.00),
  ('John Carter',  'Chef',    4000.00),
  ('Sarah King',   'Waiter',  2500.00),
  ('James Bond',   'Delivery',3000.00),
  ('Linda White',  'Cashier', 2200.00);
  
-- =====================================
-- Insert records for Orders
-- OrderID is AUTO_INCREMENT
-- =====================================
  
  INSERT INTO Orders (OrderDate, TotalCost, Bookings_BookingID, `Staff Information_StaffID`) VALUES
  ('2025-09-01 12:30:00', 45.00, 1, 2),
  ('2025-09-01 13:00:00', 75.50, 2, 3),
  ('2025-09-02 18:00:00', 120.00, 3, 2),
  ('2025-09-02 19:00:00', 60.00, 4, 3),
  ('2025-09-03 20:00:00', 200.00, 5, 1);
  
  -- =====================================
-- Insert records for Menu
-- MenuItemID is AUTO_INCREMENT
-- =====================================

  INSERT INTO Menu (ItemName, ItemType, Price) VALUES
  ('Margherita Pizza', 'Cuisine', 12.00),
  ('Caesar Salad',    'Starter', 8.50),
  ('Spaghetti Bolognese', 'Course', 15.00),
  ('Coke',            'Drink',   3.00),
  ('Chocolate Cake',  'Dessert', 6.50);
  
  -- =====================================
-- Insert records for OrderDeliveryStatus
-- DeliveryID is NOT AUTO_INCREMENT
-- =====================================
INSERT INTO OrderDeliveryStatus (DeliveryID, DeliveryDate, Status, Orders_OrderID) VALUES
  (1, '2025-09-01 14:00:00', 'Delivered', 1),
  (2, '2025-09-01 15:00:00', 'Pending',   2),
  (3, '2025-09-02 19:00:00', 'Delivered', 3),
  (4, '2025-09-02 20:00:00', 'Cancelled', 4),
  (5, '2025-09-03 21:00:00', 'Delivered', 5);
  
-- =====================================
-- Insert records for Order_Items
-- Composite primary key (Menu_MenuItemID, Orders_OrderID)
-- =====================================
INSERT INTO Order_Items (Quantity, Menu_MenuItemID, Orders_OrderID) VALUES
  (2, 1, 1),
  (1, 2, 2),
  (3, 3, 3),
  (2, 4, 4),
  (1, 5, 5);