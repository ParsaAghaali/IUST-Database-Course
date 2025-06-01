SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalPayment, o.OrderDate
FROM Costumer c
JOIN Order1 o ON c.Id = o.CustomerId
WHERE c.FirstName LIKE 'B%' AND o.OrderDate < '2013-01-01'
EXCEPT
SELECT c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalPayment, o.OrderDate
FROM Costumer c
JOIN Order1 o ON c.Id = o.CustomerId
WHERE c.FirstName NOT LIKE 'B%' OR o.OrderDate >= '2013-01-01'