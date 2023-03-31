DROP database if exists Ecommerce_Management;
CREATE database if not exists Ecommerce_Management;
USE Ecommerce_Management;

DROP TABLE if exists Cart;
CREATE TABLE Cart
(
    Cart_id VARCHAR(7) NOT NULL,
    PRIMARY KEY(Cart_id)
);

DROP TABLE if exists Customer;
CREATE TABLE Customer
(
    Customer_id VARCHAR(6) NOT NULL,
    Membership_id VARCHAR(10) DEFAULT NULL,
    Name VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    ZipCode INT(5) NOT NULL,
    Phone_number VARCHAR(16)  NOT NULL,
    PRIMARY KEY (Customer_id),
    Cart_id VARCHAR(7) NOT NULL,
    FOREIGN KEY(Cart_id) REFERENCES Cart(Cart_id)
);

DROP TABLE if exists Seller;
CREATE TABLE Seller
(
    Seller_id VARCHAR(6) NOT NULL,
    Licensed VARCHAR(3) DEFAULT 'YES',
    Name VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    PRIMARY KEY (Seller_id)
);

DROP TABLE if exists Seller_Phone_num;
CREATE TABLE Seller_Phone_num
(
    Phone_num VARCHAR(16) NOT NULL,
    Seller_id VARCHAR(6) NOT NULL,
    PRIMARY KEY (Phone_num, Seller_id),
    FOREIGN KEY (Seller_id) REFERENCES Seller(Seller_id)
    ON DELETE CASCADE
);

DROP TABLE if exists Payment;
CREATE TABLE Payment
(
    payment_id VARCHAR(7) NOT NULL,
    payment_date DATE NOT NULL,
    Payment_type VARCHAR(10) NOT NULL,
    Customer_id VARCHAR(6) NOT NULL,
    Cart_id VARCHAR(7) NOT NULL,
    PRIMARY KEY (payment_id),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id),
    total_amount DECIMAL(10, 2)
);

DROP TABLE if exists Prodcut;
CREATE TABLE Product
(
    Product_id VARCHAR(20) NOT NULL,
    Type VARCHAR(20) NOT NULL,
    Color VARCHAR(15) NOT NULL,
    P_Size VARCHAR(2) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Commission INT(2) NOT NULL,
    Cost INT(5) NOT NULL,
    Quantity INT(2) NOT NULL,
    Seller_id VARCHAR(6),
    brand VARCHAR(20),
    material VARCHAR(20),
    PRIMARY KEY (Product_id),
    FOREIGN KEY (Seller_id) REFERENCES Seller(Seller_id)
    ON DELETE SET NULL
);

DROP TABLE if exists Cart_item;
CREATE TABLE Cart_item
(
    Quantity_wished INT(1) NOT NULL,
    Date_Added DATE NOT NULL,
    Cart_id VARCHAR(7) NOT NULL,
    Product_id VARCHAR(7) NOT NULL,
    shopped VARCHAR(3) DEFAULT 'NO',
    FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
    Primary key(Cart_id,Product_id)
);

DROP TABLE if exists Reviews;
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT,
    customer_id VARCHAR(6) NOT NULL,
    product_id VARCHAR(7) NOT NULL,
    rating INT NOT NULL,
    comment TEXT,
    PRIMARY KEY (review_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(Product_id)
);

DROP TABLE if exists Wishlist;
CREATE TABLE Wishlist
(
    customer_id VARCHAR(6) NOT NULL,
    product_id VARCHAR(7) NOT NULL,
    date_added DATE NOT NULL,
    PRIMARY KEY (customer_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Cart VALUES('crt1011'),
('crt1012'),
('crt1013'),
('crt1014'),
('crt1015'),
('crt1016');


INSERT INTO Customer VALUES('cid100', 'ABCM1235', 'Sneha', '4601 NW 6TH ST, MIAMI FL', 33101, '(746)-550-3890', 'crt1011');
INSERT INTO Customer VALUES('cid101', 'QRTE7894', 'Marwan', '4601 NW 6TH ST, MIAMI FL', 33101,'(305)-555-3890', 'crt1012');
INSERT INTO Customer VALUES('cid102', 'JKIY7584', 'Suhana', '16 W 32ND ST, NEW YORK NY', 10001,'(213)-789-3890', 'crt1013');
INSERT INTO Customer VALUES('cid103', 'YYUU7123', 'Mariam', '1152 WAXWING DR,VISTA CA ', 92083,'(213)-555-6757', 'crt1014');
INSERT INTO Customer VALUES('cid104', DEFAULT , 'Kabir', '363 AVENEL ST APT C, AVENEL NJ ', 07001,'(908)-607-3890', 'crt1015');
INSERT INTO Customer VALUES('cid105', 'CVBM6789', 'Naay', '1 W GRANT ST ,ORLANDO FL', 32806,'(305)-585-3890', 'crt1016');

INSERT INTO Seller VALUES('sid100', DEFAULT, 'Akash', 'California 90212');
INSERT INTO Seller VALUES('sid101', DEFAULT, 'Jishan', 'New York 10002');
INSERT INTO Seller VALUES('sid102', DEFAULT, 'Rabih', 'Miami FL 33106');
INSERT INTO Seller VALUES('sid103', DEFAULT, 'Jabber', 'New Jersey 08701');
INSERT INTO Seller VALUES('sid104', DEFAULT, 'Ayan', 'New York 10005');

INSERT INTO Product 
VALUES('pid1001', 'dress', 'pink', 'M', 'F', 15, 250, 1, 'sid101', 'Mango', 'Polyester'),
      ('pid1008', 'dress', 'red', 'M', 'F', 15, 100, 1, 'sid101', 'Mango', 'Cotton'),
	  ('pid1002', 'shirt', 'blue', 'L', 'M', 15, 80, 1, 'sid100', 'Levis', 'Cotton'),
	  ('pid1003', 'jeans', 'blue', 'L', 'M', 15, 50, 1, 'sid100', 'Levis', 'Cotton'),
	  ('pid1004', 'Wrap dress', 'blue', 'L', 'F', 15, 90, 1, 'sid103', 'Zara', 'Cotton'),
	  ('pid1005', 'Thobe', 'blue', 'L', 'M', 10, 120, 1, 'sid104', 'alqamees', 'Linen'),
      ('pid1006', 'Thobe', 'beige', 'M', 'M',10, 125, 1, 'sid104', 'alqamees', ''),
	  ('pid1007', 'Maxi dress', 'lavender', 'M', 'F', 15, 70, 1, 'sid102', 'Veiled', 'Cotton'),
	  ('pid1009', 'Satin dress', 'brown', 'M', 'F', 15, 170, 1, 'sid101', 'Mango', 'Polyester');
       
      

INSERT INTO Seller_Phone_num VALUES('(213)-555-3890', 'sid100');
INSERT INTO Seller_Phone_num VALUES('(919)-530-7688', 'sid101');
INSERT INTO Seller_Phone_num VALUES('(746)-590-6790', 'sid102');
INSERT INTO Seller_Phone_num VALUES('(646)-890-3890', 'sid103');
INSERT INTO Seller_Phone_num VALUES('(646)-634-3890', 'sid104');

INSERT INTO Cart_item VALUES(1, '2023-10-10', 'crt1011', 'pid1001', 'Y');
INSERT INTO Cart_item VALUES(1, '2023-01-04', 'crt1011', 'pid1008', 'Y');
INSERT INTO Cart_item VALUES(2, '2023-01-15', 'crt1012', 'pid1006', 'Y');
INSERT INTO Cart_item VALUES(1, '2023-02-22', 'crt1014', 'pid1005', 'N');
INSERT INTO Cart_item VALUES(1, '2023-03-13', 'crt1012', 'pid1005', 'Y');
INSERT INTO Cart_item VALUES(1, '2023-03-22', 'crt1016', 'pid1009', 'Y');
INSERT INTO Cart_item VALUES(1, '2023-03-23', 'crt1015', 'pid1002', 'Y');
INSERT INTO Cart_item VALUES(1, '2023-04-22', 'crt1013', 'pid1003', 'Y');
INSERT INTO Cart_item VALUES(1, '2023-06-12', 'crt1013', 'pid1007', 'Y');
INSERT INTO Cart_item VALUES(1, '2023-05-24', 'crt1014', 'pid1004', 'Y');

INSERT INTO Payment VALUES('pmt1001', '2023-10-10', 'online', 'cid100', 'crt1011', NULL);
INSERT INTO Payment VALUES('pmt1002', '2023-01-04', 'online', 'cid100', 'crt1011', NULL);
INSERT INTO Payment VALUES('pmt1003', '2023-03-15', 'online', 'cid101', 'crt1012', NULL);
INSERT INTO Payment VALUES('pmt1004', '2023-03-13', 'online', 'cid101', 'crt1012', NULL);
INSERT INTO Payment VALUES('pmt1005', '2023-04-22', 'online', 'cid102', 'crt1013', NULL);
INSERT INTO Payment VALUES('pmt1006', '2023-06-12', 'online', 'cid102', 'crt1013', NULL);
INSERT INTO Payment VALUES('pmt1007', '2023-05-24', 'online', 'cid103', 'crt1014', NULL);
INSERT INTO Payment VALUES('pmt1008', '2023-03-23', 'online', 'cid104', 'crt1015', NULL);
INSERT INTO Payment VALUES('pmt1009', '2023-03-22', 'online', 'cid105', 'crt1016', NULL);

INSERT INTO Reviews (customer_id, product_id, rating, comment)
VALUES ('cid100', 'pid1001', 4, 'Great product, but could be more comfortable.');

INSERT INTO Reviews (customer_id, product_id, rating, comment)
VALUES ('cid100', 'pid1002', 5, 'Amazing quality, highly recommended!');

INSERT INTO Reviews (customer_id, product_id, rating, comment)
VALUES ('cid101', 'pid1005', 5, 'My wife loved it');

INSERT INTO Reviews (customer_id, product_id, rating, comment)
VALUES ('cid102', 'pid1003', 3, 'Okay product, not worth the price.');

INSERT INTO Reviews (customer_id, product_id, rating, comment)
VALUES ('cid103', 'pid1004', 5, 'Beautiful and fits perfect');

INSERT INTO Reviews (customer_id, product_id, rating, comment)
VALUES ('cid105', 'pid1009', 5, 'Loved it ');

INSERT INTO Reviews (customer_id, product_id, rating, comment)
VALUES ('cid104', 'pid1002', 5, 'Looks greate ');
-- Customer wants to see details of products in the cart:
SELECT p.*
FROM Product p
WHERE p.Product_id IN (
    SELECT ci.Product_id
    FROM Cart_item ci
    WHERE ci.Cart_id IN (
        SELECT c.Cart_id
        FROM Customer c
        WHERE c.Customer_id = 'cid100'
    ) AND ci.shopped = 'NO'
);
-- Customer wants to see order history:
SELECT ci.Product_id, ci.Quantity_wished
FROM Cart_item ci
WHERE ci.shopped = 'Y' AND ci.Cart_id IN (
    SELECT c.Cart_id
    FROM Customer c
    WHERE c.Customer_id = 'cid101'
);

-- Customer wants to see filtered products based on size, gender, and type:
SELECT product_id, color, cost, seller_id
FROM product
WHERE type = 'jeans' AND p_size = '32' AND gender = 'F' AND quantity > 0;

-- Modify the cart (example: update the quantity of a product in the cart):
UPDATE cart_item
SET Quantity_wished = 4
WHERE product_id = 'pid1001' AND Cart_id IN (
    SELECT cart_id
    FROM Customer
    WHERE Customer_id = 'cid100'
);

-- Seller stops selling a product:
UPDATE product
SET seller_id = NULL
WHERE seller_id = 'sid100';
-- Admin wants to see the products purchased on a particular date:
SELECT ci.product_id
FROM cart_item ci
JOIN payment p ON ci.cart_id = p.cart_id
WHERE ci.shopped = 'Y' AND p.payment_date = '2018-12-12';

-- Products sold on a particular date:
SELECT COUNT(ci.product_id) count_pid, p.payment_date
FROM cart_item ci
JOIN payment p ON ci.cart_id = p.cart_id
WHERE ci.shopped = 'Y'
GROUP BY p.payment_date;
SELECT SUM(quantity_wished * cost) total_payable
FROM product p
JOIN cart_item c ON p.product_id = c.product_id
WHERE c.product_id IN (
    SELECT product_id
    FROM cart_item
    WHERE cart_id IN (
        SELECT Cart_id
        FROM customer
        WHERE customer_id = 'cid101'
    ) AND shopped = 'N'
);

-- Customer wants to know the total price in the cart:
SELECT p.*, SUM(ci.Quantity_wished) AS total_sold
FROM Cart_item ci
JOIN Product p ON ci.Product_id = p.Product_id
WHERE ci.shopped = 'Y'
GROUP BY p.Product_id
ORDER BY total_sold DESC;
-- Show the details of customers who haven't purchased anything:
SELECT * 
FROM customer 
WHERE customer_id NOT IN (
    SELECT customer_id 
    FROM Payment
);

-- Find the total profit of the website from sales:
SELECT SUM(quantity_wished * cost * commission / 100) total_profit
FROM product p
JOIN cart_item c ON p.product_id = c.product_id
WHERE shopped = 'Y';

-- List products by popularity (most sold products first):
SELECT p.*, SUM(ci.Quantity_wished) AS total_sold
FROM Cart_item ci
JOIN Product p ON ci.Product_id = p.Product_id
WHERE ci.shopped = 'Y'
GROUP BY p.Product_id
ORDER BY total_sold DESC;

-- List top 5 customers by total purchase amount:
SELECT py.Customer_id, SUM(p.Cost * ci.Quantity_wished) AS total_purchase
FROM Payment py
JOIN Cart_item ci ON py.Cart_id = ci.Cart_id
JOIN Product p ON ci.Product_id = p.Product_id
GROUP BY py.Customer_id
ORDER BY total_purchase DESC
LIMIT 5;

-- stored procedure that returns the type of product with the cost less than the given cost:
DELIMITER //
CREATE PROCEDURE cost_filter(IN given_cost DECIMAL(10,2), IN given_type VARCHAR(255))
BEGIN
    SELECT product_id, cost, type
    FROM product
    WHERE cost < given_cost AND type = given_type;
END //
DELIMITER ;
CALL cost_filter(500, 'jeans');
SET GLOBAL log_bin_trust_function_creators = 1;
-- function that returns the total number of products a particular seller sells:
DELIMITER //
CREATE FUNCTION totalProducts(sId VARCHAR(255)) RETURNS INT
BEGIN
  DECLARE total_products INT;

  SELECT COUNT(*) INTO total_products
  FROM product
  WHERE seller_id = sId;

  RETURN total_products;
END //
DELIMITER ;

SELECT totalProducts('sid100') as total_products;


