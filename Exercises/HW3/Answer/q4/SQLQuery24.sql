-- INSERT data into the Costumer table
INSERT INTO Costumer (Id, FirstName, LastName, City, Country, Phone)
SELECT Id, FirstName, LastName, City, Country, Phone
FROM OPENROWSET(BULK 'Costumer.csv', FORMATFILE = 'Costumer.fmt', FIRSTROW = 2) AS rows;

-- INSERT data into the Product table
INSERT INTO Product (Id, ProductName, SupplierId, UnitPrice, Package, IsDiscontinued)
SELECT Id, ProductName, SupplierId, UnitPrice, Package, IsDiscontinued
FROM OPENROWSET(BULK 'Product.csv', FORMATFILE = 'Product.fmt', FIRSTROW = 2) AS rows;

-- INSERT data into the Order table
INSERT INTO Order1 (Id, OrderDate, OrderNumber, CustomerId, TotalAmount)
SELECT Id, OrderDate, OrderNumber, CustomerId, TotalAmount
FROM OPENROWSET(BULK 'Order.csv', FORMATFILE = 'Order.fmt', FIRSTROW = 2) AS rows;

-- INSERT data into the OrderItem table
INSERT INTO OrderItem (Id, OrderId, ProductId, UnitPrice, Quantity)
SELECT Id, OrderId, ProductId, UnitPrice, Quantity
FROM OPENROWSET(BULK 'OrderItem.csv', FORMATFILE = 'OrderItem.fmt', FIRSTROW = 2) AS rows;

-- INSERT data into the Supplier table
INSERT INTO Supplier (Id, CompanyName, ContactName, ContactTitle, City, Country, Phone, Fax)
SELECT Id, CompanyName, ContactName, ContactTitle, City, Country, Phone, Fax
FROM OPENROWSET(BULK 'Supplier.csv', FORMATFILE = 'Supplier.fmt', FIRSTROW = 2) AS rows;