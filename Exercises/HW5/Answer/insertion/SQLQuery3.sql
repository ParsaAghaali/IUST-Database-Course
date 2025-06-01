-- Insert data into the Users table
INSERT INTO Users (ID, Name, Surname, Vip) VALUES
(1, 'John', 'Doe', 0),
(2, 'Jane', 'Doe', 1),
(3, 'Bob', 'Smith', 0),
(4, 'Alice', 'Johnson', 0),
(5, 'Charlie', 'Brown', 1);

-- Insert data into the Vendors table
INSERT INTO Vendors (ID, Points) VALUES
(2, 100),
(4, 50),
(5, 200);

-- Insert data into the Categories table
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home');

-- Insert data into the Goods table
INSERT INTO Goods (ItemID, SellerID, CategoryID, Bookmarks) VALUES
(1001, 1, 1, 10),
(1002, 2, 2, 5),
(1003, 4, 3, 2),
(1004, 5, 4, 8),
(1005, 1, 2, 3);

-- Insert data into the Transactions table
INSERT INTO Transactions (TransactionID, ProductID, BuyerID, Price, History) VALUES
(5001, 1001, 3, 500.00, 'Sold'),
(5002, 1002, 1, 100.00, 'Sold'),
(5003, 1003, 5, 25.00, 'Sold'),
(5004, 1004, 2, 75.00, 'Sold'),
(5005, 1005, 4, 50.00, 'Sold');

-- Insert data into the Bookmarks table
INSERT INTO Bookmarks (ProductID, BuyerID, BadgeID) VALUES
(1001, 3, 1),
(1002, 1, 2),
(1003, 5, 3),
(1004, 2, 4),
(1005, 4, 5);