


/*

Exercise 1


Create a query with the following columns:


    “Name” from the Production.Product table, which can be alised as “ProductName”

    “ListPrice” from the Production.Product table

    “Name” from the Production. ProductSubcategory table, which can be alised as “ProductSubcategory”*

    “Name” from the Production.ProductCategory table, which can be alised as “ProductCategory”**


*Join Production.ProductSubcategory to Production.Product on “ProductSubcategoryID”

**Join Production.ProductCategory to ProductSubcategory on “ProductCategoryID”


All the tables can be inner joined, and you do not need to apply any criteria.


*/


SELECT
	a.Name AS 'ProductName',
	a.ListPrice,
	b.Name AS 'ProductSubcategory',
	c.Name AS 'ProductCategory'
FROM Production.Product a
JOIN Production.ProductSubcategory b
	ON a.ProductSubcategoryID = b.ProductSubcategoryID
JOIN Production.ProductCategory c
	ON b.ProductCategoryID = c.ProductCategoryID






/*

Exercise 2


Enhance your query from Exercise 1 by adding a derived column called

"AvgPriceByCategory " that returns the average ListPrice for the product category in each given row.

*/

SELECT
	a.Name AS 'ProductName',
	a.ListPrice,
	b.Name AS 'ProductSubcategory',
	c.Name AS 'ProductCategory',
	AVG(a.ListPrice) OVER (PARTITION BY c.Name) AS 'AvgPriceByCategory'
FROM Production.Product a
JOIN Production.ProductSubcategory b
	ON a.ProductSubcategoryID = b.ProductSubcategoryID
JOIN Production.ProductCategory c
	ON b.ProductCategoryID = c.ProductCategoryID




/*

Exercise 3


Enhance your query from Exercise 2 by adding a derived column called

"AvgPriceByCategoryAndSubcategory" that returns the average ListPrice for the product category AND subcategory in each given row.

*/

SELECT
	a.Name AS 'ProductName',
	a.ListPrice,
	b.Name AS 'ProductSubcategory',
	c.Name AS 'ProductCategory',
	AVG(a.ListPrice) OVER (PARTITION BY c.Name) AS 'AvgPriceByCategory',
	AVG(a.ListPrice) OVER (PARTITION BY c.Name, b.name) AS 'AvgPriceByCategoryAndSubcategory'
FROM Production.Product a
JOIN Production.ProductSubcategory b
	ON a.ProductSubcategoryID = b.ProductSubcategoryID
JOIN Production.ProductCategory c
	ON b.ProductCategoryID = c.ProductCategoryID




/*

Exercise 4:


Enhance your query from Exercise 3 by adding a derived column called

"ProductVsCategoryDelta" that returns the result of the following calculation:


A product's list price, MINUS the average ListPrice for that product’s category.

*/

SELECT
	a.Name AS 'ProductName',
	a.ListPrice,
	b.Name AS 'ProductSubcategory',
	c.Name AS 'ProductCategory',
	AVG(a.ListPrice) OVER (PARTITION BY c.Name) AS 'AvgPriceByCategory',
	AVG(a.ListPrice) OVER (PARTITION BY c.Name, b.name) AS 'AvgPriceByCategoryAndSubcategory',
	a.ListPrice - AVG(a.ListPrice) OVER(PARTITION BY c.Name) AS 'ProductVsCategoryDelta'
FROM Production.Product a
JOIN Production.ProductSubcategory b
	ON a.ProductSubcategoryID = b.ProductSubcategoryID
JOIN Production.ProductCategory c
	ON b.ProductCategoryID = c.ProductCategoryID





