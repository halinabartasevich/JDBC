SELECT * FROM EMPLOYEES;

/*
    LKE
        - It works with the similar logic from String in Java
            -startsWith()
            -endsWith()
            -contains()
            -equals()

        % --- > pattern matching: any sequence fo characters
        _ --- > for matching any single character. (each underscore represent a single char)
>
NOTE: PostgreSQL provides the ILIKE operator, that acts exactly like the
 */

-- From employees, Display all employees whose firstname startsWith G
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'G%'; -- starts with

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'G'; -- equals to

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME = 'G'; -- equals to


-- From employees, Display all employees whose firstname endsWith 'g'
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%g';

-- From employees, Display all employees whose firstname endsWith 'a'
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%a';


--Display all employees whose firstname startsWith B and has 5 characters in total
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_____'; -- find all where firstname is 5 characters long

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'B____'; -- find all where firstname is 5 characters long starting with B

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_____' AND FIRST_NAME LIKE 'B%';

--Display 5 letters first names where the middle char is z
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__z__';

--Display 5 letters first names where there is z in middle anywhere
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%z%' AND FIRST_NAME LIKE '_____';

--Display first names where there is z in middle anywhere
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%z%';


-- Display first name where 2nd char is 'a'
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_a%';


-- from jobs, Display any/all job information with Job_title ends with Manager
SELECT * FROM JOBS
WHERE JOB_TITLE LIKE '%Manager'
ORDER BY JOB_TITLE ASC;
