IF OBJECT_ID('Labels', 'U') IS NOT NULL
BEGIN
  EXEC('
    CREATE TRIGGER tr_IncrementDisplayedLabels
    ON Labels
    AFTER INSERT
    AS
    BEGIN
      UPDATE Product
      SET DisplayedLabels = DisplayedLabels + 1
      FROM Product
      INNER JOIN INSERTED ON Product.ProductID = INSERTED.ProductID
    END;
  ')
END;