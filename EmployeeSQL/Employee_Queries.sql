--**************DATA ANALYSIS*************--

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	e."emp_no"
	, e."last_name"
	, e."first_name"
	, e."sex"
	, s."salary"
FROM employees e
LEFT JOIN salaries s
ON (e."emp_no" = s."emp_no");

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	"first_name"
	, "last_name"
	, "hire_date"
FROM employees
WHERE "hire_date" ILIKE '%1986%';

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT 
 	m."dept_no" AS "Department_Number"
	, d."dept_name" AS "Department_Name"
	, m."emp_no" AS "Employee_Number"
	, e."last_name" AS "Last_Name"
	, e."first_name" AS "First_Name"
FROM dept_manager m
LEFT JOIN departments d
ON (m."dept_no" = d."dept_no")
LEFT JOIN employees e
ON (m."emp_no" = e."emp_no");

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT 
 	e."emp_no" AS "Employee_Number"
	, e."last_name" AS "Last_Name"
	, e."first_name" AS "First_Name"
	, de."dept_no" AS "Department_Number"
	, d."dept_name" AS "Department_Name"
FROM employees e
LEFT JOIN dept_emp de
ON (e."emp_no" = de."emp_no")
LEFT JOIN departments d
ON (de."dept_no" = d."dept_no");

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	"first_name" 
	, "last_name" 
	, "sex" 
FROM employees 
WHERE "first_name" ILIKE 'Hercules'
AND "last_name" LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
WITH sales_department AS(
SELECT 
 	e."emp_no" AS "Employee_Number"
	, e."last_name" AS "Last_Name"
	, e."first_name" AS "First_Name"
	, de."dept_no" AS "Department_Number"
	, d."dept_name" AS "Department_Name"
FROM employees e
LEFT JOIN dept_emp de
ON (e."emp_no" = de."emp_no")
LEFT JOIN departments d
ON (de."dept_no" = d."dept_no")
	)
SELECT 
	"Employee_Number"
	, "Last_Name"
	, "First_Name"
	, "Department_Name"
FROM sales_department
WHERE "Department_Name" ILIKE 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
WITH sales_development_department AS(
SELECT 
 	e."emp_no" AS "Employee_Number"
	, e."last_name" AS "Last_Name"
	, e."first_name" AS "First_Name"
	, de."dept_no" AS "Department_Number"
	, d."dept_name" AS "Department_Name"
FROM employees e
LEFT JOIN dept_emp de
ON (e."emp_no" = de."emp_no")
LEFT JOIN departments d
ON (de."dept_no" = d."dept_no")
	)
SELECT 
	"Employee_Number"
	, "Last_Name"
	, "First_Name"
	, "Department_Name"
FROM sales_development_department
WHERE "Department_Name" ILIKE 'Sales'
UNION ALL
SELECT 
	"Employee_Number"
	, "Last_Name"
	, "First_Name"
	, "Department_Name"
FROM sales_development_department
WHERE "Department_Name" ILIKE 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT  
	"last_name"
	, COUNT("last_name") AS "Count"
FROM employees
GROUP BY "last_name"
ORDER BY "Count" DESC;

