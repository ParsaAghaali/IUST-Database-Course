SELECT TOP 2 Users.ID, COUNT(*) AS NumPurchases
FROM Users
JOIN Transactions ON Users.ID = Transactions.BuyerID
JOIN Goods ON Transactions.ProductID = Goods.ItemID AND Goods.CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Electronics')
GROUP BY Users.ID
ORDER BY NumPurchases DESC;