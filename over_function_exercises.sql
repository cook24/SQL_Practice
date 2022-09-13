

/*

Intro to Window Functions with OVER

*/


-- All rows

SELECT *
FROM AdventureWorks2019.Sales.SalesOrderHeader


-- Sum of all rows

SELECT 
	TotalDue,
	SUM(TotalDue) OVER()
FROM AdventureWorks2019.Sales.SalesOrderHeader


/*

EXERCISES

*/

/*
Exercise 1:

Create a query with the following columns:

    FirstName and LastName, from the Person.Person table**

    JobTitle, from the HumanResources.Employee table**

    Rate, from the HumanResources.EmployeePayHistory table**

    A derived column called "AverageRate" that returns the average of all values in the "Rate" column, in each row

	**All the above tables can be joined on BusinessEntityID


All the tables can be inner joined, and you do not need to apply any criteria.

*/

SELECT 
	Person.Person.FirstName,
	Person.Person.LastName,
	HumanResources.Employee.JobTitle,
	HumanResources.EmployeePayHistory.Rate,
	AVG(HumanResources.EmployeePayHistory.Rate) OVER () AS 'AverageRate'
FROM Person.Person
JOIN HumanResources.Employee 
	ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
JOIN HumanResources.EmployeePayHistory
	ON Person.Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID




/*

Exercise 2


Enhance your query from Exercise 1 by adding a derived column called

"MaximumRate" that returns the largest of all values in the "Rate" column, in each row

*/

SELECT 
	Person.Person.FirstName,
	Person.Person.LastName,
	HumanResources.Employee.JobTitle,
	HumanResources.EmployeePayHistory.Rate,
	AVG(HumanResources.EmployeePayHistory.Rate) OVER () AS 'AverageRate',
	MAX(HumanResources.EmployeePayHistory.Rate) OVER () AS 'MaximumRate'
FROM Person.Person
JOIN HumanResources.Employee 
	ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
JOIN HumanResources.EmployeePayHistory
	ON Person.Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID




/*

Exercise 3


Enhance your query from Exercise 2 by adding a derived column called

"DiffFromAvgRate" that returns the result of the following calculation:


An employees's pay rate, MINUS the average of all values in the "Rate" column.

*/


SELECT 
	Person.Person.FirstName,
	Person.Person.LastName,
	HumanResources.Employee.JobTitle,
	HumanResources.EmployeePayHistory.Rate,
	AVG(HumanResources.EmployeePayHistory.Rate) OVER () AS 'AverageRate',
	MAX(HumanResources.EmployeePayHistory.Rate) OVER () AS 'MaximumRate',
	HumanResources.EmployeePayHistory.Rate - AVG(HumanResources.EmployeePayHistory.Rate) OVER () AS 'DiffFromAvgRate'
FROM Person.Person
JOIN HumanResources.Employee 
	ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
JOIN HumanResources.EmployeePayHistory
	ON Person.Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID




/*

Exercise 4


Enhance your query from Exercise 3 by adding a derived column called

"PercentofMaxRate" that returns the result of the following calculation:


An employees's pay rate, DIVIDED BY the maximum of all values in the "Rate" column, times 100.

*/

SELECT 
	Person.Person.FirstName,
	Person.Person.LastName,
	HumanResources.Employee.JobTitle,
	HumanResources.EmployeePayHistory.Rate,
	AVG(HumanResources.EmployeePayHistory.Rate) OVER () AS 'AverageRate',
	MAX(HumanResources.EmployeePayHistory.Rate) OVER () AS 'MaximumRate',
	HumanResources.EmployeePayHistory.Rate - AVG(HumanResources.EmployeePayHistory.Rate) OVER () AS 'DiffFromAvgRate',
	HumanResources.EmployeePayHistory.Rate / MAX(HumanResources.EmployeePayHistory.Rate) OVER () * 100 AS 'PercentMaxRate'
FROM Person.Person
JOIN HumanResources.Employee 
	ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
JOIN HumanResources.EmployeePayHistory
	ON Person.Person.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID