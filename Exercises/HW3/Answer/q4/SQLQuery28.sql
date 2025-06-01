SELECT DISTINCT s.CompanyName, p.Discount
FROM Supplier s
JOIN Product p ON s.Id = p.SupplierId
ORDER BY p.Discount DESC, s.CompanyName ASC