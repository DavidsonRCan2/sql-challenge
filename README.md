# sql-challenge

drop table dept_manager

create table dept_emp (
	emp_no int,
	dept_no varchar (4),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

select * from departments
select * from dept_emp limit 20
select * from dept_manager
select * from employees limit 20
select * from salaries
select * from titles

create table dept_manager (
	dept_no varchar (4),
	emp_no int,
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;

select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

select dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from dept_manager
inner join departments on
dept_manager.dept_no = departments.dept_no
inner join employees on
dept_manager.emp_no = employees.emp_no

select dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
inner join employees on
dept_emp.emp_no = employees.emp_no
inner join departments on
dept_emp.dept_no = departments.dept_no

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

select employees.emp_no, employees.last_name, employees.first_name
from employees
inner join dept_emp on
employees.emp_no = dept_emp.emp_no
inner join departments on
dept_emp.dept_no = departments.dept_no;
where departments.dept_name = "Sales";

