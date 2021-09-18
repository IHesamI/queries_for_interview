CREATE TABLE sales (salesid INT, orderid INT,customer VARCHAR(25), prdocut VARCHAR(25) ,the_date INT, quantity INT , unitprice INT);
CREATE TABLE profit (product VARCHAR(25), profit_ratio INT);
/*question 1*/
SELECT SUM(quantity* unitprice) AS total_sale  from sales;

/*question 2*/

SELECT COUNT( DISTINCT customer) as unique_customers FROM sales;

/*question 3*/
SELECT distinct prdocut ,COUNT(*) AS total FROM sales GROUP BY product;


/*question 4 */ /*---------TODO---------*/
SELECT distinct customer, sum(quantity),count(customer) , sum(quantity* unitprice) FROM sales  WHERE  quantity* unitprice > 1500
 GROUP BY customer ;




/*question 5 */
WITH total_profit AS (SELECT sum(s.product*s.quantity *(pro.profit_ratio/100))
 AS tp FROM sales s JOIN profit pro ON pro.product=s.product OR pro.profit_ratio=10)
 ,total_sale AS(SELECT SUM(quantity* unitprice) AS ts  from sales) 
 select ts/tp *100 from total_profit ts , total_sale tp ;
 


