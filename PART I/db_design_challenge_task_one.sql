-- TechNative database design challenge
-- Part 1
-- Task 1
-- We have been asked to design a database for a new website - a blog for a well known company. Let's call them The Guardian 2.

-- We need to design the table(s) for this blog.

-- Here are some requirements:

-- The database needs to store information on blog posts
-- Each blog post can have a single author
-- Each author can write multiple blog posts
-- Each blog post should have a title, summary, the full blog post, and the date it was written
-- We should also store each author's name, email address, password, a short bio, and the date that they joined
-- Here are some tasks:

-- Design the table(s), and which fields they should have
-- Specify the data types for each field
-- Specify any constraints (e.g. primary keys, foreign keys, unique constraints)
-- Write the SQL to create these table(s)
-- Write the SQL to insert some fake blog data
-- There should be at least five authors
-- Each author should have written between 1-5 blog posts
-- Write the SQL queries to retrieve the following data:
-- List all blog post titles
-- List all blog post titles, with the author's name
-- List all authors
-- List all authors, alphabetically
-- List all authors, and a count of how many blogs they have created
-- List all blog posts for a specific author
-- List all blog posts, sorted by the oldest first


-- blog and author tables created using GUI

-- Add columns to the tables - didnt add the primary key as it exists already when table created

ALTER TABLE author 
ADD COLUMN id SERIAL PRIMARY KEY,
ADD COLUMN author_name VARCHAR(50),
ADD COLUMN email VARCHAR(50),
ADD COLUMN password VARCHAR(50),
ADD COLUMN bio VARCHAR(250),
ADD COLUMN joined_date DATE;

ALTER TABLE blog 
ADD COLUMN id SERIAL PRIMARY KEY,
ADD COLUMN title VARCHAR(50),
ADD COLUMN summary VARCHAR(200),
ADD COLUMN post TEXT,
ADD COLUMN posted_date DATE;

--Add foreign key to blog table to connect it with author table
ALTER TABLE blog 
ADD COLUMN author_id INTEGER REFERENCES author(id);

-- Insert authors
INSERT INTO author (author_name, email, password, bio, joined_date) VALUES
('John Smith', 'john.smith@example.com', 'johnpassword123', 'John is a tech enthusiast and software developer.', '2023-01-15'),
('Emily Johnson', 'emily.johnson@example.com', 'emilypassword123', 'Emily is a writer and blogger with a passion for storytelling.', '2023-02-10'),
('Michael Brown', 'michael.brown@example.com', 'michaelpassword123', 'Michael loves to write about travel and adventure.', '2023-03-20'),
('Jessica Davis', 'jessica.davis@example.com', 'jessicapassword123', 'Jessica is a professional chef who shares her recipes and cooking tips.', '2023-04-25'),
('David Wilson', 'david.wilson@example.com', 'davidpassword123', 'David is an entrepreneur and business consultant.', '2023-05-30');


-- Insert blog posts for each author
-- John Smith (author_id = 1)
INSERT INTO blog (title, summary, post_content, posted_date, author_id) VALUES
('Introduction to SQL', 'A beginner''s guide to SQL.', 'SQL is a standard language for accessing databases...', '2023-06-01', 1),
('Advanced SQL Techniques', 'Dive deeper into SQL.', 'In this post, we will explore advanced SQL techniques...', '2023-06-05', 1);

-- Emily Johnson (author_id = 2)
INSERT INTO blog (title, summary, post_content, posted_date, author_id) VALUES
('The Art of Storytelling', 'How to captivate your audience.', 'Storytelling is an ancient art form that...', '2023-06-10', 2),
('Writing Tips for Beginners', 'Get started with writing.', 'Writing can be a daunting task, but with these tips...', '2023-06-12', 2),
('Creating Engaging Content', 'Keep your readers hooked.', 'Engaging content is key to keeping your audience...', '2023-06-15', 2);

-- Michael Brown (author_id = 3)
INSERT INTO blog (title, summary, post_content, posted_date, author_id) VALUES
('Top Travel Destinations', 'Places you must visit.', 'Here are some of the top travel destinations...', '2023-06-20', 3);

-- Jessica Davis (author_id = 4)
INSERT INTO blog (title, summary, post_content, posted_date, author_id) VALUES
('10 Easy Recipes for Beginners', 'Simple recipes to start cooking.', 'Cooking can be easy and fun with these simple recipes...', '2023-06-25', 4);

-- David Wilson (author_id = 5)
INSERT INTO blog (title, summary, post_content, posted_date, author_id) VALUES
('Starting Your Own Business', 'Steps to start a business.', 'Starting a business can be challenging but rewarding...', '2023-07-05', 5),
('Business Strategies for Success', 'Achieve success in business.', 'Successful businesses often follow these key strategies...', '2023-07-07', 5);



-- Write the SQL queries to retrieve the following data:
-- List all blog post titles
SELECT title FROM blog;

-- OUTPUT
-- Introduction to SQL
-- Advanced SQL Techniques
-- The Art of Storytelling
-- Writing Tips for Beginners
-- Creating Engaging Content
-- Top Travel Destinations
-- 10 Easy Recipes for Beginners
-- The Best Desserts to Try
-- Healthy Cooking Tips
-- Starting Your Own Business
-- Business Strategies for Success

-- List all blog post titles, with the author's name
SELECT author.author_name,
blog.title 
FROM author
JOIN blog
  ON author.id = blog.author_id;

--OUTPUT
-- John Smith	Introduction to SQL
-- John Smith	Advanced SQL Techniques
-- Emily Johnson	The Art of Storytelling
-- Emily Johnson	Writing Tips for Beginners
-- Emily Johnson	Creating Engaging Content
-- Michael Brown	Top Travel Destinations
-- Jessica Davis	10 Easy Recipes for Beginners
-- Jessica Davis	The Best Desserts to Try
-- Jessica Davis	Healthy Cooking Tips
-- David Wilson	Starting Your Own Business
-- David Wilson	Business Strategies for Success

--List all authors
SELECT author_name FROM author;
--OUTPUT
-- John Smith
-- Emily Johnson
-- Michael Brown
-- Jessica Davis
-- David Wilson

--List all authors, alphabetically
SELECT author_name FROM author
ORDER BY author_name;
--OUTPUT
-- David Wilson
-- Emily Johnson
-- Jessica Davis
-- John Smith
-- Michael Brown


--List all authors, and a count of how many blogs they have created
SELECT author.author_name, COUNT(blog.id) AS post_count
FROM author
JOIN blog
  ON blog.author_id = author.id
  GROUP BY 1;

-- OUTPUT
-- author_name	post_count
-- Michael Brown	1
-- Emily Johnson	3
-- David Wilson		2
-- John Smith		2
-- Jessica Davis	3

--List all blog posts for a specific author
SELECT author.author_name, blog.title
FROM author
JOIN blog
  ON blog.author_id = author.id
  WHERE author.author_name = 'John Smith'
  
-- OUTPUT
-- author_name	title
-- John Smith	Introduction to SQL
-- John Smith	Advanced SQL Techniques

--List all blog posts, sorted by the oldest first
SELECT blog.posted_date, blog title 
FROM blog
ORDER BY 1;

-- OUTPUT
-- posted_date	title
-- 2023-06-01
-- (1,"Introduction to SQL","A beginner's guide to SQL.","SQL is a standard language for accessing databases...",2023-06-01,1)
-- 2023-06-05
-- (2,"Advanced SQL Techniques","Dive deeper into SQL.","In this post, we will explore advanced SQL techniques...",2023-06-05,1)
-- 2023-06-10
-- (3,"The Art of Storytelling","How to captivate your audience.","Storytelling is an ancient art form that...",2023-06-10,2)
-- 2023-06-12
-- (4,"Writing Tips for Beginners","Get started with writing.","Writing can be a daunting task, but with these tips...",2023-06-12,2)
-- 2023-06-15
-- (5,"Creating Engaging Content","Keep your readers hooked.","Engaging content is key to keeping your audience...",2023-06-15,2)
-- 2023-06-20
-- (6,"Top Travel Destinations","Places you must visit.","Here are some of the top travel destinations...",2023-06-20,3)
-- 2023-06-25
-- (7,"10 Easy Recipes for Beginners","Simple recipes to start cooking.","Cooking can be easy and fun with these simple recipes...",2023-06-25,4)
-- 2023-06-30
-- (9,"Healthy Cooking Tips","Cook healthy meals.","Cooking healthy doesn't have to be hard. Here are some tips...",2023-06-30,4)
-- 2023-07-05
-- (10,"Starting Your Own Business","Steps to start a business.","Starting a business can be challenging but rewarding...",2023-07-05,5)
-- 2023-07-07
-- (11,"Business Strategies for Success","Achieve success in business.","Successful businesses often follow these key strategies...",2023-07-07,5)
-- 2024-06-27
-- (8,"The Best Desserts to Try","Delicious dessert recipes.","Desserts are a great way to end any meal...",2024-06-27,4)

