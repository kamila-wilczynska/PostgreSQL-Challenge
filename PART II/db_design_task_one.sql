-- Part 2
-- Task 1
-- (Again, you may want to create a new database)

-- A second company has seen the website we designed for The Guardian 2 and have decided to employ us to build them a new e-commerce store. Let's call them Etsy 2.

-- We need to design the table(s) for this e-commerce website.

-- Here are some requirements:

-- The database needs to store information on products
-- Each product can have a single seller
-- Each seller can have multiple products
-- Each product should have a title, summary, the full product, price, and the date it was advertised
-- We should also store each seller's name, email address, password, a short bio, and the date that they joined
-- Here are some tasks:

-- Design the table(s), and which fields they should have
-- Specify the data types for each field
-- Specify any constraints (e.g. primary keys, foreign keys, unique constraints)
-- Write the SQL to create these table(s)
-- Write the SQL to insert some fake product data
-- There should be at least five sellers
-- Each seller should have between 1-5 products
-- Write the SQL queries to retrieve the following data:
-- List all product titles
-- List all product titles, with the seller's name
-- List all sellers
-- List all sellers, and a count of how many products they have
-- List all product titles for a specific seller


--seller's name, email address, password, a short bio, and the date that they joined
CREATE TABLE seller (
  id SERIAL PRIMARY KEY,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  bio VARCHAR(150),
  joined_date DATE,
  name VARCHAR(100) NOT NULL
  );


--Each product should have a title, summary, the full product, price, and the date it was advertisedgfg
CREATE TABLE product (
  id SERIAL PRIMARY KEY,
  seller_id INTEGER REFERENCES seller(id),
  title VARCHAR(100) NOT NULL,
  summary VARCHAR(200),
  price MONEY NOT NULL,
  advert_date DATE
  );


--insert data into seller
INSERT INTO seller (email, password, bio, joined_date, name)
VALUES
('john.doe@example.com', 'password123', 'Experienced seller of electronic goods.', '2022-01-15', 'John Doe'),
('jane.smith@example.com', 'securepassword', 'Specialist in home appliances.', '2022-03-22', 'Jane Smith'),
('alice.johnson@example.com', 'alicepassword', 'Fashion and accessories expert.', '2022-06-10', 'Alice Johnson');

--insert data into product
INSERT INTO product (seller_id, title, summary, price, advert_date)
VALUES
(1, 'Smartphone XYZ', 'Latest model of the XYZ smartphone.', 699.99, '2023-05-01'),
(1, 'Laptop ABC', 'High-performance laptop for gaming and work.', 1199.99, '2023-06-15'),
(2, 'Blender 3000', 'Efficient blender for smoothies and more.', 49.99, '2023-05-20'),
(3, 'Stylish Handbag', 'Trendy handbag for all occasions.', 79.99, '2023-04-25'),
(3, 'Sunglasses', 'UV protection sunglasses.', 19.99, '2023-07-10');



-- List all product titles
SELECT product.title FROM product

-- OUTPUT
-- title
-- Smartphone XYZ
-- Laptop ABC
-- Blender 3000
-- Stylish Handbag
-- Sunglasses

-- List all product titles, with the seller's name
SELECT seller.name, product.title
FROM product
JOIN seller
ON product.seller_id = seller.id;

-- OUTPUT
-- name	title
-- John Doe	Smartphone XYZ
-- John Doe	Laptop ABC
-- Jane Smith	Blender 3000
-- Alice Johnson	Stylish Handbag
-- Alice Johnson	Sunglasses

-- List all sellers
SELECT seller.name FROM seller

-- OUTPUT
-- name
-- John Doe
-- Jane Smith
-- Alice Johnson

-- List all sellers, and a count of how many products they have
SELECT seller.name,
   COUNT(product.seller_id)
FROM seller
JOIN product
  ON product.seller_id = seller.id
  GROUP BY 1;

-- OUTPUT
-- name			count
-- John Doe			2
-- Alice Johnson	2
-- Jane Smith		1


-- List all product titles for a specific seller
SELECT product.title
FROM product
JOIN seller
  ON product.seller_id = seller.id
  WHERE seller.name = 'Jane Smith';

-- OUTPUT
-- title
-- Blender 3000




