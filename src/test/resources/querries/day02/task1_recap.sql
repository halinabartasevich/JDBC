SELECT * FROM EMPLOYEES;

--  From jobs, Display all information  where job title President ,Sales Manager, Finance Manager
SELECT * FROM JOBS
WHERE JOB_TITLE = 'President' OR JOB_TITLE = 'Sales Manager' OR JOB_TITLE = 'Finance Manager';


SELECT * FROM JOBS
WHERE JOB_TITLE IN ('President', 'Sales Manager', 'Finance Manager');

-- Display all Departments that does NOT have manager_id in departments table
SELECT * FROM DEPARTMENTS
WHEre manager_ID IS NULL;

-- Display all Departments that have manager_id in departments table
SELECT * FROM DEPARTMENTS
WHEre manager_ID IS NOT NULL;


--  Display all Locations where country id is US or UK from Locations table
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID IN ('US', 'UK');


--  Display all Locations where country id is NOT US or UK from Locations table
SELECT * FROM LOCATIONS
WHERE COUNTRY_ID NOT IN ('US', 'UK', 'IT');


--  Display all Countries in Region_ID of 10 and Country_Name NOT Belgium, from Countries table
SELECT * FROM COUNTRIES
WHERE REGION_ID = 10;

SELECT * FROM COUNTRIES
WHERE REGION_ID = 10 AND COUNTRY_NAME != 'Belgium';

SELECT * FROM COUNTRIES
WHERE REGION_ID = 10 AND COUNTRY_NAME <> 'Belgium';

SELECT * FROM COUNTRIES
WHERE REGION_ID = 10 AND COUNTRY_NAME NOT IN ('Belgium');