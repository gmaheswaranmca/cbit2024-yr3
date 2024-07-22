desc employees;
desc departments;
desc leaves;
desc salaries;

select * from salaries;
select * from departments;
select * from leaves;
select * from salaries;


/*
    columns selectors | expressions as columns | constants as columns 
        expression operators (selectors): + - * /  
    filtering 
        conidtional operators (filtering/where): < > <= >= = <>  IN BETWEEN  LIKE   AND OR NOT
    sorting 
        arranging the data A-Z, Z-A for text, ascending, descending for numbers or dates 
    aggregation on table  MIN, MAX, COUNT, COUNT DISTINCT, COUNT *, SUM, AVG 
    group: organize rows into groups, then finding aggrgated value out of each group 
        group and aggregation 
    sub query: query within query 
    join : primary focus for RDBMS 
    union: to combine the results of two queries provided that queries output structure to be matched
*/

select * from employees;


-- to display first_name, last_name and gender of 'Smith' which is last name of the employee 
SELECT first_name, last_name, gender
FROM employees 
WHERE last_name='Smith';

-- to display first_name, last_name, data_of_birth, and age of all employees
SELECT first_name, last_name, date_of_birth
FROM employees

SELECT first_name, last_name, date_of_birth, timestampdiff(year, date_of_birth, now()) as age
FROM employees

-- to display first_name, last_name, data_of_birth, age and number of years balance to retire from job "retires_in"
-- assum max age to work as employee is 58 
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- and arrange the employees based on first_name A-Z order
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
ORDER BY first_name
-- "ORDER BY first_name" and "ORDER BY first_name ASC" are same -> ASC means ascending

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- and arrange the employees based on first_name Z-A order
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
ORDER BY first_name DESC

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- and arrange the employees based on age non decreasing order
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
ORDER BY timestampdiff(year, date_of_birth, now()) 

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- and arrange the employees based on age non decreasing order,
-- and if age matched order by first_name A-Z order
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
ORDER BY timestampdiff(year, date_of_birth, now()), first_name  

    -- go with ordinal number
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
ORDER BY 4, first_name  

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- and arrange the employees based on age non decreasing order,
-- and if age matched order by first_name Z-A order
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
ORDER BY timestampdiff(year, date_of_birth, now()), first_name DESC 


    -- go with ordinal number (ordinal number starts with 1 for output columns of the result table)
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
ORDER BY 4, first_name  


-- so far, we tried
-- columns selectors, experessions selectors using function / operator, alias name for expression 
-- sort by single column | sort by and then by | A-Z, Z-A, ascending, descending 


-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by age is 33
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE timestampdiff(year, date_of_birth, now())=33


-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by age is 33
-- sort by names A-Z order
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE timestampdiff(year, date_of_birth, now())=33
ORDER BY first_name

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by age is below 40
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE timestampdiff(year, date_of_birth, now())<40

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by age is above or equal to 40
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE timestampdiff(year, date_of_birth, now())>=40

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by age is one of 34 40 41
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE timestampdiff(year, date_of_birth, now()) IN (34, 40, 41)

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by age between 36 and 40 (included 36 and 40)
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE timestampdiff(year, date_of_birth, now()) BETWEEN 36 AND 40;

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by age not between 36 and 40 (included 36 and 40)
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE timestampdiff(year, date_of_birth, now()) NOT BETWEEN 36 AND 40;

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by first_name ends with 'ia'
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE first_name LIKE '%ia'

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by first_name contains with 'ar'
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE first_name LIKE '%ar%'


-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by first_name from second letter starts with 'ar'
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE first_name LIKE '_ar%'

-- to display first_name, last_name, data_of_birth, age and reires_in_years 
-- filtering: filter by first_name from second letter starts with 'us'
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in
FROM employees
WHERE first_name LIKE '_us%'

-- % means so many chars, _ means ignore that chars
