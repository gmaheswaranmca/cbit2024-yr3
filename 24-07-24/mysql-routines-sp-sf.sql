-- MySQL function and stored procedure 
------- Try in workbench ---------------------
DELIMITER $$
CREATE FUNCTION find_add(a int, b int) 
returns int deterministic
begin 
	return a + b;
end$$
DELIMITER ;

SELECT find_add(10,20) sum;
SELECT find_add(1,2) sum;

 ---- sp_employees_exp ---
DROP PROCEDURE IF EXISTS sp_employees_exp;
CREATE PROCEDURE sp_employees_exp(p_id INT) 
BEGIN 
    DECLARE v_joining_date datetime;
    DECLARE v_experience INT;
    SELECT joining_date 
    INTO v_joining_date 
    FROM employees WHERE employee_id=p_id;

    SET v_experience = TIMESTAMPDIFF(year, v_joining_date, now());
    SELECT e.*, 
        v_experience experience
    FROM employees e 
    WHERE employee_id=p_id;
END;
CALL sp_employees_exp(3);

-- -procedure / function : routines 
-- we may solve crud ops using SPs
/*
sp_notes_create   -- insert             solved
sp_notes_update -- edit/update          assignment 
sp_notes_read_by_id                     solved
sp_notes_read_all                       solved
sp_notes_delete                         assignment 
*/
DROP PROCEDURE IF EXISTS sp_notes_read_all;
CREATE PROCEDURE sp_notes_read_all()
BEGIN
    SELECT id, title, notes FROM notes LIMIT 1;
END;

CALL sp_notes_read_all;

DROP PROCEDURE IF EXISTS sp_notes_read_by_id;
CREATE PROCEDURE sp_notes_read_by_id(p_id INT)
BEGIN
    SELECT id, title, notes FROM notes WHERE id=p_id;
END;

CALL sp_notes_read_by_id(2);
CALL sp_notes_read_by_id(3);

DROP PROCEDURE IF EXISTS sp_notes_create;
CREATE PROCEDURE sp_notes_create(p_title varchar(255), p_notes varchar(3000))
BEGIN
    DECLARE v_id INT;
    INSERT INTO notes(title, notes)
    VALUES(p_title, p_notes);

    SET v_id = LAST_INSERT_ID();
    
    SELECT id, title, notes FROM notes WHERE id=v_id;
END;
CALL sp_notes_create('Science', 'study of nature');
CALL sp_notes_create('Mathematics', 'study of numbers and all');

DROP PROCEDURE IF EXISTS sp_employees_service;
CREATE PROCEDURE sp_employees_service(p_id INT) 
BEGIN -- *, age, max_age, experience, retires_in, service, experience_per
    DECLARE v_date_of_birth DATETIME;
    DECLARE v_joining_date DATETIME;
    DECLARE v_age INT;
    DECLARE v_max_age INT;
    DECLARE v_experience INT;
    DECLARE v_retires_in INT; 
    DECLARE v_service INT;
    DECLARE v_experience_per FLOAT;

    SELECT date_of_birth, joining_date 
    INTO v_date_of_birth, v_joining_date 
    FROM employees WHERE employee_id=p_id;

    SET v_age = TIMESTAMPDIFF(year, v_date_of_birth, now());
    SET v_max_age = 58;
    SET v_retires_in = v_max_age - v_age;
    SET v_experience = TIMESTAMPDIFF(year, v_joining_date, now());
    SET v_service = v_experience + v_retires_in;
    SET v_experience_per = v_experience / v_service * 100;
    SELECT e.*,v_age age, v_max_age max_age, 
        _experience experience, v_retires_in retires_in,
        v_service service, v_experience_per experience_per 
    FROM employees e 
    WHERE employee_id=p_id;
END;
CALL sp_employees_service(3);