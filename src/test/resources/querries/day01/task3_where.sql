SELECT * FROM EMPLOYEES;

/*
    WHERE Statement
        - Returns condition applied result of the specified columns.

        - SELECT column names separated by comma FROM table name
          WHERE condition;
            = ' ';
            AND
            >
            <
            >=
            <=
            != , <>
 */

-- get me firstname,lastname,salary from employees where firstname is David
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES; -- returns all rows from columns: FIRST_NAME, LAST_NAME, SALARY from table: EMPLOYEES
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David'; -- data is case sensitive


SELECT LAST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David'; -- data is case sensitive


-- get me firstname,lastname,salary where firstname from employees is David and lastname is Lee
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE FIRST_NAME = 'David' AND LAST_NAME = 'Lee';
-- if (firstname.equalsIgnoreCase('David') && lastname.equalsIgnoreCase('Lee')



-- get me all information who is making salary more than 6000 in employees
SELECT * FROM EMPLOYEES
WHERE SALARY > 6000;

-- get me all information from employees who is making salary less than and equal 6000
SELECT * FROM EMPLOYEES
WHERE SALARY <= 6000;

-- get me all information from employees who is making salary equal to 6000
SELECT * FROM EMPLOYEES
WHERE SALARY = 6000;


-- get me all information from employees who is NOT making salary equal to 6000
SELECT * FROM EMPLOYEES
WHERE SALARY != 6000;

SELECT * FROM EMPLOYEES
WHERE SALARY <> 6000;


-- get me all information from employees who is firstName is David OR Lex
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME = 'David' OR FIRST_NAME = 'Lex';

