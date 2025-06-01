--Creating Database
IF NOT EXISTS(SELECT * FROM SYS.databases WHERE name='ShopProject')
BEGIN
	CREATE DATABASE ShopProject;
END;
GO
USE ShopProject;
GO
--Creating Customer Table
CREATE TABLE Customer(
	PhoneNumber VARCHAR(13) CHECK(PhoneNumber LIKE'09%' OR PhoneNumber LIKE'+989%' OR PhoneNumber LIKE'021%' OR PhoneNumber LIKE'+9821%'),
	SignUpDate DATE DEFAULT GETDATE(),
	UserName NVARCHAR(50) NOT NULL CHECK(UserName LIKE'[a-zA-Zا-ی _]%'),
	Age TINYINT NOT NULL CHECK(17<Age),
	UserAddress TEXT NOT NULL,
	CityName NVARCHAR(20) NOT NULL CHECK(CityName LIKE'[a-zA-Zا-ی _]%'),
	PRIMARY KEY(PhoneNumber)
)
GO
--Creating Admin Table
CREATE TABLE Admin(
	AdminSSN CHAR(10),
	PhoneNumber VARCHAR(13) CHECK(PhoneNumber LIKE'09%' OR PhoneNumber LIKE'+989%' OR PhoneNumber LIKE'021%' OR PhoneNumber LIKE'+9821%'),
	SignUpDate DATE DEFAULT GETDATE(),
	UserName NVARCHAR(50) NOT NULL CHECK(UserName LIKE'[a-zA-Zا-ی _]%'),
	Age TINYINT NOT NULL CHECK(Age>17),
	AdminAddress TEXT NOT NULL,
	CityName NVARCHAR(20) NOT NULL CHECK(CityName LIKE'[a-zA-Zا-ی _]%'),
	PRIMARY KEY(AdminSSN),
	CONSTRAINT NoSameName UNIQUE(UserName)
)
GO
--Creating Product Table
CREATE TABLE Product(
	ProductID INT IDENTITY(1,1),
	ProductAddress TEXT,
	Available BIT DEFAULT 0,
	ProductName NVARCHAR(50) CHECK(ProductName LIKE'[a-zA-Zا-ی _]%'),
	Price BIGINT CHECK(Price>0),
	Picture VARCHAR(MAX),
	Quality TINYINT CHECK(0<Quality AND Quality<7),
	PostDate SMALLDATETIME DEFAULT GETDATE(),
	ProductDetail TEXT,
	OwnerDescription TEXT,
	PhoneNumber VARCHAR(13) CHECK(PhoneNumber LIKE'09%' OR PhoneNumber LIKE'+989%'),
	CityName NVARCHAR(20) CHECK(CityName LIKE'[a-zA-Zا-ی _]%'),
	Category NVARCHAR(30),
	AdminSSN CHAR(10),
	PRIMARY KEY(ProductID),
	FOREIGN KEY(PhoneNumber) REFERENCES Customer(PhoneNumber) ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(AdminSSN) REFERENCES Admin(AdminSSN) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO
--Creating Comment Table
CREATE TABLE Comment(
	ProductID INT,
	CommentID INT IDENTITY(1,1),
	PhoneNumber VARCHAR(13) CHECK(PhoneNumber LIKE'09%' OR PhoneNumber LIKE'+989%' OR PhoneNumber LIKE'021%' OR PhoneNumber LIKE'+9821%'),
	Comment TEXT NOT NULL,
	CommentDate SMALLDATETIME DEFAULT GETDATE(),
	PRIMARY KEY(CommentID),
	FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY(PhoneNumber) REFERENCES Customer(PhoneNumber)
)
GO
--Creating Request Table
CREATE TABLE Request(
	ProductID INT,
	PhoneNumber VARCHAR(13) CHECK(PhoneNumber LIKE'09%' OR PhoneNumber LIKE'+989%' OR PhoneNumber LIKE'021%' OR PhoneNumber LIKE'+9821%'),
	RequestDate SMALLDATETIME DEFAULT GETDATE(),
	PRIMARY KEY(ProductID,PhoneNumber),
	FOREIGN KEY(ProductID) REFERENCES Product(ProductID) ON DELETE NO ACTION, 
	FOREIGN KEY(PhoneNumber) REFERENCES Customer(PhoneNumber)
)
GO
--Creating Bookmark Table
CREATE TABLE Bookmark(
	ProductID INT,
	PhoneNumber VARCHAR(13) CHECK(PhoneNumber LIKE'09%' OR PhoneNumber LIKE'+989%' OR PhoneNumber LIKE'021%' OR PhoneNumber LIKE'+9821%'),
	BookmarkDate SMALLDATETIME DEFAULT GETDATE(),
	PRIMARY KEY(ProductID,PhoneNumber),
	FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY(PhoneNumber) REFERENCES Customer(PhoneNumber)
)
GO
--Creating Deal Table
CREATE TABLE Deal(
	Buyer_PhoneNumber VARCHAR(13) CHECK(Buyer_PhoneNumber LIKE'09%' OR Buyer_PhoneNumber LIKE'+989%' OR Buyer_PhoneNumber LIKE'021%' OR Buyer_PhoneNumber LIKE'+9821%') NOT NULL,
	SellerPhoneNumber VARCHAR(13) CHECK(SellerPhoneNumber LIKE'09%' OR SellerPhoneNumber LIKE'+989%' OR SellerPhoneNumber LIKE'021%' OR SellerPhoneNumber LIKE'+9821%') NOT NULL,
	DealDate SMALLDATETIME DEFAULT GETDATE(),
	DealID INT IDENTITY(1,1),
	Price BIGINT CHECK(Price>0),
	ProductID INT,
	PRIMARY KEY(DealID),
	FOREIGN KEY(ProductID) REFERENCES Product(ProductID)ON DELETE NO ACTION,
	FOREIGN KEY(Buyer_PhoneNumber) REFERENCES Customer(PhoneNumber)ON DELETE NO ACTION,
	FOREIGN KEY(SellerPhoneNumber) REFERENCES Customer(PhoneNumber)ON DELETE NO ACTION
);