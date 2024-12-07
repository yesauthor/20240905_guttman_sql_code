-- Opening print statement
SELECT '' AS 'Installation Starting!!!';
-- Remove the database if it is already there
DROP DATABASE IF EXISTS 20240924_testdb;

/* Create the database after checking making sure it is 
not already there
*/

-- The following line is pure standard SQL
CREATE DATABASE 20240924_testdb;

-- Let's see if the databse is created
SHOW DATABASES;
SELECT '' AS '###############################';

-- Let's enter the database
USE 20240924_testdb;

-- Let's create some tables

DROP TABLE IF EXISTS supplier;

CREATE TABLE supplier(
    Id               INT        AUTO_INCREMENT,
    CompanyName      VARCHAR(255),
    ContactName      VARCHAR(30),
    City             VARCHAR(15),
    Country          VARCHAR(15),
    Phone            VARCHAR(24),
    Fax              VARCHAR(24),

    PRIMARY KEY(Id)
);

DROP TABLE IF EXISTS customer;

CREATE TABLE customer(
    Id               INT        AUTO_INCREMENT,
    FirstName        VARCHAR(20),
    LastName         VARCHAR(30),
    City             VARCHAR(15),
    Country          VARCHAR(15),
    Phone            VARCHAR(24),

    PRIMARY KEY(Id)
);

DROP TABLE IF EXISTS product;

CREATE TABLE product(
    Id               INT         AUTO_INCREMENT,
    ProductName      VARCHAR(40),
    SupplierId       INT,
    UnitPrice        DECIMAL(10,4),
    Package          VARCHAR(50),
    IsDiscontinued   ENUM('Y','N')    DEFAULT 'N',

    PRIMARY KEY(Id),
    FOREIGN KEY(SupplierId) REFERENCES supplier(Id)
);

DROP TABLE IF EXISTS order;

CREATE TABLE order(
    Id               INT         AUTO_INCREMENT,
    OrderDate        DATE,
    CustomerId       INT,
    TotalAmount      DECIMAL(10,4),

    PRIMARY KEY(Id),
    FOREIGN KEY(CustomerId) REFERENCES customer(Id)
);

DROP TABLE IF EXISTS orderitem;

CREATE TABLE orderitem(
    Id               INT            AUTO_INCREMENT,
    OrderId          INT,
    ProductId        INT,
    UnitPrice        DECIMAL(10,4),
    Quantity         INT,

    PRIMARY KEY(Id),
    FOREIGN KEY(OrderId) REFERENCES order(Id),
    FOREIGN KEY(ProductId) REFERENCES product(Id),
    FOREIGN KEY(UnitPrice) REFERENCES product(UnitPrice)
);




-- Closing print statement
SELECT '' AS 'Installation Completed, check for errors!!!';