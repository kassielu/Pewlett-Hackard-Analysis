SELECT 
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees e
INNER JOIN titles t on e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles rt
ORDER BY rt.emp_no, rt.from_date DESC;

-- Step 15
-- retrieve the number of employees by their most recent job title who are about to retire
SELECT count(distinct ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles ut
group by ut.title
order by count desc

-- Challenge 3
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
de.from_date, de.to_date,
t.title
INTO mentorship_eligibility
FROM employees e
LEFT JOIN dept_emp de on e.emp_no = de.emp_no
INNER JOIN titles t on e.emp_no = t.emp_no
WHERE de.to_date ='9999-01-01'
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no

commit;