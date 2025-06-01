SELECT TOP 2 BuyerID, COUNT(*) AS NumPurchases
FROM Transactions
WHERE ProductID IN (
    SELECT ItemID
    FROM Goods
    WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Electronics')
)
GROUP BY BuyerID
ORDER BY NumPurchases DESC;