CREATE TABLE Costumer (
    Id INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

CREATE TABLE Order1 (
    Id INT PRIMARY KEY,
    OrderDate DATE,
    OrderNumber VARCHAR(20),
    CustomerId INT,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (Id) REFERENCES Costumer(Id)
);

CREATE TABLE Supplier (
    Id INT PRIMARY KEY,
    CompanyName VARCHAR(max),
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20),
    Fax VARCHAR(20)
);

CREATE TABLE Product (
    Id INT PRIMARY KEY,
    ProductName VARCHAR(50),
    SupplierId INT,
    UnitPrice DECIMAL(10,2),
    Package VARCHAR(50),
    IsDiscontinued BIT,
    FOREIGN KEY (Id) REFERENCES Supplier(Id)
);
CREATE TABLE OrderItem (
    Id INT PRIMARY KEY,
    OrderId INT,
    ProductId INT,
    UnitPrice DECIMAL(10,2),
    Quantity INT,
    FOREIGN KEY (Id) REFERENCES Order1(Id),
    FOREIGN KEY (Id) REFERENCES Product(Id)
);
