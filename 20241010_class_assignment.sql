/* SQL installation script:
    Name:Mona                 Date Created: 10/10/2024
                              Date Modified: 10/10/2024
    Purpose: class assignment
*/
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS testdb_20241010;

/* Create the database after checking making sure it is 
not already there
*/

-- The following line is pure standard SQL
CREATE DATABASE IF NOT EXISTS testdb_20241010
-- The following line is unique to mySQL it is optional
-- If left out the MySQL database will take the default settings 
-- of the database
-- EXPLAIN CHARACTER SET:
-- EXPLAIN COLLATE:
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Let's see if the database is created
SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED';


-- Let's enter the database
USE testdb_20241010;


-- Let's create some tables
DROP TABLE IF EXISTS student;
CREATE TABLE student(
    student_id        INT AUTO_INCREMENT,
    first_name        VARCHAR(50) NOT NULL,
    last_name         VARCHAR(50) NOT NULL,
    phone             VARCHAR(10) NOT NULL,

    PRIMARY KEY(student_id)
);

-- Let's see if the table has been created
SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';
-- Let's create some tables
DROP TABLE IF EXISTS company;
CREATE TABLE company(
    company_id         INT    AUTO_INCREMENT,
    name               VARCHAR(50) NOT NULL,
    address            VARCHAR(100),
    email              VARCHAR(50),
    phone              VARCHAR(10),

    PRIMARY KEY(company_id)
);

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';
-- Let's create some tables
DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
    customer_id        INT   AUTO_INCREMENT,
    first_name         VARCHAR(20) NOT NULL,
    last_name          VARCHAR(20) NOT NULL,
    age                INT,
    country            VARCHAR(50),

    PRIMARY KEY(customer_id)
);

SHOW TABLES;
SELECT '' AS 'TABLE CREATION COMPLETED';

INSERT company(company_id, name, address, email, phone)
VALUES 
('auto_increment', 'Balboa Software', '475 E. Baker Street', 'customers@balboa.com', '834-4349'),
('auto_increment', 'Dynix Publishing', '7 North Plymouth St.', 'customer_service@dynix.com', '(733)-508-1603'),
('auto_increment', 'EOS International', '56 Vine Road', 'customers@eos.com', '(438)-496-9721'),
('auto_increment', 'Taylor & Francis', '73 E. High Point Road', 'customer_service@taylorfrancis.com', '222831-5041'),
('auto_increment', 'Faulkner Information Services', '132 W. 31st', 'customer_service@falkner.com', '352-5467'),
('auto_increment', 'Montgomery Fleet Equipment', '7 South Wild Horse Dr.', 'service@fleetequip.com', '919-960-5818');



-- Let's add some values

SELECT '' AS 'INSTALLATION SCRIPT COMPLETED';