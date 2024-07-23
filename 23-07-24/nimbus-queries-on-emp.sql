-- MySQL Version
select version();
--All Tables
show tables;
--Show all departments 
SELECT * FROM departments;
--Total number of departments
SELECT count(*) FROM departments;
--Query department by id 
SELECT * FROM departments where department_id=101;
--Query department by name
SELECT * FROM departments where department_name='Engineering';
--Show all employees 
SELECT * FROM employees;
--Total number of employees 
SELECT count(*) FROM employees;
--Query employee by id
SELECT * FROM employees where employee_id=3;
--Query employee by name
SELECT * FROM employees where first_name='Robert';
--Count by gender
select gender, count(*) from employees group by gender;
--count by number
select position, count(*) from employees group by position;
-- to find max leaves count 
SELECT max(leaves_count)
FROM 
    (select employee_id, count(*) leaves_count
    from leaves 
    group by employee_id) as leaves_count 
-- to display only 3 rows 
select * from employees limit 3;

-- employee with most leaves
select employee_id, count(*) leaves_count
    from leaves 
    group by employee_id
    order by 2 desc
    limit 1
-- employee with most leaves
select  E.*, count(*) leaves_count
    from leaves L 
        INNER JOIN employees E ON (L.employee_id = E.employee_id)
    group by L.employee_id
    order by count(*) desc
    limit 1
-- top salary
select  e.*, s.amount salary
    from employees e
        INNER JOIN salaries s ON (e.employee_id = s.employee_id)
    order by s.amount desc
    limit 1
-- first max salary
select max(amount) from salaries
-- second highest salary 
select max(amount) from salaries
    where (amount < (select max(amount) from salaries)) 
-- second highest salaried employee
select e.* , s.amount
from employees e
    inner join salaries s on (e.employee_id=s.employee_id)
where s.amount < (select max(amount) from salaries)
order by s.amount desc
limit 1