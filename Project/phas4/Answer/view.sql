USE ShopProject;
GO

--Get a list of all products and price if there are Available.
CREATE VIEW Product_Info
AS
SELECT ProductID, ProductName, Price
FROM Product
WHERE(Available=1)

GO

--Get a list of all products that are sold,With their Price and sold Price.
CREATE VIEW Out_Of_Stock_Products
AS
SELECT Product.ProductID, CityName, ProductName,Product.Price AS Price,Deal.Price AS [Sold Price]
FROM Product,Deal
WHERE(Product.ProductID=Deal.ProductID)