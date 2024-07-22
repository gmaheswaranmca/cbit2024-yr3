-- app: notes-search-app
-- db: notes_search_db


/*
    -- to create the database
    CREATE DATABASE notes_search_db;
    -- database is collection of tables
    -- database is collection of tables, views, triggers, procedures etc

    -- to use the databse : to switch to the database : to set the database as current databse 
    USE notes_search_db;

    -- to drop the database
    DROP DATABASE notes_search_db;
    -- best practice : empty the database by deleting its objects like tables and drop the databse
*/

CREATE TABLE notes( 
    id INT Primary Key AUTO_INCREMENT,
    title VARCHAR(255),
    notes VARCHAR(2000)
);

DROP TABLE notes;

-- specify the constraint at last | not null
desc notes;
select * from notes;

CREATE TABLE notes( 
    id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    notes VARCHAR(2000) NOT NULL,
    Primary Key(id)
);

INSERT INTO notes(title, notes) VALUES('HTML 5', 'HTML 5 is a web development markup language.');
INSERT INTO notes(title, notes) 
    VALUES('CSS 3', 'CSS 3 is style sheet to apply the styles to HTML pages/page content.');
INSERT INTO notes(title, notes) 
    VALUES
        ('Python', 'python is leading high level programming language.'),
        ('Flask', 'flask is the web development framework and package of python.');
-- -to update the notes column of the 'CSS 3' row using title column 
-- -- not progessional way of updating the notes column as we used the non indexed column title 
-- -- to update use primary key column --best practice
UPDATE notes 
    SET notes='CSS 3 is to make the HTML page look and feel.'
    WHERE title='CSS 3';  

-- best practice by its id
UPDATE notes 
    SET notes='CSS 3 is to make the HTML page look and feel.'
    WHERE id=2; 

INSERT INTO notes(title, notes) VALUES('SCIENCE', 'Study of nature.');

DELETE from notes 
    WHERE id=5;

select * from notes;

-- to display notes where title is 'HTML 5'
-- 'select' is column selectors | 'from' is the tables selectors | 'where' is condition to filter rows 
select id, title, notes 
    from notes
    where title = 'HTML 5'; 
-- to display notes where title is 'CSS 3'
select id, title, notes 
    from notes
    where title = 'CSS 3'; 
-- to display notes where id is 2
select id, title, notes 
    from notes
    where id = 2; 
-- operators
-- column selectors are expressions : + - * / 
-- where we have conidtions using conditional ops  =    <>       <      >   <=      >=
            -- in, between, like, exist
            -- col in (val1, val2, ...), col not in (val1, val2, ...)       one of the values 
            -- col between x and y, col not between x and y                 numbers / dates
            -- col like '%a'            'col' ends with text 'a' 
            -- col like 'a%'            'col' starts with text 'a'
            -- col like '%a%'           'col' contains text 'a'
            -- exist(sub query)          if result for sub query 
        -- logical operators : AND OR NOT 
-- to display notes of CSS 3 or HTML 5
select id, title, notes 
    from notes
    where title='CSS 3' OR title='HTML 5';
    -- same result using IN operaror
select id, title, notes 
    from notes
    where title IN ('CSS 3','HTML 5');

-- to display notes whose notes text contains 'language'
select id, title, notes 
    from notes
    where notes LIKE '%language%';

-- to display notes whose notes text contains 'web'
select id, title, notes 
    from notes
    where notes LIKE '%web%';


-- Level 1 : CRUD operations we have completed with notes app's notes table.
-- Exercise: Try to create the vendor table, conduct crud ops ans seach ops.