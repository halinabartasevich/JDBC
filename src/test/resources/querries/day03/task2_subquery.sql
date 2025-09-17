SELECT * FROM EMPLOYEES;

/*
    SUBQUERY
        A subquery is a query that is contained within another query. (Nested Query)
        It allows us to use multiple SELECT statement together
 */


-- Display all information from employees who is making highest salary in company ?
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;
SELECT * FROM EMPLOYEES WHERE SALARY = 24000; -- I am using 24K in hardcoded way


-- Lets make it DYNAMIC
SELECT MAX(SALARY) FROM EMPLOYEES; -- 24000
SELECT * FROM EMPLOYEES WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

----------------------------------------------------------------------------

-- DISPLAY THE 2ND HIGHEST SALARY
SELECT SALARY FROM EMPLOYEES ORDER BY SALARY DESC;

SELECT MAX(SALARY) FROM EMPLOYEES;

-- Get me all salary less than 24K
SELECT SALARY FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES);

-- This is finding the second highest salary
SELECT MAX(SALARY) FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES); -- 17K


SELECT * FROM EMPLOYEES
WHERE SALARY = ( SELECT MAX(SALARY) FROM EMPLOYEES
                 WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES) );

----------------------------------------------------------------------------

-- Display all the employees who are making above the average salary
SELECT SALARY FROM EMPLOYEES;
SELECT AVG(SALARY) FROM EMPLOYEES;
SELECT ROUND(AVG(SALARY), 2) FROM EMPLOYEES; -- 6461.83

SELECT * FROM EMPLOYEES
WHERE SALARY > 6461.83; -- HARDCODED way


SELECT * FROM EMPLOYEES
WHERE SALARY > (SELECT ROUND(AVG(SALARY), 2) FROM EMPLOYEES); -- DYNAMIC way / 6461.83;

