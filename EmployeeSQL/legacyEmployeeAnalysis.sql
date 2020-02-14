-- legacyEmployeeAnalysis.sql

---- Check data import ----
-- SELECT COUNT (*) FROM
-- SELECT * FROM
-- DepartmentEmployees -- count=331603
-- DepartmentManager -- count=24
-- Departments -- count=9
-- Employees -- count=300024
-- Salaries -- count=300024
-- Titles -- count=886616

-- WHERE DeptEmpl_ToDate != '9999-01-01' :: date
-- LIMIT 10

---- OBSERVATIONS ----

---- I.
--- 300024 unique empl_IDs on employees and salaries tables
--- So employees to salaries should be 1-to-1
-- SELECT COUNT(DISTINCT employees_employeenumber)
-- FROM employees


---- Data Analysis ----
-- Once you have a complete database, do the following:


---- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
-- SELECT  -- count(*) -- 300024 records
-- 	e.employees_employeenumber,
-- 	e.employees_lastname,
-- 	e.employees_firstname,
-- 	e.employees_gender,
-- 	s.salaries_salary
-- FROM employees e
-- INNER JOIN salaries s ON
-- e.employees_employeenumber = s.salaries_employeenumber
-- ORDER BY e.employees_employeenumber


---- 2. List employees who were hired in 1986.
-- -- SELECT COUNT(*) FROM employees -- 36150 records
-- SELECT * FROM employees
-- WHERE employees_hiredate::text LIKE '1986%'


---- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- SELECT -- count(*) -- 24 records; matches departmentmanager records count
-- 	dm.deptmgr_departmentnumber as deptNum,
-- 	d.depts_departmentname as deptName,
-- 	e.employees_employeenumber as mgrEmplNo,
-- 	e.employees_lastname as mgrLastName,
-- 	e.employees_firstname as mgrFirstName,
-- 	dm.deptmgr_fromdate as startDate,
-- 	dm.deptmgr_todate as endDate
-- FROM employees e
-- INNER JOIN departmentmanager dm ON
-- e.employees_employeenumber = dm.deptmgr_employeenumber
-- 	LEFT JOIN departments d ON
-- 	dm.deptmgr_departmentnumber = d.depts_departmentnumber
-- ORDER BY deptNum


---- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- SELECT --count(*) -- 331603 records; Matches DepartmentEmployees record count
-- 	e.employees_employeenumber as emplNo,
-- 	e.employees_lastname as lastName,
-- 	e.employees_firstname as firstName,
-- 	d.depts_departmentname as deptName
-- FROM employees e
-- INNER JOIN departmentemployees de ON
-- e.employees_employeenumber = de.deptempl_employeenumber
-- 	LEFT JOIN departments d ON
-- 	de.deptempl_departmentnumber = d.depts_departmentnumber
-- ORDER BY emplNo


---- 5. List all employees whose first name is "Hercules" and last names begin with "B."
-- SELECT * FROM employees
-- WHERE employees_firstname = 'Hercules'
-- 	AND employees_lastname LIKE 'B%'
-- ORDER BY employees_lastname


---- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- SELECT
-- 	e.employees_employeenumber as emplNo,
-- 	e.employees_lastname as lastName,
-- 	e.employees_firstname as firstName,
-- 	d.depts_departmentname as deptName
-- FROM employees e
-- INNER JOIN departmentemployees de ON
-- e.employees_employeenumber = de.deptempl_employeenumber
-- 	LEFT JOIN departments d ON
-- 	de.deptempl_departmentnumber = d.depts_departmentnumber
-- WHERE d.depts_departmentname = 'Sales'


---- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- SELECT
-- 	e.employees_employeenumber as emplNo,
-- 	e.employees_lastname as lastName,
-- 	e.employees_firstname as firstName,
-- 	d.depts_departmentname as deptName
-- FROM employees e
-- INNER JOIN departmentemployees de ON
-- e.employees_employeenumber = de.deptempl_employeenumber
-- 	LEFT JOIN departments d ON
-- 	de.deptempl_departmentnumber = d.depts_departmentnumber
-- WHERE d.depts_departmentname IN ('Sales','Development')


---- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- SELECT employees_lastname,
-- 	COUNT(employees_lastname) as lastnamecount
-- FROM employees
-- GROUP BY employees_lastname
-- ORDER BY lastnamecount DESC


---- ## Bonus (Optional) ----

---- As you examine the data, you are overcome with a creeping suspicion that the dataset is fake. You surmise that your boss handed you spurious data in order to test the data engineering skills of a new employee. To confirm your hunch, you decide to take the following steps to generate a visualization of the data, with which you will confront your boss:

---- 1. Import the SQL database into Pandas. (Yes, you could read the CSVs directly in Pandas, but you are, after all, trying to prove your technical mettle.) This step may require some research. Feel free to use the code below to get started. Be sure to make any necessary modifications for your username, password, host, port, and database name:
--    ```sql
--    from sqlalchemy import create_engine
--    engine = create_engine('postgresql://localhost:5432/<your_db_name>')
--    connection = engine.connect()
--    ```
-- * Consult [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.
-- * If using a password, do not upload your password to your GitHub repository. See [https://www.youtube.com/watch?v=2uaTPmNvH0I](https://www.youtube.com/watch?v=2uaTPmNvH0I) and [https://martin-thoma.com/configuration-files-in-python/](https://martin-thoma.com/configuration-files-in-python/) for more information.

--- Design (Plan of attack) ---
--- a. Decide what data will be needed.
-- -- 		salary
--- b. Create a Summary query of the data that is needed.  Goal:  Do as much joining & aggregation in SQL as possible.
--- c. Decide if you need to create a 'View' or 'Physical' table of the Summary.  Goal:  Makes sure this will work in Jupyter Notebook.
--- d. Make the connection to the Summary data in Jupyter Notebook.

---- 2. Create a histogram to visualize the most common salary ranges for employees.
		---	See the Jupyter Notebook ---

---- 3. Create a bar chart of average salary by title.
		---	See the Jupyter Notebook ---