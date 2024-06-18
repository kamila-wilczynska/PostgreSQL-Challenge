# TechNative database challenge

##-- Part 1 Task 1

### Created database using Postbird GUI
![image](https://github.com/kamila-wilczynska/PostgreSQL-Challenge/assets/107350829/e6ab3ad7-314f-4041-be80-5b4c1405d158)

### Created empty tables authors and blog
![image](https://github.com/kamila-wilczynska/PostgreSQL-Challenge/assets/107350829/f9b0351b-c5af-410c-be8a-ae6e11da8612)

### Each blog post can have a single author and Each author can write multiple blog which is ONE-to-Many Relationship 

![image](https://github.com/kamila-wilczynska/PostgreSQL-Challenge/assets/107350829/2891e408-a6df-470d-97cd-53776c524b5a)

### Made sure all created correctly

![image](https://github.com/kamila-wilczynska/PostgreSQL-Challenge/assets/107350829/1eb6f891-b0c3-4143-890e-46de1fe8c55d)
![image](https://github.com/kamila-wilczynska/PostgreSQL-Challenge/assets/107350829/9b1acf82-6b29-4420-b7fb-1b5a60720368)

### Added foreign key into blog – to connect blog table with author table

ALTER TABLE blog 
ADD COLUMN author_id INTEGER REFERENCES author(id);

### Author id will tell us which posts are written by which author
![image](https://github.com/kamila-wilczynska/PostgreSQL-Challenge/assets/107350829/7f2ba99c-d959-40bf-a3eb-f8fff6e02a3c)

##-- Part 1 Task 2

### Blog and Tag will have Many-to-Many Relationship 
![image](https://github.com/kamila-wilczynska/PostgreSQL-Challenge/assets/107350829/c7d61daf-24f7-44b6-b3fb-d78f2c1c3b06)

Created tag and blog tag table
Blog tag table manages the many-to-many relationship between blog posts and tags in a relational database.
The blog_tag table shows  relationship by holding pairs of foreign keys from the blog and tag tables. 
![image](https://github.com/kamila-wilczynska/PostgreSQL-Challenge/assets/107350829/28f40bd4-5b8c-40bb-8c2a-d9373010189f)


