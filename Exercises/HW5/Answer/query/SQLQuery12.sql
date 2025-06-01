SELECT Transactions.BuyerID
FROM Transactions
WHERE Transactions.ProductID IN (
    SELECT DISTINCT Goods.ItemID
    FROM Goods
)
GROUP BY Transactions.BuyerID
HAVING COUNT(DISTINCT Transactions.ProductID) = (
    SELECT COUNT(DISTINCT Goods.CategoryID)
    FROM Goods
);