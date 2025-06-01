SELECT TOP 5 s.CompanyName, p.ProductName, p.UnitPrice
FROM Supplier s
JOIN Product p ON s.Id = p.SupplierId
WHERE p.IsDiscontinued = 0 AND p.UnitPrice > 10
ORDER BY p.UnitPrice DESC