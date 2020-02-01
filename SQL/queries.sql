
--  Queries


-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
SELECT last_name, first_name, hire_date
FROM employees WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- a) Start and end dates as 'manager'
SELECT departments.dept_no, managers.emp_no, employees.last_name, employees.first_name, managers.from_date, managers.to_date
FROM departments 
JOIN managers ON departments.dept_no = managers.dept_no
JOIN employees ON managers.emp_no = employees.emp_no;

-- b) Start and end dates as employee with company
SELECT departments.dept_no, managers.emp_no, employees.last_name, employees.first_name,
    min(titles.from_date) as from_date, max(titles.to_date) as to_date
FROM departments 
JOIN managers ON departments.dept_no = managers.dept_no
JOIN employees ON managers.emp_no = employees.emp_no
JOIN titles ON employees.emp_no = titles.emp_no
GROUP BY departments.dept_no, managers.emp_no, employees.last_name, employees.first_name;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_employee.emp_no, employees.last_name, employees.first_name, departments.dprt_name
FROM dept_employee
JOIN employees ON dept_employee.emp_no = employees.emp_no
JOIN departments ON dept_employee.dept_no = departments.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_employee.emp_no, employees.last_name, employees.first_name, departments.dprt_name
FROM dept_employee
JOIN employees ON dept_employee.emp_no = employees.emp_no
JOIN departments ON dept_employee.dept_no = departments.dept_no
WHERE departments.dprt_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_employee.emp_no, employees.last_name, employees.first_name, departments.dprt_name
FROM dept_employee
JOIN employees ON dept_employee.emp_no = employees.emp_no
JOIN departments ON dept_employee.dept_no = departments.dept_no
WHERE departments.dprt_name = 'Sales' OR departments.dprt_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

