--  Data Engineering
CREATE TABLE departments 
	(dept_no VARCHAR(30) NOT NULL PRIMARY KEY, 
	 dept_name VARCHAR(30) NOT NULL);
SELECT * FROM departments;

CREATE TABLE titles
	(title_id VARCHAR(30) NOT NULL PRIMARY KEY,
	 title VARCHAR(30) NOT NULL);
SELECT * FROM titles;

CREATE TABLE employees
	(emp_no INT NOT NULL PRIMARY KEY,
	 emp_title_id VARCHAR(30) NOT NULL,
	 FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	 birth_date VARCHAR(30) NOT NULL,
	 first_name VARCHAR(30) NOT NULL,
	 last_name VARCHAR(30) NOT NULL,
	 sex VARCHAR(30) NOT NULL,
	 hire_date DATE);
SELECT * FROM employees;
	 
CREATE TABLE dept_emp
	(emp_no INT NOT NULL,
	 FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	 dept_no VARCHAR(30) NOT NULL,
	 FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
SELECT * FROM dept_emp;

CREATE TABLE dept_managers
	(dept_no VARCHAR(30) NOT NULL,
	 FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	 emp_no INT NOT NULL,
	 FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
SELECT * FROM dept_managers;

CREATE TABLE salaries
	(emp_no INT NOT NULL,
	 FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	 salary INT NOT NULL);
SELECT * FROM salaries;
