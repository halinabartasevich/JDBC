
/*
    ORDER BY
        - clause allows you to sort the rows returned from the SELECT
          statement in ascending or descending order based on criteria specified.
    ASC
        - from low to high
    DESC
        - from high to low

 */

-- from employees, Display all information based on who is making more salary to low salary (from highest to lowest)
SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC;


-- from employees, Display all information based on who is making low salary to high salary (from lowest to highest)
SELECT * FROM EMPLOYEES
ORDER BY SALARY ASC;

SELECT * FROM EMPLOYEES
ORDER BY SALARY;  -- by default it sorts it in ascending order (ASC)


SELECT * FROM EMPLOYEES
ORDER BY 8; -- instead of column name, you can use the position index of the column (starts from 1)



-- Display all information from employees where employee id < 150 based on first name in alphabetical order
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID < 150
ORDER BY FIRST_NAME ASC;


--
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME ASC, LAST_NAME DESC;

-- Adam Zack
-- Adam Jake
