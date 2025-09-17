SELECT * FROM EMPLOYEES;

   SELECT * FROM DEPARTMENTS;
/*
    MULTILINE Comment
 */

-- SINGLE LINE COMMENT

/*
    NOTE:
        SQL syntax is NOT CASE SENSITIVE
        Table names are NOT CASE SENSITIVE
        Column Names are NOT CASE SENSITIVE
            Ex: SelECT * FroM EMPLOyEEs;
        * ---> mean all columns


        Shortcut to run
            - Bring curser to the end of the line
            - Press Ctrl + Enter or Cmd + Enter
 */


/*
    SELECT Statement
    SELECT column names separated by comma FROM table name
 */

-- return all columns from employees table
SelECT * FroM EMPLOyEEs;
SELECT * FROM employees;

-- return specific column from given table
SELECT FIRST_NAME FROM EMPLOYEES;
SELECT FIRST_NAme FROM EMPLOYEES;

-- return specific multiple columns from given table
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES;
SELECT LAST_NAME, FIRST_NAME FROM EMPLOYEES;
SELECT FIRST_NAME, LAST_NAME,SALARY FROM EMPLOYEES;