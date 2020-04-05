/* 
Michael Vincent Rayo
Assignment 10
CS150A, Spring 2020
*/

/* Query 0 */
USE bookstore;

/* Query 1 */
CREATE OR REPLACE VIEW customer_address
AS
SELECT c.customer_id,
       c.email_address,
       c.last_name,
       c.first_name,
       a.line1    AS ship_line1,
       a.line2    AS ship_line2,
       a.city     AS ship_city,
       a.state    AS ship_state,
       a.zip_code AS ship_zip
FROM customer AS c
         JOIN address AS a ON c.customer_id = a.customer_id;

SELECT customer_id, last_name, first_name, ship_city, ship_state
FROM customer_address;

/* Query 2 */
UPDATE customer_address
SET ship_line1 = '1990 Westwood Blvd'
WHERE customer_id = 11119;

/* Query 3 */
CREATE OR REPLACE VIEW product_summary AS
SELECT DISTINCT oi.product_id,
                COUNT(oi.order_id) OVER (PARTITION BY o.order_id) AS Order_Count,
                SUM(item_price) OVER (PARTITION BY o.order_id) AS Order_Total
FROM orders AS o
         JOIN orderitems AS oi ON o.order_id = oi.order_id
         JOIN product AS p ON p.product_id = oi.product_id;

SELECT *
FROM product_summary;

/* Query 4 */
CREATE OR REPLACE VIEW cheap_products AS
SELECT *
FROM product
WHERE list_price < 50
WITH CHECK OPTION;

SELECT *
FROM cheap_products;

/* Query 5 */
INSERT INTO cheap_products (product_id, category_id, product_code, product_name,
                            description, list_price, discount_percent, date_added, vendor_id)
VALUES (17888, 41, 'book_db', 'Fundamental of Database Systems',
        'Fundamental of Database Systems Elmasri', 45.99,
        20.00, STR_TO_DATE('2015-06-01 11:12:59', '%Y-%m-%d %H:%i:%s'), 2);

/* Query 6 */
CREATE OR REPLACE VIEW contact AS
SELECT contact_fname AS 'Contact First Name', phone AS 'Phone #'
FROM vendor
UNION ALL
SELECT 0, '0'
WHERE 1 = 0;

SELECT *
FROM contact;

/* Query 7 */
CREATE OR REPLACE VIEW order_items
AS
SELECT o.order_id,
       o.order_date,
       o.tax_amount,
       o.ship_date,
       oi.item_price,
       oi.discount_amount,
       (oi.item_price - oi.discount_amount) AS final_price,
       oi.quantity,
       (oi.item_price - oi.discount_amount) * oi.quantity   AS item_total,
       p.product_name
FROM orders AS o
         JOIN orderitems AS oi ON o.order_id = oi.order_id
         JOIN product as p ON p.product_id = oi.product_id;

SELECT *
FROM order_items;

/* Query 8 */
CREATE OR REPLACE VIEW reorder_info
AS
SELECT p.product_id    AS 'Product ID',
       p.product_name  AS 'Product Name',
       v.contact_fname AS `Contact First Name`,
       v.phone         AS `Phone #`
FROM product AS p
         JOIN vendor AS v ON p.vendor_id = v.VENDOR_id;

SELECT *
FROM reorder_info;

/* Query 9 */
SELECT card_number,
       (SELECT char_length(card_number)) AS card_number_length,
       (SELECT RIGHT(card_number,4)) AS last_four_digits,
       CONCAT('XXXX-XXXX-XXXX-',(SELECT RIGHT(card_number,4))) AS formatted_number
FROM orders;





