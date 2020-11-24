DECLARE 
   v_salary NUMBER(8); 
BEGIN 
    select salary
      into v_salary
      from employees    
     where employee_id = 100
   dbms_output.put_line(v_salary); 
END; 
/

//Function
CREATE OR REPLACE FUNCTION totalEmployees
RETURN number IS 
   total number(3) := 0; 
BEGIN 
   SELECT count(*) into total 
   FROM employees; 
   RETURN total; 
END; 

BEGIN 
   dbms_output.put_line('Total no. of Customers: ' || c); 
END; 
/

//Procedures
CREATE OR REPLACE PROCEDURE greetings 
AS 
BEGIN 
   dbms_output.put_line('Hello World!'); 
END; 
/

BEGIN 
   greetings; 
END; 
/

//Triggers
CREATE OR REPLACE TRIGGER display_salary_changes 
BEFORE DELETE OR INSERT OR UPDATE ON employees
FOR EACH ROW 
WHEN (NEW.employee_id > 0) 
DECLARE 
   sal_diff number; 
BEGIN 
   sal_diff := :NEW.salary  - :OLD.salary; 
   dbms_output.put_line('Old salary: ' || :OLD.salary); 
   dbms_output.put_line('New salary: ' || :NEW.salary); 
   dbms_output.put_line('Salary difference: ' || sal_diff); 
END; 
/ 

INSERT INTO employees
VALUES (207, 'Kriti', 'Kroto', 'KRITZ', '555 123 4321', '06/17/2003', 'HR_REP', '4000', NULL, 201, 20); 

UPDATE employees
SET salary = 5000
WHERE employee_id = 207;
asdada