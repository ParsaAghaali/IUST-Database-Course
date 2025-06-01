UPDATE Product
SET IsDiscontinued = 1
WHERE Id IN (
  SELECT DISTINCT oi.ProductId
  FROM [Order] o
  JOIN OrderItem oi ON o.Id = oi.OrderId
  WHERE o.OrderDate BETWEEN '2012-06-01' AND '2013-01-31'
) AND IsDiscontinued = 0