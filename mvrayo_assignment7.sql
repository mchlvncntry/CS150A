/* 
	Michael Vincent Rayo
	Assignment 7
	CS 150A, Spring 2020
*/

/* Query 0 */
SELECT user(), current_date();
USE bookstore;

/* Query 1 */
SELECT category_name, product_name, list_price 
FROM category JOIN product
USING (category_id) ORDER BY category_name, product_name ASC;

/* Alternate for Query 1 */
/* 
SELECT category_name, product_name, list_price 
FROM category AS c JOIN product as p
ON c.category_id = p.category_id ORDER BY category_name, product_name ASC;
*/

/* Query 2 */
SELECT first_name, last_name, line1, city, state, zip_code 
FROM customer JOIN address USING (customer_id) 
WHERE email_address = 'heatheresway@mac.com';

/* Query 3 */
SELECT first_name,last_name,line1,city,state,zip_code 
FROM customer AS customerdata
JOIN address AS addressdata 
ON (customerdata.shipping_address_id = addressdata.address_id);

/* Query 4 */
SELECT last_name,first_name,order_date,product_name,item_price,quantity
FROM customer as c JOIN (orders AS o, orderitems AS oi, product AS p)
ON (c.customer_id = o.customer_id AND o.order_id = oi.order_id AND oi.product_id = p.product_id)
ORDER BY last_name, order_date;

/* Query 5 */
SELECT DISTINCT p1.product_name,p2.list_price FROM product AS p1
JOIN product as p2 ON (p1.list_price = p2.list_price AND p1.product_id <> p2.product_id)
ORDER BY product_name;

/* Query 6 */
SELECT product_id, product_name, list_price, company_name, category_name
FROM product AS p JOIN (vendor AS v, category AS c)
ON p.vendor_id = v.vendor_id AND p.category_id = c.category_id
ORDER BY product_id;

/* Query 7 */
SELECT product_id,product_name,list_price FROM product AS p
JOIN category AS c ON p.category_id = c.category_id
WHERE category_name = 'Computer' ORDER BY product_id;

/* Query 8 */
SELECT o.order_id,order_date,product_name,quantity,(quantity*item_price) 
FROM orders AS o JOIN (orderitems AS oi, product AS p)
ON o.order_id = oi.order_id AND p.product_id = oi.product_id ORDER BY order_id;

/* Query 9 */
SELECT c.first_name, c.last_name,o.order_id,o.order_date,o.ship_date
FROM customer AS c JOIN orders AS o
ON c.customer_id = o.customer_id WHERE o.ship_date
IS NULL ORDER BY o.order_date;

/* Query 10 */
SELECT c.first_name,c.last_name FROM customer AS c 
JOIN (orderitems as oi, orders AS o)
ON c.customer_id = o.customer_id AND o.order_id = oi.order_id
WHERE oi.item_price > 1300;

/* Query 11 */
SELECT product_name from product AS p
JOIN (customer as C,orders as o,orderitems as oi)
ON o.customer_id = c.customer_id AND p.product_id = oi.product_id
AND oi.order_id = o.order_id
WHERE c.first_name = 'Christine' AND c.last_name = 'Brown';

/* Query 12 */
SELECT last_name,first_name,c.customer_id FROM customer AS c
JOIN (orders AS o,product AS p,orderitems as oi)
ON o.customer_id = c.customer_id AND p.product_id = oi.product_id
AND oi.order_id = o.order_id
WHERE p.product_id = 2234;


