use [ShopProject]

INSERT INTO dbo.Customer
VALUES('09111111111', '2014-02-21', 'Ali', 40, 'ABC', 'Tehran')

INSERT INTO dbo.Customer
VALUES('09000000000', '2014-02-22', 'reza', 50, 'fdrt', 'Gilan')

INSERT INTO dbo.Customer
VALUES('09222222222', '2017-05-25', 'Sadegh', 32, 'FFZ', 'Karaj')

INSERT INTO dbo.Customer
VALUES('09333333333', '2022-11-01', 'Ali', 21, 'ZZA', 'Isfahan')

INSERT INTO dbo.Customer
VALUES('09444444444', '2021-11-02', 'Mohamad', 22, 'AAC', 'Tehran')

INSERT INTO dbo.Customer
VALUES('09555555555', '2015-07-07', 'Hamid', 33, 'HGA', 'Isfahan')


INSERT INTO dbo.Admin
VALUES('1234567899', '09666666666', '2013-01-03', 'Sadegh', 27, 'AAB', 'Tehran')


SET IDENTITY_INSERT dbo.Product ON;
INSERT INTO dbo.Product(ProductID, ProductAddress, Available, ProductName, Price, Picture, Quality, PostDate, ProductDetail, OwnerDescription, PhoneNumber, CityName, Category, AdminSSN)
VALUES(1, 'BBB', 1, 'Tea', 50000, 'pic1', 6, '2021-02-14', 'det1', 'desc1', '09222222222', 'Karaj', 'Foods', '1234567899')

INSERT INTO dbo.Product(ProductID, ProductAddress, Available, ProductName, Price, Picture, Quality, PostDate, ProductDetail, OwnerDescription, PhoneNumber, CityName, Category, AdminSSN)
VALUES(2, 'ASS', 1, 'Pen', 6000, 'pic2', 1, '2021-05-29', 'det2', 'desc2', '09333333333', 'Isfahan', 'stationeries', '1234567899')

INSERT INTO dbo.Product(ProductID, ProductAddress, Available, ProductName, Price, Picture, Quality, PostDate, ProductDetail, OwnerDescription, PhoneNumber, CityName, Category, AdminSSN)
VALUES(3, 'ABC', 1, 'Pride', 1000000000, 'pic3', 2, '2021-11-27', 'det3', 'desc3', '09111111111', 'Tehran', 'Cars', '1234567899')

INSERT INTO dbo.Product(ProductID, ProductAddress, Available, ProductName, Price, Picture, Quality, PostDate, ProductDetail, OwnerDescription, PhoneNumber, CityName, Category, AdminSSN)
VALUES(4, 'KKK', 0, 'Benz', 10000000000, 'pic4', 6, '2020-10-26', 'det4', 'desc4', '09111111111', 'Tehran', 'Cars', '1234567899')

INSERT INTO dbo.Product(ProductID, ProductAddress, Available, ProductName, Price, Picture, Quality, PostDate, ProductDetail, OwnerDescription, PhoneNumber, CityName, Category, AdminSSN)
VALUES(5, 'POP', 0, 'Laptop', 40000000, 'pic5', 4, '2019-05-17', 'det5', 'desc5', '09555555555', 'Isfahan', 'Computers', '1234567899')
SET IDENTITY_INSERT dbo.Product OFF;

SET IDENTITY_INSERT dbo.Comment ON;
INSERT INTO dbo.Comment(ProductID, CommentID, PhoneNumber, Comment, CommentDate)
VALUES(3, 1, '09444444444', 'Khub', '2021-11-28')

INSERT INTO dbo.Comment(ProductID, CommentID, PhoneNumber, Comment, CommentDate)
VALUES(4, 2, '09555555555', 'Awli Bud', '2020-11-26')
SET IDENTITY_INSERT dbo.Comment OFF;

INSERT INTO dbo.Request(ProductID, PhoneNumber, RequestDate)
VALUES(4, '09444444444', '2021-11-29')

SET IDENTITY_INSERT dbo.Deal ON;
INSERT INTO dbo.Deal(Buyer_PhoneNumber, SellerPhoneNumber, DealDate, DealID, Price, ProductID)
VALUES('09555555555', '09111111111', '2020-10-27', 1, 9990000000, 4)

INSERT INTO dbo.Deal(Buyer_PhoneNumber, SellerPhoneNumber, DealDate, DealID, Price, ProductID)
VALUES('09444444444', '09555555555', '2019-06-19', 2, 35000000, 5)
SET IDENTITY_INSERT dbo.Deal OFF;