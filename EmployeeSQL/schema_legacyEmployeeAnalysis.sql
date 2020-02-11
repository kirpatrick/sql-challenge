-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/QuX6TW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "Depts_DepartmentNumber" VARCHAR   NOT NULL,
    "Depts_DepartmentName" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Depts_DepartmentNumber"
     )
);

CREATE TABLE "DepartmentEmployees" (
    "DeptEmpl_EmployeeNumber" INTEGER   NOT NULL,
    "DeptEmpl_DepartmentNumber" VARCHAR   NOT NULL,
    "DeptEmpl_FromDate" DATE   NOT NULL,
    "DeptEmpl_ToDate" DATE   NOT NULL
);

CREATE TABLE "DepartmentManager" (
    "DeptMgr_DepartmentNumber" VARCHAR   NOT NULL,
    "DeptMgr_EmployeeNumber" INTEGER   NOT NULL,
    "DeptMgr_FromDate" DATE   NOT NULL,
    "DeptMgr_ToDate" DATE   NOT NULL
);

CREATE TABLE "Employees" (
    "Employees_EmployeeNumber" INTEGER   NOT NULL,
    "Employees_Birthdate" DATE   NOT NULL,
    "Employees_FirstName" VARCHAR   NOT NULL,
    "Employees_LastName" VARCHAR   NOT NULL,
    "Employees_Gender" VARCHAR   NOT NULL,
    "Employees_HireDate" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employees_EmployeeNumber"
     )
);

CREATE TABLE "Salaries" (
    "Salaries_EmployeeNumber" INTEGER   NOT NULL,
	"Salaries_Salary" INTEGER   NOT NULL,
    "Salaries_FromDate" DATE   NOT NULL,
    "Salaries_ToDate" DATE   NOT NULL
);


ALTER TABLE public."Salaries"
ADD "Salaries_Salary" INTEGER;

CREATE TABLE "Titles" (
    "Titles_EmployeeNumber" INTEGER   NOT NULL,
    "Titles_Title" VARCHAR   NOT NULL,
    "Titles_FromDate" DATE   NOT NULL,
    "Titles_ToDate" DATE   NOT NULL
);

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_DeptEmpl_EmployeeNumber" FOREIGN KEY("DeptEmpl_EmployeeNumber")
REFERENCES "Employees" ("Employees_EmployeeNumber");

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_DeptEmpl_DepartmentNumber" FOREIGN KEY("DeptEmpl_DepartmentNumber")
REFERENCES "Departments" ("Depts_DepartmentNumber");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_DeptMgr_DepartmentNumber" FOREIGN KEY("DeptMgr_DepartmentNumber")
REFERENCES "Departments" ("Depts_DepartmentNumber");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_DeptMgr_EmployeeNumber" FOREIGN KEY("DeptMgr_EmployeeNumber")
REFERENCES "Employees" ("Employees_EmployeeNumber");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Salaries_EmployeeNumber" FOREIGN KEY("Salaries_EmployeeNumber")
REFERENCES "Employees" ("Employees_EmployeeNumber");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Titles_EmployeeNumber" FOREIGN KEY("Titles_EmployeeNumber")
REFERENCES "Employees" ("Employees_EmployeeNumber");

