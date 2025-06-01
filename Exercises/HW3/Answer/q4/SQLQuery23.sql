CREATE TABLE Costumer (
    Id INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20) NOT NULL
);

CREATE TABLE Order1 (
    Id INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    OrderNumber VARCHAR(20) NOT NULL,
    CustomerId INT NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
	UNIQUE(OrderNumber),
    FOREIGN KEY (Id) REFERENCES Costumer(Id)
		on update cascade
);

CREATE TABLE Supplier (
    Id INT PRIMARY KEY,
    CompanyName VARCHAR(max) NOT NULL,
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50),
    Phone VARCHAR(20) NOT NULL,
    Fax VARCHAR(20),
	CHECK (LEN(Phone) >= 7)
);

CREATE TABLE Product (
    Id INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    SupplierId INT,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Package VARCHAR(50),
    IsDiscontinued BIT NOT NULL,
    CHECK (UnitPrice >= 0),
	FOREIGN KEY (Id) REFERENCES Supplier(Id)
		on update cascade
);
CREATE TABLE OrderItem (
    Id INT PRIMARY KEY,
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    CHECK (UnitPrice >= 0),
    CHECK (Quantity > 0),
	FOREIGN KEY (Id) REFERENCES Order1(Id)
		on update cascade,
    FOREIGN KEY (Id) REFERENCES Product(Id)
		on update cascade
	
);