SELECT * FROM EMPLOYEES;


/*
    Having
        - mostly used with group by

        - 1. with WHERE
                condition will apply before grouping


        - 2. with HAVING
                condition will apply after grouping
 */


-- find all the job ids where the salary is more than 5K
SELECT JOB_ID, SALARY FROM EMPLOYEES order by JOB_ID ;
SELECT JOB_ID, SALARY FROM EMPLOYEES WHERE SALARY > 5000 order by JOB_ID;

-- find all the job ids where the avg salary is more than 5K for each job id
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES WHERE SALARY > 6000 group by JOB_ID;
-- Finding everyone who is making more than 5K, then grouping them, then show avg
/*
    Seps
        1. find all job_id where salary is more than 5K (first where condition applied)
        2. find the avg salary for each job_id (grouping them by)


            IT_PROG,    9000.00
            IT_PROG,    6000.00
            IT_PROG,    4200.00
            IT_PROG,    4800.00
            IT_PROG,    4800.00

    ---------------------------------------
           IT_PROG,    9000.00
           IT_PROG,    6000.00
    ---------------------------------------
            AVG ----- > 15000 / 2 = 7500.00
 */



-- find all the job ids where the avg salary is more than 5K for each job id
-- Grouping them, find the avg bigger and 5 K
SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES group by JOB_ID HAVING AVG(SALARY) > 6000;

/*
    Seps
        1. Group them by
        2. Find the average
        3. then apply condition


            IT_PROG,    9000.00
            IT_PROG,    6000.00
            IT_PROG,    4200.00
            IT_PROG,    4800.00
            IT_PROG,    4800.00

    ---------------------------------------
           Sum - > 28800
           AVG - > 28800 / 5 - > 5760

 */

