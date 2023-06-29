-- -- legacyEmployeeAnalysis.sql

-- -- # Employee Salary Analysis

-- -- ### Researcher(s):  Kirpatrick Dorsey

-- -- ### Date:  February 15, 2020

-- -- ### Source(s):
-- -- [SMU Data Science Bootcamp - Postgres SQL Challenge](https://smu.bootcampcontent.com/SMU-Coding-Bootcamp/SMU-DAL-DATA-PT-11-2019-U-C/blob/master/02-Homework/09-SQL/Instructions/README.md)

-- -- ## Summary
-- -- Use PostgreSQL and Jupyter Notebook to analyze corporate historical data currently stored in multiple comma delimited (.csv) files.

-- -- See the README.md in the root directory for more information. 

-- -- /***********************************************************/
-- -- Import .csv data using pgAdmin import wizard.  E.g. Rt+Click table name and select Import/Export.

-- -- Check data import
-- SELECT COUNT (*) FROM
-- SELECT * FROM
-- DepartmentEmployees -- count=331603
-- DepartmentManager -- count=24
-- Departments -- count=9
-- Employees -- count=300024
-- Salaries -- count=300024
-- Titles -- count=443308

-- WHERE DeptEmpl_ToDate != '9999-01-01' :: date
-- LIMIT 10

-- -- OBSERVATIONS ----

-- -- I.
-- -- 300024 unique empl_IDs on employees and salaries tables
-- -- So employees to salaries should be 1-to-1
-- SELECT COUNT(DISTINCT employees_employeenumber)
-- FROM employees


-- -- /***********************************************************/
-- -- Data Analysis

-- -- 1.
-- -- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT
	e.employees_employeenumber,
	e.employees_lastname,
	e.employees_firstname,
	e.employees_gender,
	s.salaries_salary
FROM employees e
INNER JOIN salaries s ON
e.employees_employeenumber = s.salaries_employeenumber
ORDER BY e.employees_employeenumber


-- -- 2.
-- -- List employees who were hired in 1986.
SELECT * FROM employees
WHERE employees_hiredate::text LIKE '1986%'


-- -- 3.
-- -- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	dm.deptmgr_departmentnumber as deptNum,
	d.depts_departmentname as deptName,
	e.employees_employeenumber as mgrEmplNo,
	e.employees_lastname as mgrLastName,
	e.employees_firstname as mgrFirstName,
	dm.deptmgr_fromdate as startDate,
	dm.deptmgr_todate as endDate
FROM employees e
INNER JOIN departmentmanager dm ON
e.employees_employeenumber = dm.deptmgr_employeenumber
	LEFT JOIN departments d ON
	dm.deptmgr_departmentnumber = d.depts_departmentnumber
ORDER BY deptNum


-- -- 4.
-- -- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	e.employees_employeenumber as emplNo,
	e.employees_lastname as lastName,
	e.employees_firstname as firstName,
	d.depts_departmentname as deptName
FROM employees e
INNER JOIN departmentemployees de ON
e.employees_employeenumber = de.deptempl_employeenumber
	LEFT JOIN departments d ON
	de.deptempl_departmentnumber = d.depts_departmentnumber
ORDER BY emplNo


-- -- 5.
-- -- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE employees_firstname = 'Hercules'
	AND employees_lastname LIKE 'B%'
ORDER BY employees_lastname


-- -- 6.
-- -- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	e.employees_employeenumber as emplNo,
	e.employees_lastname as lastName,
	e.employees_firstname as firstName,
	d.depts_departmentname as deptName
FROM employees e
INNER JOIN departmentemployees de ON
e.employees_employeenumber = de.deptempl_employeenumber
	LEFT JOIN departments d ON
	de.deptempl_departmentnumber = d.depts_departmentnumber
WHERE d.depts_departmentname = 'Sales'


-- -- 7.
-- -- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.employees_employeenumber as emplNo,
	e.employees_lastname as lastName,
	e.employees_firstname as firstName,
	d.depts_departmentname as deptName
FROM employees e
INNER JOIN departmentemployees de ON
e.employees_employeenumber = de.deptempl_employeenumber
	LEFT JOIN departments d ON
	de.deptempl_departmentnumber = d.depts_departmentnumber
WHERE d.depts_departmentname IN ('Sales','Development')


-- -- 8.
-- -- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees_lastname,
	COUNT(employees_lastname) as lastnamecount
FROM employees
GROUP BY employees_lastname
ORDER BY lastnamecount DESC


-- -- /***********************************************************/
-- -- Bonus (Optional) -- -- 

-- -- Connect to salary data in Jupyter Notebook, using SQLAlchemy.  Generate a visualization to:
-- -- 1. Create a histogram to visualize the most common salary ranges for employees.
-- -- 2. Create a bar chart of average salary by title.

-- -- Solution Approach -- -- 

-- -- Create a view to join the 'title' and 'salaries' tables.
-- -- Aggregate salaries by title
-- CREATE VIEW vw_salary_range AS
	SELECT DISTINCT
		titles_title title,
		AVG(salaries_salary)::real AS avg_annual_salary
	FROM salaries s
	LEFT JOIN titles t ON
		s.salaries_employeenumber = t.titles_employeenumber
	GROUP BY title

		---	See the employeeSQL_salaryAnalysis.ipynb for histograms and bar charts ---