SELECT * FROM EMPLOYEES;

/*
    GROUP BY
        - this divides the rows from the SELECT Statement into groups based on the row we provide
        - it is sued most ly with aggregate functions
        - whenever you hear "EACH" you should think of GROUP BY
 */
SELECT JOB_ID FROM EMPLOYEES; -- all job_id
SELECT JOB_ID FROM EMPLOYEES ORDER BY JOB_ID; -- all job_id
SELECT DISTINCT JOB_ID FROM EMPLOYEES; -- distinct job_id


-- find all people work as IT_PROG
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';

-- how many people work as IT_PROG
SELECT COUNT (*) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';

-- how many people work as FI_ACCOUNT
SELECT COUNT (*) FROM EMPLOYEES WHERE JOB_ID = 'FI_ACCOUNT';


-- what is the avg salary for IT_PROG
SELECT FIRST_NAME, SALARY, JOB_ID FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
SELECT AVG(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG'; -- 5760
SELECT AVG(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'FI_ACCOUNT'; -- 7920


-- GROUP BY
-- Get me the avg salary for each job_id
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;

-- Get me the min salary for each job_id
SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';
SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'FI_ACCOUNT';


SELECT JOB_ID, MIN(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;

-- Get me the min, max, avg, sum salary for each job_id
SELECT JOB_ID, MIN(SALARY), MAX(SALARY), AVG(SALARY), SUM(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID;


-- find how many people work for each department
SELECT JOB_ID, count(*) FROM EMPLOYEES
GROUP BY JOB_ID;