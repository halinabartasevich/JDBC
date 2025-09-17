SELECT * FROM EMPLOYEES;

/*
    ROWNUM
        Limits the number of the result displayed in the query
        Only works wth less than (<) and less than or equal to (<=)

 */


SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;
SELECT SALARY FROM EMPLOYEES ORDER BY SALARY DESC;


-- Get me the first 5 highest salary

-- OPTION 1 - with multiple SUBQUERIES
SELECT MAX(SALARY) FROM EMPLOYEES;  -- 1st highest salary

SELECT MAX(SALARY) FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES); -- 2nd highest salary

SELECT MAX (SALARY) FROM EMPLOYEES
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES
                WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES)); -- 3rd highest salary


SELECT MAX (SALARY) FROM EMPLOYEES
WHERE SALARY < (SELECT MAX (SALARY) FROM EMPLOYEES
                WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES
                                WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES))); --4th highest salary

SELECT MAX (SALARY) FROM EMPLOYEES
WHERE SALARY < (SELECT MAX (SALARY) FROM EMPLOYEES
                WHERE SALARY < (SELECT MAX (SALARY) FROM EMPLOYEES
                                WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES
                                                WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES))))  ; -- 5th highest salary

SELECT DISTINCT SALARY FROM EMPLOYEES
WHERE SALARY >= (SELECT MAX (SALARY) FROM EMPLOYEES
                 WHERE SALARY < (SELECT MAX (SALARY) FROM EMPLOYEES
                                 WHERE SALARY < (SELECT MAX (SALARY) FROM EMPLOYEES
                                                 WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES
                                                                 WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES)))) )
ORDER BY SALARY DESC;



-- OPTION 2 - with ROWNUM
-- find all unique
SELECT DISTINCT SALARY FROM EMPLOYEES
ORDER BY SALARY DESC;
/*
    24000.00
    17000.00
    14000.00
    13500.00
    13000.00
    .....
 */

-- This is just to show the explanation of Execution order
SELECT DISTINCT SALARY FROM EMPLOYEES
WHERE ROWNUM <= 5
ORDER BY SALARY DESC;
/*
SELECT SALARY FROM EMPLOYEES;
/*
    24000.00
    ---------17000.00
    17000.00
    9000.00
    6000.00
    4800.00
    .....
 */

SELECT DISTINCT SALARY FROM EMPLOYEES
WHERE ROWNUM <= 5
ORDER BY SALARY DESC;
/*
    24000.00
    17000.00
    9000.00
    6000.00

    Because o Execution order: FIRST it CUTS, THEN it applies DISTINCT, THEY ORDER BY (SORT)
 */


-- FIXED version (changing the execution order)
SELECT DISTINCT SALARY FROM EMPLOYEES
ORDER BY SALARY DESC;

-- CHANGED the execution order: FIRST apply DISTINCT + ORDER BY, THEN CUT
SELECT SALARY FROM (SELECT DISTINCT SALARY FROM EMPLOYEES
                    ORDER BY SALARY DESC)
WHERE ROWNUM < 6;

------------------------------------------------------------------------

-- Find me all the employees info who is making first 5 highest - 24000, 17000, 14000, 13500, 13000
-- OPTION 1 -- hardcoded way
SELECT * FROM EMPLOYEES
WHERE SALARY IN (24000, 17000, 14000, 13500, 13000);

-- OPTION 2 -- hardcoded way
SELECT  * FROM EMPLOYEES
WHERE SALARY = 24000 OR SALARY = 17000 OR SALARY = 14000 OR SALARY = 13500 OR SALARY = 13000;

-- * OPTION 3 - DYNAMIC WAY with ROWNUM
SELECT * FROM EMPLOYEES
WHERE SALARY IN (SELECT SALARY FROM (SELECT DISTINCT SALARY FROM EMPLOYEES
                                     ORDER BY SALARY DESC)
                 WHERE ROWNUM < 6);

-- OPTION 4 - DYNAMIC WAY with multiple SUBQUERIES - REALLY LONGGGGGGGG - not practical.
SELECT * FROM EMPLOYEES
WHERE SALARY IN (SELECT DISTINCT SALARY FROM EMPLOYEES
                 WHERE SALARY >= (SELECT MAX (SALARY) FROM EMPLOYEES
                                  WHERE SALARY < (SELECT MAX (SALARY) FROM EMPLOYEES
                                                  WHERE SALARY < (SELECT MAX (SALARY) FROM EMPLOYEES
                                                                  WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES
                                                                                  WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES)))) ));

------------------------------------------------------------------------------------------------------------------------
-- Display all info for first 10 highest salary
SELECT SALARY FROM (SELECT DISTINCT SALARY FROM EMPLOYEES
                    ORDER BY SALARY DESC)
WHERE ROWNUM <= 10;


SELECT * FROM EMPLOYEES
WHERE SALARY IN (SELECT SALARY FROM (SELECT DISTINCT SALARY FROM EMPLOYEES
                                     ORDER BY SALARY DESC)
                 WHERE ROWNUM <= 10);


-- Display all info for first 10 highest salary and who are in the JOB ID SA_MAN
SELECT * FROM EMPLOYEES
WHERE SALARY IN (SELECT SALARY FROM (SELECT DISTINCT SALARY FROM EMPLOYEES
                                     ORDER BY SALARY DESC)
                 WHERE ROWNUM <= 10) AND JOB_ID = 'SA_MAN';
