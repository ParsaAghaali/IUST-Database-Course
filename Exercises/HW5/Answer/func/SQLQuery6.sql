CREATE FUNCTION fn_GetSellersByTransactionCount
(
  @TransactionCount INT
)
RETURNS TABLE
AS
RETURN
(
  SELECT Vendors.ID, COUNT(*) AS TransactionCount
  FROM Transactions, Vendors
  WHERE History = 'Sold'
  AND Transactions.History >= DATEADD(month, -1, GETDATE())
  GROUP BY Vendors.ID
  HAVING COUNT(*) > @TransactionCount
);