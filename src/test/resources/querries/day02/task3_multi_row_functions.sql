SELECT * FROM EMPLOYEES;

/*
    Aggregate functions - multi row functions
        - min
        - max
        - avg
        - sum
        - count
        - round

        - takes multiple inputs and gives the result based on out conditions.
 */

--COUNT
SELECT * FROM EMPLOYEES;

--How many employees are there?
SELECT COUNT(*) FROM EMPLOYEES;

-- How many first_names we have
SELECT FIRST_NAME FROM EMPLOYEES;
SELECT COUNT(FIRST_NAME) FROM EMPLOYEES;

-- How many UNIQUE first_names we have
SELECT FIRST_NAME FROM EMPLOYEES;
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES;
SELECT COUNT (DISTINCT FIRST_NAME) FROM EMPLOYEES;

-- How many employees work as 'IT_PROG' or 'SA_REP'
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE JOB_ID IN ('IT_PROG', 'SA_REP');
SELECT COUNT(*) FROM EMPLOYEES WHERE JOB_ID IN ('IT_PROG', 'SA_REP');


-- How many employees we have department id is null
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;
SELECT COUNT(*) FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;

SELECT DEPARTMENT_ID FROM EMPLOYEES;
SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;
SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL; -- null just itself is not counted


------------------------------------------------------------------------

-- MIN
--get me min salary from employees
SELECT SALARY FROM EMPLOYEES;
SELECT MIN(SALARY) FROM EMPLOYEES;
SELECT SALARY FROM EMPLOYEES WHERE SALARY <= 2100;

SELECT SALARY FROM EMPLOYEES
ORDER BY SALARY ASC;

SELECT FIRST_NAME FROM EMPLOYEES;
SELECT MIN(FIRST_NAME) FROM EMPLOYEES; -- go from alphabetic order / but this is used with numbers mostly.


------------------------------------------------------------------------

-- MAX
--get me MAX salary from employees
SELECT SALARY FROM EMPLOYEES;
SELECT MAX(SALARY) FROM EMPLOYEES;
SELECT SALARY FROM EMPLOYEES ORDER BY SALARY DESC;


------------------------------------------------------------------------

-- SUM
--get me SUM/TOTAL salary from employees
SELECT SALARY FROM EMPLOYEES;
SELECT SUM(SALARY) FROM EMPLOYEES; -- 691416

------------------------------------------------------------------------

-- AVG
--get me Average salary from employees
SELECT SALARY FROM EMPLOYEES;
SELECT AVG(SALARY) FROM EMPLOYEES; -- 6461.831775700934579439252336448598130841


------------------------------------------------------------------------

-- ROUND
SELECT AVG(SALARY) FROM EMPLOYEES; --6461.831775700934579439252336448598130841
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES; -- round to whole number -> 6442
SELECT ROUND(AVG(SALARY), 1) FROM EMPLOYEES; --> 6461.8
SELECT ROUND(AVG(SALARY), 2) FROM EMPLOYEES; --> 6461.83
SELECT ROUND(AVG(SALARY), 3) FROM EMPLOYEES; --> 6461.832
SELECT ROUND(AVG(SALARY), -1) FROM EMPLOYEES; --> 6460
SELECT ROUND(AVG(SALARY), -2) FROM EMPLOYEES; --> 6500
