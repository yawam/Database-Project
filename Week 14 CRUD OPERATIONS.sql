-- QUERY 1
-- SELECTING EMPLOYEES WHO ARE IN THE ADMINISTRATIVE SECTOR OF THE ACCOUNTING DEPARTMENT
USE employee;
SELECT f_name, l_name 
FROM employee e
JOIN rankings r
	ON r.rankings_id = e.rankings_id
 JOIN dep_emp de
	ON de.emp_id = e.emp_id
JOIN departments d
	ON d.departments_id = de.departments_id
WHERE emp_ranking = 'Administrative' AND dept_name = 'Accounting';

-- QUERY 2
-- ARIA AZPILICUETA GOT MARRIED AND WE NEEDED TO CHANGE HER LAST NAME AND HER STREET Address IN THE DATABASE

UPDATE employee
SET	l_name = "Gundogan" , street_address = "234 West 4th South"
WHERE emp_id = 9;

-- QUERY 3
-- DELETE  HAKIM ZIYECH FROM THE DATABASE
DROP PROCEDURE TEST
DELIMITER //
CREATE PROCEDURE test
(
	IN emp_id_param INT
)
	BEGIN
	

	DELETE FROM employee 
    WHERE emp_id = emp_id_param;
	

END //

CALL test(3);



