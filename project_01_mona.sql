/* SQL installation script
  Name: Mona Diaz                   Date Created: 12/01/24
                                           Date Modified: 12/02/24
  Purpose: Database project for class :)

*/

SYSTEM CLEAR;
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';

SELECT USER() AS 'INSTALL USER';


-- dropping databaset
DROP DATABASE IF EXISTS my_project_db;



-- Database creation
CREATE DATABASE IF NOT EXISTS my_project_db;
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


-- database created
SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED';


-- using the database
USE my_project_db;


-- dropping all tables
SELECT '' AS 'DROPPING ALL TABLES';

DROP TABLE IF EXISTS soldvia;
DROP TABLE IF EXISTS salestransaction;
DROP TABLE IF EXISTS product;  
DROP TABLE IF EXISTS vendor;   
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS customer; 
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS region;

-- creating tables

SELECT '' AS 'TABLE CREATION STARTED';

CREATE TABLE region(
    regionId           CHAR(1) NOT NULL,  
    regionname         VARCHAR(25),
    PRIMARY KEY(regionId)
);

CREATE TABLE store(
    storeId            VARCHAR(3) NOT NULL,  
    storezip           CHAR(15),
    regionId           CHAR(1),
    PRIMARY KEY(storeId),
    FOREIGN KEY(regionId) REFERENCES region(regionId)
);

CREATE TABLE customer(
    customerId         CHAR(7) NOT NULL,  
    customername       VARCHAR(15),
    customerzip        CHAR(5),
    PRIMARY KEY(customerId)
);

CREATE TABLE category(
    categoryId         CHAR(2) NOT NULL,  
    categoryname       VARCHAR(25),
    PRIMARY KEY(categoryId)
);

CREATE TABLE vendor(
    vendorId           CHAR(2) NOT NULL,  
    vendorname         VARCHAR(25),
    PRIMARY KEY(vendorId)
);

CREATE TABLE salestransaction(
    tId                VARCHAR(8) NOT NULL,  
    customerId         CHAR(7),
    storeId            VARCHAR(3),
    tdate              DATE,
    PRIMARY KEY(tId),
    FOREIGN KEY(customerId) REFERENCES customer(customerId),
    FOREIGN KEY(storeId) REFERENCES store(storeId)
);

CREATE TABLE product(
    productId          CHAR(3) NOT NULL,
    productname        VARCHAR(25),
    productprice       DECIMAL(7, 2),
    vendorId           CHAR(2),
    categoryId         CHAR(2),
    PRIMARY KEY(productId),
    FOREIGN KEY(vendorId) REFERENCES vendor(vendorId),
    FOREIGN KEY(categoryId) REFERENCES category(categoryId)
);

CREATE TABLE soldvia(
    soldviaId          INT AUTO_INCREMENT,
    productId          CHAR(3),
    tId                VARCHAR(8),
    noofitems          INT,
    PRIMARY KEY(soldviaId),
    FOREIGN KEY(productId) REFERENCES product(productId),
    FOREIGN KEY(tId) REFERENCES salestransaction(tId)
);

SHOW TABLES;

SELECT '' AS 'TABLE CREATION COMPLETED';

-- Closing print statement
SELECT '' AS 'Installation Completed, check for errors!!!';
