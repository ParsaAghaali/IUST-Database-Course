-- Create the Users table
CREATE TABLE Users (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    Vip BIT
);

-- Create the Vendors table that inherits from the Users table
CREATE TABLE Vendors (
    ID INT PRIMARY KEY,
    Points INT,
    CONSTRAINT FK_Vendors_Users FOREIGN KEY (ID) REFERENCES Users(ID)
);

-- Create the Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- Create the Goods table
CREATE TABLE Goods (
    ItemID INT PRIMARY KEY,
    SellerID INT,
    CategoryID INT,
    Bookmarks INT,
    CONSTRAINT FK_Goods_Users FOREIGN KEY (SellerID) REFERENCES Users(ID),
    CONSTRAINT FK_Goods_Categories FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create the Transactions table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    ProductID INT,
    BuyerID INT,
    Price FLOAT,
    History VARCHAR(255),
    CONSTRAINT FK_Transactions_Goods FOREIGN KEY (ProductID) REFERENCES Goods(ItemID),
    CONSTRAINT FK_Transactions_Users FOREIGN KEY (BuyerID) REFERENCES Users(ID)
);

-- Create the Bookmarks table
CREATE TABLE Bookmarks (
    ProductID INT,
    BuyerID INT,
    BadgeID INT,
    CONSTRAINT PK_Bookmarks PRIMARY KEY (ProductID, BuyerID),
    CONSTRAINT FK_Bookmarks_Goods FOREIGN KEY (ProductID) REFERENCES Goods(ItemID),
    CONSTRAINT FK_Bookmarks_Users FOREIGN KEY (BuyerID) REFERENCES Users(ID)
);