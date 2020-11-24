=============================================
1. Procedure
=============================================
CREATE OR REPLACE PROCEDURE insertCountryAndRegion(country_id IN VARCHAR2, country_name IN VARCHAR2, region_id IN NUMBER, region_name IN VARCHAR2)
AS 
BEGIN 
   INSERT INTO regions VALUES (region_id, region_name);
   INSERT INTO countries VALUES (country_id , country_name, region_id);
END;
/

BEGIN 
   insertCountryAndRegion('ID','Indonesia', 5, 'South East Asia');
END;
/

=============================================
2. Function
=============================================
CREATE OR REPLACE FUNCTION employmentYear(input_employee_id IN NUMBER)
RETURN number IS 
   year NUMBER := 0; 
BEGIN 
   SELECT EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM hire_date) into year
   FROM employees
   WHERE employee_id = input_employee_id; 
   RETURN year; 
END; 

BEGIN 
   dbms_output.put_line(employmentYear(176) || ' years with us.'); 
END; 
/

=============================================
3. Trigger
=============================================
CREATE OR REPLACE TRIGGER email_formatter_before
BEFORE DELETE OR INSERT OR UPDATE ON employees
FOR EACH ROW 
WHEN (NEW.employee_id > 0) 
BEGIN 
    :NEW.email := :NEW.email || '@mii.co.id';
END; 
/

CREATE OR REPLACE TRIGGER email_formatter_after
AFTER DELETE OR INSERT OR UPDATE ON employees
FOR EACH ROW 
WHEN (NEW.employee_id > 0) 
BEGIN 
    dbms_output.put_line('email: ' || :NEW.email); 
END; 
/
 
INSERT INTO employees
VALUES (207, 'Kriti', 'Kroto', 'KRITZ', '555 123 4321', '06/17/2003', 'HR_REP', '4000', NULL, 201, 20); 
