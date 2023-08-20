select *
from employees
join dept_emp using(emp_no)
join departments using(dept_no)
join salaries using(emp_no)
limit 10

select emp_no, first_name, last_name, departments.dept_name, departments.dept_no, round(AVG(salary),2) AS average_salary
from employees
join dept_emp using(emp_no)
join departments using(dept_no)
join salaries using(emp_no)
group by emp_no, departments.dept_name
LIMIT 100;

create temporary table department_labor_costs(
	dept_name char primary key,
	average_salary int,
	total_salaires int
)


