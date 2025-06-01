use [ShopProject]

/* for execution:
EXEC procedure_name param1, param2, ...;
*/

GO
--Register a new customer.
CREATE PROCEDURE Register_Customer
	@PhoneNumber VARCHAR(13),
    @UserName NVARCHAR(50),
    @Age TINYINT,
    @UserAddress TEXT,
	@CityName NVARCHAR(20)
AS
BEGIN
    INSERT INTO dbo.Customer(PhoneNumber, SignUpDate, UserName, Age, UserAddress, CityName)
    VALUES(@PhoneNumber, GETDATE(), @UserName, @Age, @UserAddress, @CityName)
END;

GO

--Update the price for a specific product.
CREATE PROCEDURE Update_Product_Price
    @ProductID INT,
    @NewPrice BIGINT
AS
BEGIN
    UPDATE dbo.Product
    SET Price = @NewPrice
    WHERE ProductID = @ProductID;
END;

GO

--Update the PhoneNumber for a specific customer.
CREATE PROCEDURE Update_Customer_PhoneNumber
    @OldPhoneNumber VARCHAR(13),
	@NewPhoneNumber VARCHAR(13)
AS
BEGIN
    UPDATE dbo.Customer
    SET PhoneNumber = @NewPhoneNumber
    WHERE PhoneNumber = @OldPhoneNumber
END;
