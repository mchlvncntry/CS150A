/* Michael Vincent Rayo
   Assignment 8
   Cs150A, Spring 2020
*/

/* Query 0 */
SELECT user(), current_date();
USE bookstore;

/* Query 1 */
SELECT COUNT(*), SUM(tax_amount) FROM orders;

/* Query 2 */
SELECT product_id, COUNT(product_id) AS NumOrders 
FROM orderitems GROUP BY product_id ORDER BY product_id ASC;

/* Query 3 */
SELECT category_name, COUNT(category_id) AS product_count,
MAX(list_price) AS most_expensive_product 
FROM product JOIN category USING (category_id) 
GROUP BY category_name ORDER BY product_count DESC;

/* Query 4 */
SELECT email_address, SUM(item_price*quantity) AS item_price_total,
SUM(discount_amount * quantity) AS discount_amount_total 
FROM customer JOIN (orders, orderitems) 
ON (customer.customer_id = orders.customer_id 
AND orders.order_id = orderitems.order_id) 
GROUP BY email_address 
ORDER BY item_price_total DESC;

/* Query 5 */
SELECT email_address, COUNT(orders.order_id) AS order_count, 
SUM((item_price - discount_amount) * quantity) AS order_total 
FROM customer JOIN (orders, orderitems) 
ON (customer.customer_id = orders.customer_id AND orders.order_id = orderitems.order_id) 
GROUP BY email_address HAVING order_count > 1 ORDER BY order_total DESC;

/* Query 6 */
SELECT email_address, COUNT(orders.order_id) AS order_count, 
SUM((item_price - discount_amount) * quantity) AS order_total 
FROM customer JOIN (orders, orderitems) 
ON (customer.customer_id = orders.customer_id AND orders.order_id = orderitems.order_id) 
WHERE orderitems.item_price > 400 GROUP BY email_address HAVING order_count > 1;

/* Query 7 */
SELECT email_address, COUNT(product_id) AS number_of_products 
FROM customer JOIN (orders, orderitems) 
ON (customer.customer_id = orders.customer_id AND orders.order_id = orderitems.order_id) 
GROUP BY email_address HAVING number_of_products > 1;

/* Query 8 */
SELECT vendor_id, COUNT(*) FROM product JOIN vendor 
USING (vendor_id) WHERE list_price >= 100 GROUP BY vendor_id;

/* Query 9 */
SELECT vendor_id, category_id, COUNT(*) AS `number of products`, AVG(list_price) AS `Average price`
FROM product JOIN vendor USING (vendor_id) GROUP BY vendor_id, category_id 
HAVING `number of products` > 1 ORDER BY vendor_id;

/* Query 10 */
SELECT COUNT(*) FROM product JOIN category 
USING (category_id) WHERE category_name = 'Printer';

