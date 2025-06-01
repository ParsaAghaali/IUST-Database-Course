use [ShopProject]

/* domain desc queries*/

select ProductName, CityName from dbo.Product
order by CityName;

select UserName, CityName from dbo.Customer
order by CityName;

select ProductName, ProductDetail from dbo.Product;

select PhoneNumber, ProductName from dbo.Product

select CityName, COUNT(CityName) as product_in_city from dbo.Product
group by CityName;

select CityName, COUNT(CityName) as customer_in_city from dbo.Customer
group by CityName;

select UserName, ProductID from dbo.Bookmark
INNER JOIN Customer on Bookmark.PhoneNumber = Customer.PhoneNumber;

select ProductName, Category from dbo.Product
order by Category;

select Buyer_PhoneNumber, SellerPhoneNumber,ProductName from dbo.Customer
INNER JOIN Deal on Deal.Buyer_PhoneNumber = Customer.PhoneNumber
INNER JOIN Product on Deal.ProductID = Product.ProductID;

select * from dbo.Deal;

select ProductName, Available from dbo.Product
order by Available desc;

select ProductName, CityName, ProductAddress from dbo.Product
order by CityName

/* other queries */

/*products before 2020*/
select * from dbo.Product
where PostDate < CONVERT(VARCHAR, '01/01/2020', 103)

/*available products after 2020*/
select * from dbo.Product
where PostDate > CONVERT(VARCHAR, '01/01/2020', 103) and Available = 1

/* customers who had at least one deal*/
select DISTINCT UserName from dbo.Customer
INNER JOIN Deal on Deal.Buyer_PhoneNumber = Customer.PhoneNumber or Deal.SellerPhoneNumber = Customer.PhoneNumber

/* products with highest quality and highest price*/
select * from dbo.Product
order by Quality desc, Price desc

/* user product post count*/
select Customer.PhoneNumber, MAX(UserName) as names, COUNT(UserName) as product_post_cnt from dbo.Customer
INNER JOIN Product on Product.PhoneNumber = Customer.PhoneNumber
group by Customer.PhoneNumber

/* user who commented ordered by comment count*/
select Customer.PhoneNumber, MAX(UserName) as names, COUNT(UserName) as comment_cnt from dbo.Customer
INNER JOIN Comment on Comment.PhoneNumber = Customer.PhoneNumber
group by Customer.PhoneNumber
order by comment_cnt desc

/* user with most sells*/
select Customer.PhoneNumber, MAX(UserName) as names, COUNT(UserName) as sell_cnt from dbo.Customer
INNER JOIN Deal on Deal.SellerPhoneNumber = Customer.PhoneNumber
group by Customer.PhoneNumber
order by sell_cnt desc

/* user with most purchases*/
select Customer.PhoneNumber, MAX(UserName) as names, COUNT(UserName) as buy_cnt from dbo.Customer
INNER JOIN Deal on Deal.Buyer_PhoneNumber = Customer.PhoneNumber
group by Customer.PhoneNumber
order by buy_cnt desc