-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/TlKAse

-- Drop Tables if Existing
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Schema

CREATE TABLE "departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dprt_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_employee" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "managers" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "gender" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

ALTER TABLE "dept_employee" 
ADD CONSTRAINT "fk_dept_employee_emp_no" 
    FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no")
    ON DELETE CASCADE;

ALTER TABLE "dept_employee" 
ADD CONSTRAINT "fk_dept_employee_dept_no" 
    FOREIGN KEY("dept_no")
    REFERENCES "departments" ("dept_no")
    ON DELETE CASCADE;

ALTER TABLE "managers" 
ADD CONSTRAINT "fk_managers_dept_no" 
    FOREIGN KEY("dept_no")
    REFERENCES "departments" ("dept_no")
    ON DELETE CASCADE;

ALTER TABLE "managers" 
ADD CONSTRAINT "fk_managers_emp_no" 
    FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no")
    ON DELETE CASCADE;

ALTER TABLE "salaries" 
ADD CONSTRAINT "fk_salaries_emp_no" 
    FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no")
    ON DELETE CASCADE;

ALTER TABLE "titles" 
ADD CONSTRAINT "fk_titles_emp_no" 
    FOREIGN KEY("emp_no")
    REFERENCES "employees" ("emp_no")
    ON DELETE CASCADE;

