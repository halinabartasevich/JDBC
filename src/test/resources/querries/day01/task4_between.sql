SELECT * FROM JOBS;
/*
    BETWEEN
         returns all rows with a value between the two specified values.
         with BETWEEN the low and high values are inclusive.
 */

SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 6000; -- 3000 and 6000 are inclusive


SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY >= 3000 AND SALARY <= 6000; -- 3000 and 6000 are inclusive


SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY > 3000 AND SALARY < 6000; -- 3000 and 6000 are NOT inclusive


SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY < 6000 AND SALARY > 3000;

-- get me first name, last name, salary, department id from employees where salary is more than 7000 and department id is 80
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY > 7000 AND DEPARTMENT_ID = 80;



-- get me first name, last name, salary, department id from employees where salary is between 3k and 7K and department id is 80
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 and 7000 AND DEPARTMENT_ID = 80;