select * from HR.Employees;
select * from HR.Departments;

select e.last_name,e.first_name,D.department_name,E.Salary
from HR.Employees E,HR.Departments D
where ( E.department_id = D.department_id) and Salary > 1800 ;

select e.last_name,e.first_name,D.department_name,E.Salary
from HR.Employees E,HR.Departments D
where ( E.department_id = D.department_id) and Salary between 1000 and 5100 
order by E.Salary;

select e.last_name,e.first_name,D.department_name,E.Salary
from HR.Employees E,HR.Departments D
where ( E.department_id = D.department_id) and Salary not in (2100,1600);

select e.last_name,e.first_name,D.department_name,E.Salary
from HR.Employees E,HR.Departments D
where ( E.department_id = D.department_id) and Salary in (2100,1600);

select e.last_name,e.first_name
from HR.employees e
where e.last_name like '_a%'

select sysdate from dual;

select e.last_name,e.first_name,floor(months_between(sysdate,e.hire_date) / 12) "Años De Servicio"
from HR.Employees e

-- inner join
select e.last_name,e.first_name,D.department_name,E.Salary,E.Email
from hr.Employees E inner join hr.Departments D on E.department_id = D.department_id
-- left join
select e.last_name,e.first_name,D.department_name,E.Salary,E.Email
from hr.Employees E left join hr.Departments D on E.department_id = D.department_id
-- right join
select e.last_name,e.first_name,D.department_name,E.Salary,E.Email
from hr.Employees E right join hr.Departments D on E.department_id = D.department_id
-- full join
select e.last_name,e.first_name,D.department_name,E.Salary,E.Email
from hr.Employees E full outer join hr.Departments D on E.department_id = D.department_id