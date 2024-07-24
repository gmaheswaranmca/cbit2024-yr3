desc employees;
desc departments;
desc leaves;
desc salaries;

select * from salaries;
select * from departments;
select * from leaves;
select * from salaries;

Host
ocdb.app

Port
5051

Database
db_42kvcqwh9

Username
user_42kvcqwh9

Password
p42kvcqwh9
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


-- so far, 
    -- selectors : columns, expressions : function / operators, constant 
    -- filterings: where condition - < > <= >= = <>        IN BETWEEN LIKE  AND OR NOT 
    -- sort by: sort by | sort by then by ... | a-z z-a ascending descending 
                    -- | ORDER BY ASC / DESC

-- 
-- to display first_name, last_name, data_of_birth, age, max_age and reires_in_years,
--      experience, total_service, experience_service
SELECT first_name, last_name, date_of_birth, 
    timestampdiff(year, date_of_birth, now()) as age, 58 as max_age,
    58 - timestampdiff(year, date_of_birth, now()) retires_in,
    timestampdiff(year, joining_date, now()) as experience,
    58 - timestampdiff(year, date_of_birth, now()) + timestampdiff(year, joining_date, now()) total_service,
    timestampdiff(year, joining_date, now()) / 
        (58 - timestampdiff(year, date_of_birth, now()) + timestampdiff(year, joining_date, now())) * 100 
            as exp_per
FROM employees

            -- OR define view
            -- view is named and stored query 
            -- view can be seen as table 
            --      --> we may use the view for queries like table
    -- view: employees_service
    /*
        DROP VIEW employees_service
        -- how view is running internally 
    SELECT * FROM (SELECT employees.*, 
            timestampdiff(year, date_of_birth, now()) as age, 58 as max_age,
            58 - timestampdiff(year, date_of_birth, now()) retires_in,
            timestampdiff(year, joining_date, now()) as experience,
            58 - timestampdiff(year, date_of_birth, now()) + timestampdiff(year, joining_date, now()) total_service
        FROM employees) as employees_v2        
    */
    CREATE VIEW employees_service 
    AS 
        SELECT employees.*, 
            timestampdiff(year, date_of_birth, now()) as age, 58 as max_age,
            58 - timestampdiff(year, date_of_birth, now()) retires_in,
            timestampdiff(year, joining_date, now()) as experience,
            58 - timestampdiff(year, date_of_birth, now()) + timestampdiff(year, joining_date, now()) total_service
        FROM employees
    -- test view : can we see it as table 
    -- test 1
    DESC employees_service
    -- test 2
    SELECT * FROM employees_service

    -- solution 2 via view 
    SELECT first_name, last_name, date_of_birth, age, max_age,
        retires_in,
        experience,
        total_service,
        experience / total_service * 100 as exp_per
    FROM employees_service


-- aggregators : min, max, count, count *, count distinct, sum, avg 
-- group : group by | aggregators | having/filtering

-- aggregators : min, max, count(col), count(*), count(distinct col), sum, avg
    -- count(col) -- no of non-null values in col 
    -- count(*)   -- no of records
    -- count(distinct col) -- no of distinct col values (if col val duplicated, counted only once)
-- to count number of employees
select count(*) from employees;
-- to count number of salaries
select count(*) from salaries;

join: 
-- number of employess after joined with salaries based on employee_id matched rows
SELECT count(*)
FROM employees INNER JOIN salaries ON(employees.employee_id = salaries.employee_id)

-- number of employess after joined with salaries with no cond
    -- each employee row is joined to every salary : cartecian product | CROSS JOIN
    --      -> introduce the cond towards matched rows 
SELECT count(*)
FROM employees INNER JOIN salaries ON(1 =1)

-- to display emp_name, salary
-- after join based on matched rows of employees and salaries
SELECT employees.first_name, employees.last_name, salaries.amount as salary
FROM 
    employees 
    INNER JOIN salaries ON(employees.employee_id = salaries.employee_id)
ORDER BY 3

-- to find max salary
SELECT max(salaries.amount) max_salary
FROM 
    employees 
    INNER JOIN salaries ON(employees.employee_id = salaries.employee_id)
-- to find min salary 
SELECT min(salaries.amount) min_salary
FROM 
    employees 
    INNER JOIN salaries ON(employees.employee_id = salaries.employee_id)
-- to find sum of salaries
SELECT sum(salaries.amount) total_salary
FROM 
    employees 
    INNER JOIN salaries ON(employees.employee_id = salaries.employee_id)
-- to find avg salary 
SELECT sum(salaries.amount)/count(*) avg_salary_calc, avg(salaries.amount) avg_salary
FROM 
    employees 
    INNER JOIN salaries ON(employees.employee_id = salaries.employee_id)


-- to get distinct positions
select distinct position from employees
-- to get distinct gender
select distinct gender from employees
-- to find number of values in position
SELECT count(position) positions_count FROM employees
-- to find number of position
SELECT count(distinct position) positions_count FROM employees
-- to find number of gender
SELECT count(distinct gender) genders_count FROM employees
-- to find number of department in employees
SELECT count(distinct department_id) dept_count FROM employees


-- group by - aggregators 

-- to find sum of salaries of male 
SELECT sum(s.amount) total_salary
FROM 
    employees as e
    INNER JOIN salaries as s ON(e.employee_id = s.employee_id)
WHERE e.gender='MALE'

-- to find sum of salaries of female 
SELECT sum(s.amount) total_salary
FROM 
    employees as e
    INNER JOIN salaries as s ON(e.employee_id = s.employee_id)
WHERE e.gender='FEMALE'

-- to display distinct genders
SELECT e.gender
FROM employees as e
    INNER JOIN salaries as s ON(e.employee_id = s.employee_id)
GROUP BY e.gender 
-- group : based on a column / columns
-- to find total salaries of each gender
--  once grouped based group column(s), selectors are expressions on columns participated in group by 
--      and aggregators which will run based on group value, 
--              each group we many have aggregator value
SELECT e.gender, sum(s.amount) total_salary
FROM employees as e
    INNER JOIN salaries as s ON(e.employee_id = s.employee_id)
GROUP BY e.gender 

-- department based total salary
SELECT e.department_id, sum(s.amount) total_salary
FROM employees as e
    INNER JOIN salaries as s ON(e.employee_id = s.employee_id)
GROUP BY e.department_id

-- department based gender wise total salary
SELECT e.department_id, e.gender, sum(s.amount) total_salary
FROM employees as e
    INNER JOIN salaries as s ON(e.employee_id = s.employee_id)
GROUP BY e.department_id, e.gender
ORDER BY 2,1

-- department based total salary and avg salary
SELECT e.department_id, sum(s.amount) total_salary, avg(s.amount) avg_salary
FROM employees as e
    INNER JOIN salaries as s ON(e.employee_id = s.employee_id)
GROUP BY e.department_id

-- department based total salary where total salary > 3.6 lacks
SELECT e.department_id, sum(s.amount) total_salary
FROM employees as e
    INNER JOIN salaries as s ON(e.employee_id = s.employee_id)
GROUP BY e.department_id
    HAVING sum(s.amount) > 360000

-- to display first_name, last_name, department_name 
select e.first_name, e.last_name, d.department_name 
from employees e 
    INNER JOIN departments d ON(e.department_id = d.department_id);

-- to count number of rows after employees joined with departments
select count(*)
from employees e 
    INNER JOIN departments d ON(e.department_id = d.department_id)

-- department name wise total salary
select d.department_name, sum(s.amount) as salary
from employees as e 
    INNER JOIN departments as d ON(e.department_id = d.department_id)
    INNER JOIN salaries as s ON (e.employee_id = s.employee_id)
GROUP BY d.department_name


-- selectors : column, expression - fn/ops, constant
-- filtering : where cond - relational + in / between / like + logical 
-- sorting : text, number 
-- aggregators 
-- group by and aggregators 
-- join (inner join)
-- queries from bytexl on nimbus platform 

join types: cross join, 
    1. inner join 
    2. left outer join 
    3. right outer join 
    4. full outer join 

insert into departments(department_id,department_name) values(106,'Account');

-- display deprt name and emp name 
select d.department_name, e.first_name 
from employees e
    inner join departments d on(e.department_id = d.department_id)

-- count the joined dept and emp tables rows
select count(*)
from employees e
    inner join departments d on(e.department_id = d.department_id)

-- display dept name and emp name of the matched rows
--      and excess departments as well 
    -- example for left outer join |
    -- left join OR left outer join 
select d.department_name, ifnull(e.first_name,'No Data') first_name
from departments d
    left join employees e on(e.department_id = d.department_id)

        -- OR 
    -- example for right outer join |
    -- right join OR right outer join 
select d.department_name, ifnull(e.first_name,'No Data') first_name
from employees e
    right join departments d on(e.department_id = d.department_id)

    -- if we have left table excess rows and right table excess rows 
    table_left L 
        full outer join table_right R ON (condition)
    -- matched rows + left extra rows + right extra rows 

--- not covered here: union, correlated sub query
    union: 
        display male employees whose salary is less than the avg male salary 
            union 
        display female employees whose salary is less than the avg female salary 
    correlated sub query:
        1. find department's max salary 
        2. find department's 2nd max salary (solve via correlated sub query)
    sub query: runs first and then main query will run 
    correlated sub query: every row the sub query will run 

-- stored procedure 
-- stored function 
    deterministic | non-deterministic