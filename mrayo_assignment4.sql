/* Michael Vincent Rayo
   Assignment 4
   CS150A, Spring 2020
*/

/* Query 0 */
SELECT user(), current_date();

/* Query 1 */
CREATE TABLE jobs (
    job_id INT(5) PRIMARY KEY,
    job_title VARCHAR(255),
	min_salary INT(8),
    max_salary INT(10)
)ENGINE = INNODB;

/* Query 2 */
insert into jobs(job_id, job_title, min_salary, max_salary)
values
 (1, 'President', 100000, 100000)
, (2, 'Marketing', 5000, 75000)
, (4, 'Sales Manager', 15000, 60000)
, (8, 'Sales Rep', 10000, 30000)
, (16, 'Programmer', 60000, 120000)
, (32, 'Code Debugger', 60000, null)
, (64, 'DBA', 60000, null)
, (128, 'RD', 60000, null)
;

/* Query 3 */
ALTER TABLE jobs
ADD date_added DATE;

/* Query 4 */
SELECT * FROM jobs;

/* Query 5 */
DESC jobs;

DESCRIBE jobs;

/* Query 6 */
ALTER TABLE jobs DROP COLUMN date_added;

/* Query 7 */
ALTER TABLE jobs RENAME jobs_backup;

/* Query 8 */
SHOW TABLES;

/* Query 9 */
DROP TABLE jobs_backup;

/* Query 10 */
ALTER TABLE store
ADD phone_number INT(10);

/* Query 11 */
ALTER TABLE store DROP COLUMN phone_number;
