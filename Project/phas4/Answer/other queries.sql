USE ShopProject;


/*add new column*/

AlTER TABLE dbo.Customer ADD temp INT;
GO
ALTER TABLE dbo.Customer ADD LastTimeOnline DATE DEFAULT GETDATE();
GO
AlTER TABLE dbo.Comment ADD Likes INT DEFAULT 0;

GO
/* drop column*/
ALTER TABLE dbo.Customer DROP COLUMN temp;
GO
/*update rows*/
UPDATE Customer
SET UserName='Amirali'
where PhoneNumber = '09333333333';
GO
UPDATE Product
SET ProductDetail='Very Good', OwnerDescription = 'Trustable'
where PhoneNumber = '09222222222';
GO
/* delete row from table*/
DELETE FROM Customer WHERE PhoneNumber = '09000000000';
DELETE FROM Deal WHERE Buyer_PhoneNumber = '09555555555' or SellerPhoneNumber = '09555555555'

GO

--Adding only number constraint for Admin.Adminssn
ALTER TABLE Admin
ADD CONSTRAINT SSN_Check CHECK (AdminSSN LIKE '[0-9]%');

--Adding constraint to Deal table to make sure buyer and seller are different person
ALTER TABLE Deal
ADD CONSTRAINT NotSame CHECK(Buyer_PhoneNumber<>SellerPhoneNumber);
GO
--Adding constraint to Deal table to make sure that every product must have at most 1 deal 
ALTER TABLE Deal
ADD CONSTRAINT product_unique UNIQUE(ProductID);

--deleting NoSameName CONSTRAINT
ALTER TABLE Admin
DROP CONSTRAINT NoSameName;
GO
--Changing default constraint to not null
ALTER TABLE Product
ALTER COLUMN Available BIT NOT NULL;
GO
--changing admin age constraint
ALTER TABLE Admin
ALTER COLUMN Age TINYINT NOT NULL;
ALTER TABLE Admin
ADD CONSTRAINT age_limit CHECK(20<Age AND AGE<60);

