use [ShopProject]

--Check if a customer has made any purchases.

GO
CREATE FUNCTION Has_Made_Purchases(@CustomerPhone VARCHAR(13))
RETURNS BIT
AS
BEGIN
    DECLARE @Result BIT
    SELECT @Result = CASE WHEN EXISTS (SELECT * FROM dbo.Deal WHERE Buyer_PhoneNumber = @CustomerPhone) THEN 1 ELSE 0 END
    RETURN @Result
END;
GO

--Get the age of a customer based on their date of birth.  parameter format -> 'yyyy-mm-dd'
CREATE FUNCTION Calculate_Age(@DOB DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT
    SELECT @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END
    RETURN @Age
END;

GO

--Find the Person with highest sales
CREATE FUNCTION Find_Best_Seller()
RETURNS BIGINT
AS
BEGIN
    DECLARE @PhoneNumber BIGINT
    SELECT @PhoneNumber = (select TOP 1 SellerPhoneNumber as number from dbo.Deal
group by SellerPhoneNumber
order by SUM(Price) desc)
    RETURN @PhoneNumber
END;