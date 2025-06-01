CREATE VIEW BuyerInfo AS
SELECT CONCAT(Name, ' ', Surname) AS Name, Email, SUM(TotalAmount) AS TotalSpent, COUNT(DISTINCT ProductID) AS NumGoods, (
    SELECT CategoryName
    FROM Categories
    WHERE CategoryID = (
        SELECT TOP 1 CategoryID
        FROM Bookmarks
        WHERE BuyerID = Transactions.BuyerID
        GROUP BY CategoryID
        ORDER BY COUNT(*) DESC
    )
) AS TopCategory
FROM Transactions
JOIN Vendors ON Transactions.BuyerID = Vendors.ID
JOIN Goods ON Transactions.ProductID = Goods.ItemID
GROUP BY Transactions.BuyerID, Vendors.Name, Vendors.Surname, Buyers.Email;