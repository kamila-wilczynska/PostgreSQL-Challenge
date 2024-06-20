-- Task 2
-- What else could we add to this table?

-- 1) image url
ALTER TABLE product
ADD COLUMN image_url VARCHAR(255),

-- 2) category
ALTER TABLE product
ADD COLUMN category VARCHAR(100),

 