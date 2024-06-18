-- Part 1
-- Task 2
-- The company has decided that they would like to add tags to blog posts.

-- Here are some requirements:

-- Each blog post can have one or more tags
-- Each tag can be applied to one or more blog posts
-- Here are some tasks:

-- Design the table(s), and which fields they should have
-- Specify the data types for each field
-- Specify any constraints (e.g. primary keys, foreign keys, unique constraints)
-- Write the SQL to create these table(s)
-- Write the SQL to insert some tags
-- There should be at least five tags
-- Each blog post should have between 1-5 tags
-- Write the SQL queries to retrieve the following data:
-- A list of all tags
-- A list of all tags and how many times they have been used
-- A list of all tags for a particular blog post
-- A list of all blog posts for a particular tag

-- tag table created with GUI
ALTER TABLE tag 
ADD COLUMN tag_name VARCHAR(100);

-- blog_tag table created with GUI
ALTER TABLE blog_tag
ADD COLUMN blog_id INTEGER REFERENCES blog(id),
ADD COLUMN tag_id INTEGER REFERENCES tag(id),
-- Add Constraing Key
ALTER TABLE blog_tag
ADD CONSTRAINT blog_tag_pkey PRIMARY KEY (blog_id, tag_id);

-- Write the SQL to insert some tags
INSERT INTO tag (tag_name) VALUES
('Technology'),
('Programming'),
('SQL'),
('Database'),
('Tutorial'),
('Tips'),
('Cooking'),
('Travel'),
('Health'),
('Business');

--A list of all tags
SELECT tag_name FROM tag;

-- OUTPUT
-- tag_name
-- Technology
-- Programming
-- SQL
-- Database
-- Tutorial
-- Tips
-- Cooking
-- Travel
-- Health
-- Business

-- Connect blog post with tag Each blog post should have between 1-5 tags
INSERT INTO blog_tag (blog_id, tag_id) VALUES
(1, 1),
(1, 1),
(2, 8),
(3, 10),
(3, 5),
(4, 10),
(5, 10),
(5, 9),
(6, 6),
(7, 4),
(7, 6),
(8, 4),
(9, 4),
(10, 9),
(11, 9);

-- A list of all tags and how many times they have been used
SELECT tag.tag_name, COUNT(blog_tag.tag_id) AS usage_count
FROM tag
LEFT JOIN blog_tag 
ON tag.id = blog_tag.tag_id
GROUP BY tag.tag_name

-- OUTPUT
-- tag_name		usage_count
-- tag_name		usage_count
-- Technology		2
-- Database			3
-- SQL				0
-- Cooking			0
-- Health			3
-- Travel			1
-- Programming		0
-- Tutorial			1
-- Business			3
-- Tips				2


--A list of all tags for a particular blog post
SELECT tag.tag_name
FROM tag
JOIN blog_tag ON tag.id = blog_tag.tag_id
JOIN blog ON blog.id = blog_tag.blog_id
WHERE blog.id = 5 ;

-- OUTPUT
-- tag_name
-- Health
-- Business


-- A list of all blog posts for a particular tag
SELECT blog.title
FROM blog
JOIN blog_tag ON blog.id = blog_tag.blog_id
JOIN tag ON tag.id = blog_tag.tag_id
WHERE tag.id = 10;

-- OUTPUT
-- title
-- The Art of Storytelling
-- Writing Tips for Beginners
-- Creating Engaging Content