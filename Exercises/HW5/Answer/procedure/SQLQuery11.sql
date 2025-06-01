CREATE PROCEDURE usp_SetVipStatus
  @PurchaseThreshold INT
AS
BEGIN
  UPDATE Users
  SET VIP = CASE
    WHEN PurchaseCount > @PurchaseThreshold THEN 1
    ELSE 0
  END
END;