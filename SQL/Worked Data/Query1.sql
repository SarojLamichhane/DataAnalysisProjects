SELECT * FROM sales;

SELECT * 
FROM sales
WHERE Amount>2000 AND Boxes<100;

SELECT * FROM sales;

SELECT PID, COUNT(SPID) AS 'Number of Sales'
FROM sales
WHERE MONTH(SaleDate) = 01
GROUP BY PID;

SELECT * FROM products;

SELECT products.Product, SUM(sales.Boxes)
FROM products
Inner JOIN sales ON products.PID=sales.PID
WHERE products.Product IN("Milk Bars", "Eclairs") 
GROUP BY sales.PID
ORDER BY SUM(sales.Boxes) DESC;

SELECT products.Product, SUM(sales.Boxes) AS "Total Boxes"
FROM products
Inner JOIN sales ON products.PID=sales.PID
WHERE products.Product IN("Milk Bars", "Eclairs") 
AND sales.SaleDate BETWEEN '2022-2-1' AND '2022-2-7'
GROUP BY sales.PID
ORDER BY SUM(sales.Boxes) DESC;


SELECT SUM(Amount) 
FROM sales
WHERE Boxes=54
GROUP BY PID;

SELECT SPID, SUM(Customers) AS 'Number of customer', SUM(Boxes) AS 'Number of Boxes'
FROM sales
-- WHERE SUM(Customers) < 100 AND SUM(Boxes) < 100
GROUP BY SPID;

SELECT * FROM people;

SELECT p.Salesperson, COUNT(s.SPID) AS 'Number of Sales'
FROM people p 
INNER JOIN sales s on p.SPID = s.SPID
AND s.SaleDate BETWEEN '2022-1-1' AND '2022-1-7' 
GROUP BY Salesperson;








