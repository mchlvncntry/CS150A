/* Michael Vincent Rayo
   Assignment 5
   Cs150A, Spring 2020
*/

/* Query 0 */
SELECT user(), current_date();
USE library;

/* Query 1 */
DROP TABLE IF EXISTS branch_staff;
DROP TABLE IF EXISTS computer_staff;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS computer;

CREATE TABLE IF NOT EXISTS staff (
    staff_id INT(10),
    fname VARCHAR(20),
    lname VARCHAR(20),
    phone VARCHAR(12),
    email VARCHAR(50),
	PRIMARY KEY (staff_id)
);

CREATE TABLE IF NOT EXISTS computer (
	serial_number INT(15),
	make VARCHAR(6),
	model VARCHAR(32),
	processor_type VARCHAR(16),
	speed DECIMAL(7,2),
	main_memory VARCHAR(16),
	disk_size VARCHAR(16),
	PRIMARY KEY (serial_number)
);

CREATE TABLE IF NOT EXISTS computer_staff (
	serial_number INT(15),
	staff_id INT(10),
	date_assigned DATE,
	FOREIGN KEY (serial_number) REFERENCES computer (serial_number),
	FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);

CREATE TABLE IF NOT EXISTS branch_staff (
	branch_id INT(8),
	contact VARCHAR(15),
	staff_id INT(10),
	FOREIGN KEY (branch_id) REFERENCES branch (branch_id),
	FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);

/* QUERY 2 */
# USE library;

INSERT INTO staff VALUES(
	10001,'Stuart', 'Anne', '206-527-0010', 'Anne.Stuart@libray.com');
INSERT INTO staff VALUES(
	10002,'Stuart', 'George', '206-527-0011', 'George.Stuart@library.com');
INSERT INTO staff VALUES(
	10004,'Stuart', 'Mary', '206-527-0012', 'Mary.Stuart@library.com');
INSERT INTO staff VALUES(
	10005,'Orange', 'William', '206-527-0013', 'William.Orange@library.com');
INSERT INTO staff VALUES(
	10006,'Matt', 'John', '206-527-0014', 'John.Griffith@library.com');
    INSERT INTO staff VALUES(
	10007,'Stuart', 'Jack', '206-527-0012', 'Jack.Stuart@library.com');
INSERT INTO staff VALUES(
	10008,'Orange', 'Chris', '206-527-0013', 'Chris.Orange@library.com');
INSERT INTO staff VALUES(
	10009,'Alexander', 'John', '206-527-0014', 'John.Alexanderh@library.com');
    
    INSERT INTO staff VALUES(
	10010,'William', 'Bradley', '206-527-0013', 'Bradley.William@library.com');
INSERT INTO staff VALUES(
	10011,'Neil', ' Simon', '206-527-0014', ' Simon.Neilh@library.com');
	
INSERT INTO computer VALUES(
		9871234, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871245, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871256, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871267, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871278, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871289, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541001, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541002, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541003, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541004, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541005, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541006, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');

INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(9871256, 10006, '2015-09-14');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(9871267, 10001, '2015-09-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(9871278, 10002, '2015-09-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
	    VALUES(9871289, 10004, '2015-09-21');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(6541001, 10005, '2015-10-14');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(6541002, 10007, '2015-10-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(6541003, 10008, '2015-10-21');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(6541004, 10009, '2015-10-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(9871234, 10011, '2015-11-14');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(9871245, 10010, '2015-11-14');

INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(91234, 10001, '510-714-8321');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(92345 , 10010, '510-987-0000 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(93456 , 10009, '510-555-9743');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(94567  , 10008, '510-666-9743 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(94567, 10007, '510-645-9743 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(95678 , 10010, '8510-111-9743 ');
INSERT INTO branch_staff (branch_id, staff_id, contact) VALUES(96789  , 10011, '510-999-9743 ');

/* Query 3 */
SELECT serial_number, model FROM computer;

/* Query 4 */
ALTER TABLE books ADD date_added DATE;
DESC books;

/* Query 5 */
ALTER TABLE staff MODIFY lname VARCHAR(30) NOT NULL;
DESCRIBE staff;

/* Query 6 */
ALTER TABLE staff ADD salary DECIMAL(7,2);

/* Query 7 */
SELECT serial_number, staff_id, date_assigned FROM computer_staff;

/* Query 8 */
ALTER TABLE books DROP COLUMN date_added;

/* Query 9 */
CREATE TABLE books_archive LIKE books;
SHOW TABLES;

/* Query 10 */
DROP TABLE IF EXISTS books_archive;
SHOW TABLES;
