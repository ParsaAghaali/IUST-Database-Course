SELECT COUNT(DISTINCT BuyerID) AS NumCustomers
FROM Transactions t
WHERE TRY_CONVERT(date, t.History, 120) >= DATEADD(month, -2, GETDATE())
  AND TRY_CONVERT(date, t.History, 120) < DATEADD(month, -1, GETDATE())
  AND BuyerID IN (
      SELECT DISTINCT BuyerID
      FROM Transactions
      WHERE TRY_CONVERT(date, t.History, 120) >= DATEADD(month, -1, GETDATE())
        AND TRY_CONVERT(date, t.History, 120) < GETDATE()
  );