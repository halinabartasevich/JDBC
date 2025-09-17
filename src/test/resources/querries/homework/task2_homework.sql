SELECT  * FROM LOCATIONS;
SELECT * FROM EMPLOYEES;

--Part 2 -- Sting Functions (Concat), Subquery, ROWNUM,

-- 1. display full addresses from locations table in a single column
SELECT DISTINCT STREET_ADDRESS || ', ' || POSTAL_CODE || ', '  ||CITY ||  ', '  || COUNTRY_ID FROM LOCATIONS;

-- 2. display all informations of the employee who has the minimum salary in employees table
    SELECT * FROM EMPLOYEES WHERE SALARY = (SELECT MIN (SALARY) FROM  EMPLOYEES);

-- 3. display the second minimum salary from the employees
SELECT  DISTINCT MIN (SALARY) FROM EMPLOYEES ORDER BY SALARY;   -- 1st MIN salary
SELECT MIN(SALARY) AS SECOND_MIN_SALARY FROM EMPLOYEES
WHERE SALARY > (SELECT  MIN (SALARY) FROM EMPLOYEES); -- 2ND MIN


-- 4. display all informations of the employee who has the second minimum salary
SELECT * FROM EMPLOYEES WHERE SALARY = (SELECT MIN(SALARY) AS SECOND_MIN_SALARY FROM EMPLOYEES
                                        WHERE SALARY > (SELECT  MIN (SALARY) FROM EMPLOYEES));

-- 5. list all the employees who are making above the average salary;
SELECT  ROUND (AVG(SALARY),2) FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE  SALARY > (SELECT  ROUND (AVG(SALARY),2) FROM EMPLOYEES);

-- 6. list all the employees who are making less than the average salary
SELECT * FROM EMPLOYEES WHERE  SALARY < (SELECT  ROUND (AVG(SALARY),2) FROM EMPLOYEES);

-- 7. display manager name of 'Neena'
    SELECT * FROM EMPLOYEES;
    SELECT MANAGER_ID, FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE 'Neena';


-- 8. find the 3rd maximum salary from the employees table (do not include duplicates)
SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY  SALARY DESC;

SELECT DISTINCT SALARY FROM (SELECT DISTINCT SALARY
                             FROM EMPLOYEES
                             ORDER BY  SALARY DESC)
WHERE ROWNUM <=3;


SELECT MIN(SALARY) AS THIRD_MAX_SALARY
FROM (
         SELECT DISTINCT SALARY
         FROM EMPLOYEES
         ORDER BY SALARY DESC
     )
WHERE ROWNUM <= 3;


-- 9. find the 5th maximum salary from the employees table (do not include duplicates)

SELECT MIN(SALARY) AS FIFTH_MAX_SALARY
FROM (
         SELECT * FROM (SELECT  DISTINCT  SALARY FROM EMPLOYEES
                        ORDER BY SALARY DESC )
         WHERE ROWNUM <=5);


-- 10. find the 7th maximum salary from the employees table (do not include duplicates)

SELECT MIN(SALARY) AS SEVENTH_MAX_SALARY
FROM (
         SELECT * FROM (SELECT  DISTINCT  SALARY FROM EMPLOYEES
                        ORDER BY SALARY DESC )
         WHERE ROWNUM <=7);

-- 11. find the 10th maximum salary from the employees table (do not include duplicates)

    SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY  SALARY DESC;

    SELECT  * FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY  SALARY DESC)
    WHERE ROWNUM <=10;

SELECT MIN(SALARY) AS TENTH_MIN_SALARY
FROM
    (SELECT  * FROM (SELECT DISTINCT SALARY
                     FROM EMPLOYEES ORDER BY  SALARY DESC)
                         WHERE ROWNUM <=10);


-- 12. find the 3rd minimum salary from the employees table (do not include duplicates)
SELECT MAX(SALARY) AS THIRD_MIN_SALARY
FROM
    (SELECT  * FROM (SELECT DISTINCT SALARY
                     FROM EMPLOYEES ORDER BY  SALARY ASC)
     WHERE ROWNUM <=3);


-- 13. find the 5th minimum salary from the employees table (do not include duplicates)
SELECT MAX(SALARY) AS FIFTH_MIN_SALARY
FROM
    (SELECT  * FROM (SELECT DISTINCT SALARY
                     FROM EMPLOYEES ORDER BY  SALARY ASC)
     WHERE ROWNUM <=5);


-- 14. find the 7th maximum salary from the employees table (do not include duplicates)
SELECT MIN(SALARY) AS SEVENTH_MAX_SALARY
FROM
    (SELECT  * FROM (SELECT DISTINCT SALARY
                     FROM EMPLOYEES ORDER BY  SALARY DESC )
     WHERE ROWNUM <=7);

-- 15. find the 10th maximum salary from the employees table (do not include duplicates)
SELECT MIN(SALARY) AS TENTH_MAX_SALARY
FROM
    (SELECT  * FROM (SELECT DISTINCT SALARY
                     FROM EMPLOYEES ORDER BY  SALARY DESC )
     WHERE ROWNUM <=10);