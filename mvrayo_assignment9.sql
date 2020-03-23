/* 
Michael Vincent Rayo
Assignment 9
CS150A, Spring 2020
*/

/* Query 0 */
USE bookstore;

/* Query 1 */
SELECT DISTINCT c.category_name
FROM category AS c
WHERE c.category_id
IN (SELECT category_id FROM product WHERE c.category_id = category_id);

/* Query 2 */
SELECT p.product_name, p.list_price
FROM product AS p
WHERE list_price > (SELECT AVG(list_price) FROM product)
ORDER BY list_price DESC;

/* Query 3 */
SELECT category_name FROM category AS c
WHERE EXISTS (SELECT category_id FROM product WHERE category_id = c.category_id);

/* Query 3 */
SELECT category_name
FROM category
WHERE EXISTS (SELECT category_id, COUNT(*) 
FROM product GROUP BY category_id
HAVING COUNT(*) >= 1);

/* Query 4 */
SELECT c.email_address, o.order_id, o.order_date FROM customer AS c, orders AS o,
(SELECT customer_id, MIN(order_date) AS MD FROM orders GROUP BY customer_id) AS od
WHERE (c.customer_id = od.customer_id) 
AND (o.customer_id = od.customer_id AND o.order_date = od.md);

/* Query 5 */
SELECT product_id,product_name, list_price
FROM product WHERE product_id IN 
(SELECT product_id FROM orders GROUP BY product_id HAVING COUNT(*) > 1);

/* Query 6 */
SELECT DISTINCT last_name AS `Last_Name`, first_name `First_Name` FROM customer
WHERE customer_id IN (SELECT orders.customer_id FROM orderitems JOIN orders
ON orderitems.order_id = orders.order_id WHERE orderitems.item_price > 300);

/* Query 6 */
SELECT DISTINCT last_name AS `Last_Name`, first_name `First_Name` FROM customer
WHERE customer_id IN (SELECT orders.customer_id FROM orderitems JOIN orders USING (order_id) WHERE orderitems.item_price > 300);

/* Query 7 */
/* Display the last name, first name, and email address 
	of the customers who made the purchase 
    with order IDs 1, 2, and 3. Use a subquery. */
SELECT last_name,first_name,email_address
FROM customer
WHERE customer_id IN 
(SELECT customer_id FROM orders WHERE order_id IN (1,2,3));

/* Query 8 */
SELECT last_name `Last_Name`,first_name `First_Name`,email_address `Email_Address` FROM customer
WHERE customer_id IN (SELECT orders.customer_id FROM vendor
JOIN product USING (vendor_id) JOIN orderitems USING(product_id)
JOIN orders USING (order_id)
WHERE vendor.company_name LIKE 'H%'
);

/* Query 9 */
SELECT product_id,product_name,list_price FROM product
WHERE product_id IN 
(SELECT product_id FROM orderitems
GROUP BY product_id HAVING COUNT(product_id) > 2);