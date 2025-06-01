--This constraint requires checking the data across multiple rows and tables, 
--so it cannot be enforced using a simple table-level constraint. 
--Therefore, an assertion or a trigger would be more appropriate for this constraint



CREATE TRIGGER trg_Bookmarks_CheckBookmarkPerCategory
ON Bookmarks
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
  -- Check if each customer has at least one bookmark in each category
  IF EXISTS (
    SELECT 1
    FROM Users u
    CROSS JOIN Categories c
    WHERE u.ID NOT IN (
      SELECT b.BuyerID
      FROM Bookmarks b
      WHERE b.ProductID IN (
        SELECT g.ItemID
        FROM Goods g
        WHERE g.CategoryID = c.CategoryID
      )
    )
  )
  BEGIN
    RAISERROR ('Each customer must bookmark at least one product in each category', 16, 1)
    ROLLBACK TRANSACTION
    RETURN
  END
END