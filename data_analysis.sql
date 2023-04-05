-- Data Analysis 
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries
ON salaries.emp_no = employees.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date ASC;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT title, dm.dept_no, dept_name, dm.emp_no, last_name, first_name
FROM dept_managers AS dm
JOIN departments AS d
ON dm.dept_no = d.dept_no
JOIN employees AS e
ON dm.emp_no = e.emp_no
JOIN titles AS t
ON e.emp_title_id = t.title_id;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, d.dept_name, e.emp_no, last_name, first_name 
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
ORDER BY dept_no, emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, last_name, first_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
WHERE de.dept_no IN
	(SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales');
	
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) 
FROM employees
GROUP BY last_name
ORDER BY count DESC;