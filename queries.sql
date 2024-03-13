-- Retrieve employee information including employee number, last name, first name, sex, and salary
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        e.sex,
        s.salary
FROM employees AS e
    LEFT JOIN salaries AS s
    ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- Fetch first name, last name, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Retrieve department manager information with department number, department name, employee number, last name, and first name
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name
FROM dept_manager AS dm
    INNER JOIN departments AS d
    ON dm.dept_no = d.dept_no
    INNER JOIN employees AS e
    ON dm.emp_no = e.emp_no;

-- Retrieve employee information including employee number, last name, first name, and department name
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
    INNER JOIN departments AS d
    ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

-- Fetch employees named Hercules with last name starting with 'B'
SELECT first_name, last_name, birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Retrieve employees in the Sales department with employee number, last name, first name, and department name
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
    INNER JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- Retrieve employees in Sales and Development departments with employee number, last name, first name, and department name
SELECT  e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e
    INNER JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
    INNER JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- Fetch the frequency counts of employee last names in descending order
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
