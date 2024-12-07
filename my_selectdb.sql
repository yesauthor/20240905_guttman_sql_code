/* SQL installation script
  Name: Mona                    Date Created: 12/03/24
                                           Date Modified: 12/03/24
  Purpose: Class project 3

*/

SYSTEM CLEAR;
-- Opening print statement
SELECT '' AS 'Installation Starting!!!';

SELECT USER() AS 'INSTALL USER';


-- Remove the database if it is already there
DROP DATABASE IF EXISTS my_selectdb;

/* Create the database after checking to make sure it is
  not already there
*/


-- The following line is pure Standard SQL
CREATE DATABASE IF NOT EXISTS my_selectdb;
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


-- Let's see if the database is created
SHOW DATABASES;
SELECT '' AS 'DATABASE CREATION COMPLETED';

-- Let's enter the database
USE my_selectdb;

-- table creation

DROP TABLE IF EXISTS region;

CREATE TABLE region(
    regionId           CHAR(1) NOT NULL,  -- Added NOT NULL
    regionname         VARCHAR(25),
    PRIMARY KEY(regionId)
);

DROP TABLE IF EXISTS store;

CREATE TABLE store(
    storeId            VARCHAR(3) NOT NULL,  -- Added NOT NULL
    storezip           CHAR(15),
    regionId           CHAR(1),
    PRIMARY KEY(storeId),
    FOREIGN KEY(regionId) REFERENCES region(regionId)
);

DROP TABLE IF EXISTS `customer`; -- Used backticks for reserved keywords

CREATE TABLE `customer`(
    customerId         CHAR(7) NOT NULL,  -- Added NOT NULL
    customername       VARCHAR(15),
    customerzip        CHAR(5),
    PRIMARY KEY(customerId)
);

DROP TABLE IF EXISTS category;

CREATE TABLE category(
    categoryId         CHAR(2) NOT NULL,  -- Added NOT NULL
    categoryname       VARCHAR(25),
    PRIMARY KEY(categoryId)
);


DROP TABLE IF EXISTS `vendor`;   -- Used backticks for reserved keywords

CREATE TABLE `vendor`(
    vendorId           CHAR(2) NOT NULL,  -- Added NOT NULL
    vendorname         VARCHAR(25),
    PRIMARY KEY(vendorId)
);

DROP TABLE IF EXISTS salestransaction;

CREATE TABLE salestransaction(
    tId                VARCHAR(8) NOT NULL,  -- Added NOT NULL
    customerId         CHAR(7),
    storeId            VARCHAR(3),
    tdate              DATE,
    PRIMARY KEY(tId),
    FOREIGN KEY(customerId) REFERENCES `customer`(customerId),
    FOREIGN KEY(storeId) REFERENCES store(storeId)
);

DROP TABLE IF EXISTS `product`;  -- Used backticks for reserved keywords

CREATE TABLE `product`(
    productId          CHAR(3) NOT NULL,
    productname        VARCHAR(25),
    productprice       DECIMAL(7, 2),
    vendorId           CHAR(2),
    categoryId         CHAR(2),
    PRIMARY KEY(productId),
    FOREIGN KEY(vendorId) REFERENCES `vendor`(vendorId),
    FOREIGN KEY(categoryId) REFERENCES category(categoryId)
);

DROP TABLE IF EXISTS soldvia;

CREATE TABLE soldvia(
    soldviaId          INT AUTO_INCREMENT,
    productId          CHAR(3) NOT NULL,
    tId                VARCHAR(8) NOT NULL,
    noofitems          INT,
    PRIMARY KEY(soldviaId),
    FOREIGN KEY(productId) REFERENCES `product`(productId),
    FOREIGN KEY(tId) REFERENCES salestransaction(tId)
);

-- data insertion

SELECT * FROM salestransaction; -- data in table being displayed :)


SELECT 'LINE 126' AS 'INSERTED: category';

INSERT INTO category(categoryId,categoryname)
VALUES  ('CP','Camping'),
        ('FW','Footwear');

SELECT * FROM category; -- data being shown :^)

SELECT 'LINE 130' AS 'INSERTED: region';

INSERT INTO region(regionId,regionname)
VALUES  ('C','Chicagoland'),
        ('T','Tristate');

SELECT * FROM region; -- showcasing data

SELECT 'LINE 134' AS 'INSERTED: vendor';

INSERT INTO vendor(vendorId,vendorname)
VALUES  ('PG','Pacifica Gear'),
        ('MK','Mountain King');

SELECT * FROM vendor; -- showcasing data

SELECT 'LINE 138' AS 'INSERTED: customer';

INSERT INTO customer(customerId,customername,customerzip)
VALUES  ('1-2-333','Tina','60137'),
        ('2-3-444','Tony','60611'),
        ('3-4-555','Pam','35401');

SELECT * FROM customer; -- showcasing data

SELECT 'LINE 144' AS 'INSERTED: store';

INSERT INTO store(storeId,storezip,regionId)
VALUES  ('s1','60600','C'),
        ('s2','60605','C'),
        ('s3','35400','T');

SELECT * FROM store; -- showcasing more data

-- Insert data into salestransaction
SELECT 'LINE 159' AS 'INSERTED: salestransaction';

INSERT INTO salestransaction (tId, customerId, storeId, tdate)
VALUES  ('T111', '1-2-333', 's1', '2023-01-01'),
        ('T222', '2-3-444', 's2', '2023-01-02'),
        ('T333', '3-4-555', 's3', '2023-01-03'),
        ('T444', '1-2-333', 's1', '2023-01-04'),
        ('T555', '2-3-444', 's2', '2023-01-05');

SELECT * FROM salestransaction; -- showcasing even more data

SELECT 'LINE 150' AS 'INSERTED: product';

INSERT INTO product (productId,productname,productprice,vendorId,categoryId)
VALUES  ('1X1', 'Zzz Bag', 100, 'PG', 'CP'),
        ('2X2', 'Easy Boot', 70, 'MK', 'FW'),
        ('3X3', 'Cosy Sock', 15, 'MK', 'FW'),
        ('4X4', 'Dura Boot', 90, 'PG', 'FW'),
        ('5X5', 'Tiny Tent', 150, 'MK', 'CP'),
        ('6X6', 'Biggy Tent', 250, 'MK', 'CP');

SELECT * FROM product; -- showcasing the data

SELECT 'LINE 159' AS 'INSERTED: soldvia';

INSERT INTO soldvia (productId,tId,noofitems)
VALUES  ('1X1', 'T111', 1),
        ('2X2', 'T222', 1),
        ('3X3', 'T333', 5),
        ('1X1', 'T333', 1),
        ('4X4', 'T444', 1),
        ('2X2', 'T444', 2),
        ('4X4', 'T555', 4),
        ('5X5', 'T555', 2),
        ('6X6', 'T555', 1);

SELECT * FROM soldvia; -- showcasing the data

show tables; -- to show the tables at the end when it finish runing.

SELECT '' AS 'SELECT STATEMENT';

-- select statements

SELECT productId, productname, productprice, categoryId
FROM product;

SELECT productname, productId, vendorId, categoryId, productprice
FROM product;

SELECT productId, productname, vendorId, productprice
FROM product
WHERE productId IN ('5X5', '6X6');

SELECT productId, productname, vendorId, productprice
FROM product
WHERE productId IN ('2X2', '3X3', '4X4');

SELECT 'MK' AS vendorId
UNION ALL
SELECT 'MK'
UNION ALL
SELECT 'MK'
UNION ALL
SELECT 'MK'
UNION ALL
SELECT 'PG' AS vendorId
UNION ALL
SELECT 'PG';

SELECT vendorId
FROM vendor;

SELECT productId, productname, categoryId, productprice
FROM product
WHERE productId IN ('3X3', '2X2', '4X4')
ORDER BY
    CASE productId
        WHEN '3X3' THEN 1
        WHEN '2X2' THEN 2
        WHEN '4X4' THEN 3
    END;

SELECT productId, productname, categoryId, productprice
FROM product
WHERE productId IN ('4X4', '2X2', '3X3')
ORDER BY
    CASE productId
        WHEN '4X4' THEN 1
        WHEN '2X2' THEN 2
        WHEN '3X3' THEN 3
    END;

SELECT productId, productname, categoryId, productprice
FROM product
WHERE productId IN ('1X1', '5X5', '6X6', '3X3', '2X2', '4X4')
ORDER BY
    CASE productId
        WHEN '1X1' THEN 1
        WHEN '5X5' THEN 2
        WHEN '6X6' THEN 3
        WHEN '3X3' THEN 4
        WHEN '2X2' THEN 5
        WHEN '4X4' THEN 6
    END;

SELECT productId, productname, productprice, vendorId, categoryId
FROM product
WHERE productId IN ('2X2', '4X4');

-- Closing print statement
SELECT '' AS 'Installation Completed, check for errors!!!';
