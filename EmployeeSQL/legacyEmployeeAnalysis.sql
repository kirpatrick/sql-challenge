-- legacyEmployeeAnalysis.sql

-- Check data import
SELECT * FROM "DepartmentEmployees"
WHERE "DeptEmpl_ToDate" != '9999-01-01' :: date
-- DepartmentManager
-- Departments
-- Employees
-- Salaries
-- Titles
-- LIMIT 10