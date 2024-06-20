-- Task 3
-- (Note that you may want to create a second database for this part)

-- The company has decided that a blog post could have more than one author.

-- Here are some updated requirements:

-- Each blog post can have one or more authors
-- Each author can write one or more blog posts
-- Here are some tasks:

-- Design/update the table(s), and which fields they should have
-- Specify the data types for each field
-- Specify any constraints (e.g. primary keys, foreign keys, unique constraints)
-- Write the SQL to create/update these table(s)
-- Write the SQL to update the authors
-- Each blog post should have at least one author
-- Write the SQL queries to retrieve the following data:
-- List all blog post titles
-- List all authors
-- List all authors, and a count of how many blogs they have created
-- List all blog posts for a specific author
-- List all authors for a specific blog post



--Created New Database called "The Guardian 2 - task III"

-- Created tables

-- Create authors table
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    bio VARCHAR(250),
    joined_date DATE NOT NULL
);

-- Create blog table
CREATE TABLE blog (
    id SERIAL PRIMARY KEY,
	author_id INTEGER REFERENCES authors(id),
    title VARCHAR(100) NOT NULL,
    summary VARCHAR(255),
    post TEXT NOT NULL,
    posted_date DATE NOT NULL  
);

-- Create blog-authors table with composite keys
CREATE TABLE blog_authors (
    author_id INTEGER REFERENCES authors(id),
    blog_id INTEGER REFERENCES blog(id),
    PRIMARY KEY (author_id, blog_id)
);



--insert data into authors
INSERT INTO authors (author_name, email, password, bio, joined_date)
VALUES
('John Doe', 'john@example.com', 'password123', 'Tech enthusiast', '2023-01-15'),
('Jane Smith', 'jane@example.com', 'securepass', 'Lifestyle blogger', '2023-02-20'),
('Alice Johnson', 'alice@example.com', 'alicepwd', 'Travel writer', '2023-03-05');


--insert data into blog
INSERT INTO blog (title, summary, post, posted_date)
VALUES
('Tech Trends 2024', 'Latest trends in technology', 'Content of the blog post...', '2023-04-10'),
('Healthy Living Tips', 'Tips for a healthier life', 'Content of the blog post...', '2023-04-15'),
('Top Travel Destinations', 'Best places to visit this year', 'Content of the blog post...', '2023-04-20');

--connect author with blog
INSERT INTO blog_authors (author_id, blog_id)
VALUES
(1, 1),  -- John Doe - "Tech Trends 2024"
(2, 2),  -- Jane Smith - "Healthy Living Tips"
(3, 3),  -- Alice Johnson - "Top Travel Destinations"
(1, 2),  -- John Doe - "Healthy Living Tips"
(2, 3);  -- Jane Smith also- Top Travel Destinations


--List all blog post titles
SELECT blog.title FROM blog;

-- OUTPUT
-- title
-- Tech Trends 2024
-- Healthy Living Tips
-- Top Travel Destinations

--List all authors
SELECT authors.author_name FROM authors;

-- OUTPUT
-- author_name
-- John Doe
-- Jane Smith
-- Alice Johnson

--List all authors, and a count of how many blogs they have created
SELECT
    authors.author_name,
    COUNT(blog_authors.blog_id) AS blog_count
FROM
    authors
LEFT JOIN
    blog_authors ON authors.id = blog_authors.author_id
GROUP BY
    authors.author_name;

-- OUTPUT
-- author_name	blog_count
-- Jane Smith		2
-- John Doe			2
-- Alice Johnson	1


--List all blog posts for a specific author
SELECT
    blog.title
FROM
    blog
JOIN
    blog_authors ON blog.id = blog_authors.blog_id
JOIN
    authors ON authors.id = blog_authors.author_id  
WHERE
    authors.author_name = 'John Doe';

-- OUTPUT
-- title
-- Tech Trends 2024
-- Healthy Living Tips


--List all authors for a specific blog post
SELECT
    authors.author_name
FROM
    authors
JOIN
    blog_authors ON authors.id = blog_authors.author_id
JOIN
    blog ON blog.id = blog_authors.blog_id  
WHERE
    blog.title = 'Tech Trends 2024';

	
-- author_name
-- John Doe

