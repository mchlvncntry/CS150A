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
\. /Users/mvr/Desktop/CCSFSemesters/2020Spring/CS150A/Assignments/insert_data_computer.sql

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
