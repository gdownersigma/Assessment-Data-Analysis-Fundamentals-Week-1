-- A query that displays the full name of every employee, including their honorific, as employee_full_name.

-- Results should be ordered in descending order of employment year, with ties broken by sorting alphabetically by last name (ascending).

SELECT title_of_courtesy ||' '||first_name ||' '|| last_name AS employee_full_name
FROM employees
ORDER BY EXTRACT(YEAR FROM hire_date) DESC, last_name
;