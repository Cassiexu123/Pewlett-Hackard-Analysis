-- Template Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name
--INTO nameyourtable
FROM employees
ORDER BY emp_no DESC;

--Delivery 1 Step 1-7
SELECT  e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no= t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
--Step 9-12	
Select DISTINCT ON (emp_no) emp_no, first_name, last_name,title
INTO unique_titles
from retirement_titles
ORDER BY emp_no, to_date DESC;

--Step 15-20
SELECT COUNT(title),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
Select SUM(COUNT) from retiring_titles;

--Delivery 2 step 1- 
--Select * from dept_emp; 
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, t.title, de.from_date, de.to_date
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no= t.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no= de.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = '9999-01-01'
ORDER BY emp_no;

Select * from mentorship_eligibility;
Select COUNT(emp_no), title 
from mentorship_eligibility
GROUP BY title;