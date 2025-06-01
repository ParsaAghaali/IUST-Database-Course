SELECT p.ProductName, SUM(oi.UnitPrice * oi.Quantity) AS TotalCost
FROM Product p
JOIN OrderItem oi ON p.Id = oi.ProductId
GROUP BY p.ProductName
ORDER BY TotalCost DESC