CREATE TRIGGER tr_DecrementProductBookmarks
ON Bookmarks
AFTER DELETE
AS
BEGIN
  UPDATE Product
  SET Bookmarks = Bookmarks - 1
  FROM Product
  INNER JOIN DELETED ON Product.ProductID = DELETED.ProductID
END;