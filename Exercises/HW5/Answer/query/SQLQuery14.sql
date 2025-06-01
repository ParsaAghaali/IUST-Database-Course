SELECT SellerID, COUNT(*) AS NumItemsSold
FROM Goods
WHERE SellerID IN (
    SELECT SellerID
    FROM Goods
    GROUP BY SellerID
    HAVING COUNT(*) > (SELECT AVG(NumItemsSold) FROM (SELECT COUNT(*) AS NumItemsSold FROM Goods GROUP BY SellerID) AS AvgNumItemsSold)
)
GROUP BY SellerID;