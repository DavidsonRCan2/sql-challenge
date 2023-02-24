drop table departments;
drop table dept_emp;
drop table dept_manager;
drop table employees;
drop table salaries;
drop table titles;

create table departments (
	dept_no varchar (4) not null primary key,
	dept_name varchar (50) not null
	);
	
select * from departments

create table employees (
	emp_no int not null primary key,
	title_id varchar(20) not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	sex varchar(1) not null,
	hire_date date not null
	);
	
select * from employees

create table dept_emp (
	emp_no int not null,
	dept_no varchar(4) not null,
	foreign key (dept_no) references departments(dept_no)
	);
	
select * from dept_emp

create table titles (
	title_id varchar(5) not null primary key,
	title varchar(50) not null
	);
	
select * from titles

create table dept_manager (
	dept_no varchar (4) not null,
	emp_no int not null,
	foreign key (dept_no) references departments(dept_no)
	);

select * from dept_manager

create table salaries (
	emp_no int not null primary key,
	salary int not null
	);
	
select * from salaries

alter table employees
add foreign key (title_id) references titles(title_id);

alter table salaries
add foreign key (emp_no) references employees(emp_no);

alter table dept_emp
add foreign key (emp_no) references employees(emp_no);

alter table dept_manager
add foreign key (emp_no) references employees(emp_no);

select * from departments
select * from dept_emp limit 20
select * from dept_manager
select * from employees limit 20
select * from salaries
select * from titles

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on
employees.emp_no=salaries.emp_no;

select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

select dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from dept_manager
join departments on
dept_manager.dept_no = departments.dept_no
join employees on
dept_manager.emp_no = employees.emp_no

select dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees on
dept_emp.emp_no = employees.emp_no
join departments on
dept_emp.dept_no = departments.dept_no

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

select last_name, count(last_name) as "frequency count" 
from employees
group by last_name
order by count(last_name) desc;
