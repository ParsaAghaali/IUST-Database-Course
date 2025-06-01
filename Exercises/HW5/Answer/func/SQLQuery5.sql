CREATE FUNCTION fn_GetTransactionsByDateAndPriceRange
(
  @StartDate DATETIME,
  @EndDate DATETIME,
  @MinPrice FLOAT,
  @MaxPrice FLOAT
)
RETURNS TABLE
AS
RETURN
(
  SELECT *
  FROM Transactions t
  INNER JOIN Goods g ON t.ProductID = g.ItemID
  WHERE t.History = 'Sold'
  AND t.Price >= @MinPrice AND t.Price <= @MaxPrice
  AND EXISTS (
    SELECT 1
    FROM Bookmarks b
    WHERE b.ProductID = t.ProductID
    AND b.BuyerID = t.BuyerID
  )
  AND EXISTS (
    SELECT 1
    FROM Users u
    WHERE u.ID = t.BuyerID
    AND u.Vip = 1
  )
  AND t.History >= @StartDate AND t.History <= @EndDate
);