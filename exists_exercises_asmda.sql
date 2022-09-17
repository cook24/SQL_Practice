





/*

Exercise 1:

Select all records from the Purchasing.PurchaseOrderHeader table 
such that there is at least one item in the order with an order quantity greater than 500. 
The individual items tied to an order can be found in the Purchasing.PurchaseOrderDetail table.

Select the following columns:

    PurchaseOrderID
    OrderDate
    SubTotal
    TaxAmt

Sort by purchase order ID.

*/

SELECT
	poh.PurchaseOrderID,
	poh.OrderDate,
	poh.SubTotal,
	poh.TaxAmt
FROM Purchasing.PurchaseOrderHeader poh
WHERE EXISTS (
	SELECT 1
	FROM Purchasing.PurchaseOrderDetail pod
	WHERE pod.OrderQty > 500
	AND poh.PurchaseOrderID = pod.PurchaseOrderID
	)
ORDER BY 1






/*

Exercise 2:

Modify your query from Exercise 1 as follows:

Select all records from the Purchasing.PurchaseOrderHeader table 
such that there is at least one item in the order with an order quantity greater than 500, 
AND a unit price greater than $50.00.
Select ALL columns from the Purchasing.PurchaseOrderHeader table for display in your output.
Even if you have aliased this table to enable the use of a JOIN or EXISTS, 
you can still use the SELECT * shortcut to do this. Assuming you have aliased your table "A", 
simply use "SELECT A.*" to select all columns from that table.

*/

SELECT
	poh.*
FROM Purchasing.PurchaseOrderHeader poh
WHERE EXISTS (
	SELECT 1
	FROM Purchasing.PurchaseOrderDetail pod
	WHERE pod.OrderQty > 500
	AND pod.UnitPrice > 50
	AND poh.PurchaseOrderID = pod.PurchaseOrderID
	)
ORDER BY 1






/*

Exercise 3:

Select all records from the Purchasing.PurchaseOrderHeader table such that 
NONE of the items within the order have a rejected quantity greater than 0.
Select ALL columns from the Purchasing.PurchaseOrderHeader table using the "SELECT *" shortcut.

*/

SELECT
	poh.*
FROM Purchasing.PurchaseOrderHeader poh
WHERE NOT EXISTS (
	SELECT 1
	FROM Purchasing.PurchaseOrderDetail pod
	WHERE pod.RejectedQty >= 1
	AND poh.PurchaseOrderID = pod.PurchaseOrderID
	)
ORDER BY 1








