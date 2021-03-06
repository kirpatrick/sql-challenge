# sql-challenge
HR Data Analysis

### Researcher
Kirpatrick Dorsey

### Created
February 15, 2020

## Project Overview
Use PostgreSQL and Jupyter Notebook to analyze corporate historical data currently stored in multiple comma delimited (.csv) files.

## Skill(s) Demonstrated
- Data Modeling
- Data Engineering
- Data Analysis

## Analysis Detail
- Employee Details List:  employee number, last name, first name, gender, and salary

- Employees Hired in 1986

- Department Manager List:  department number, department name, manager's employee number, last name, first name, and start and end employment dates

- Department Employee List:  employee number, last name, first name, and department name

- Employees whose First Name is "Hercules" and Last Names begin with "B"

- Employees in the Sales Department:  employee number, last name, first name, and department name

- All employees in the Sales and Development Departments:  employee number, last name, first name, and department name

- List the frequency count of Employee Last Names, i.e., how many employees share each last name... (In descending order)

## **Optional Analysis*
Data Validation using Pandas (histogram and bar chart visualizations)

## Solution
1. Install dependencies listed in the Tech Stack.
2. Clone this repository to your development environment.
3. Use the [schema_legacyEmployeeAnalysis.sql](https://github.com/kirpatrick/sql-challenge/blob/master/EmployeeSQL/schema_legacyEmployeeAnalysis.sql) file to create the necessary tables.  See the [Legacy Employee ERD](https://github.com/kirpatrick/sql-challenge/blob/master/EmployeeSQL/Legacy_Employee_ERD.png) and [Legacy Employee Entites Description](https://github.com/kirpatrick/sql-challenge/blob/master/EmployeeSQL/Legacy_Employee_Entites.pdf) for an explanation of table relationships.
4. Upload the (.csv) files in the [data](https://github.com/kirpatrick/sql-challenge/tree/master/EmployeeSQL/data) directory to the SQL tables created in step 3.
5. Execute the SQL queries in [legacyEmployeeAnalysis.sql](https://github.com/kirpatrick/sql-challenge/blob/master/EmployeeSQL/legacyEmployeeAnalysis.sql) for [analysis detail](#Analysis-Detail) results.
6. Use your local copy of [employeeSQL_salaryAnalysis.ipynb](https://nbviewer.jupyter.org/github/kirpatrick/sql-challenge/blob/master/EmployeeSQL/employeeSQL_salaryAnalysis.ipynb) to connect PostgreSQL to view the [optional analysis](#Optional-Analysis) results.

## Source
[SMU DS Boot Camp - SQL Challenge](https://smu.bootcampcontent.com/SMU-Coding-Bootcamp/SMU-DAL-DATA-PT-11-2019-U-C/tree/master/02-Homework/09-SQL/Instructions)

## Tech Stack
- [PostgreSQL 12.1 + pgAdmin 4.16](https://www.postgresql.org/)
- [QuickDBD](https://app.quickdatabasediagrams.com/#/)
- [Git 2.17.1](https://git-scm.com/downloads)
- [Python 3.7.4 / Pandas 0.25.1](https://www.anaconda.com/distribution/)
- [Jupyter nbviewer](https://nbviewer.jupyter.org/)
