SELECT Vendors.ID, 
       ISNULL(SUM(Transactions.Price), 0) AS TotalSales 
FROM Vendors 
LEFT JOIN Users ON Vendors.ID = Users.ID 
LEFT JOIN Transactions ON Vendors.ID = Transactions.ProductID 
GROUP BY Vendors.ID 
ORDER BY TotalSales DESC;