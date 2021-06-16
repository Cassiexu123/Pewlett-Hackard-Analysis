-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name
--INTO nameyourtable
FROM employees
ORDER BY emp_no DESC;
