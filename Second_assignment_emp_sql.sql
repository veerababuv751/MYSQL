create  database second_assignment_db;
drop table if exists employee;
create table employee
(
employee_id  int primary key,
first_name	varchar(20),
last_name	char(1),
salary	int(20),
joining_date datetime ,
department varchar(20),
gender varchar(20),
job_title varchar(20)
);
select * from employee;
create table employee_tb  as select * from employee;
# Write a query to get all employee detail from "employee" table
select * from employee;
 # 5. Select only top 1 record from employee table
 select * from employee limit 1;
  #  7. How to select a random record from a table?  
select * from employee 
order by rand()
limit 1;
#  “first_name” in upper case as "first_name_upper"
select  upper(first_name) as first_name_upper from employee;
 # ‘first_name’ in lower case as ‘first_name_lower”
select lower(first_name) as first_name_lower from employee;
# Create a new column “full_name” by combining “first_name” & “last_name” with space as a separator.

select concat(first_name ," ", last_name) as full_name from employee;
 # Add 'Hello ' to first_name and display result
 select concat("Hello"," ", first_name) as greeting_name from employee;
 # Whose “first_name” is ‘Malli’
 select * from employee
 where first_name = "Malli";
#  Whose “first_name” present in ("Malli","Meena", "Anjali")
select * from employee
where first_name in ("Malli","Meena","Anjali");
# Whose “first_name” not present in ("Malli","Meena", "Anjali")
select  * from employee
where first_name not in ("Malli","Meena", "Anjali");
# Whose “first_name” starts with “v”
select * from employee
where first_name like "v%";
 # Whose “first_name” ends with “i
 select * from employee
 where first_name like "%i";
  # Whose “first_name” contains “o”
  select * from  employee
  where first_name like "%o%";
#    Whose "first_name" start with any single character between 'm-v'

  select * from employee 
  where first_name like '[m-v]%';
  # Whose "first_name" not start with any single character between 'm-v'
select * from employee
where first_name not like  '[m-v]%';
#   Whose "first_name" start with 'M' and contain 5 letters
select * from employee
where first_name like "M____";
# 10. Write a query to get all unique values of"department" from the employee table.
select distinct department from employee;
# 11. Query to check the total records present in a table.
select count(*) as total_records from employee;
# Write down the query to print first letter of a Name in Upper Case and all other letter in Lower Case.(EmployDetail table)

select concat(upper(left(first_name,1)) ,lower(substring(first_name,2))) as formatted_name from employee;
 # Write down the query to display all employee name in one cell separated by ','ex:-"Vikas, nikita, Ashish, Nikhil , anish"(EmployDetail table)
 
 select group_concat( first_name separator ',') as all_employees from employee;
 #14. Query to get the below values of "salary" from employee table
 # Lowest salary ,
select * from employee;
select min(salary) from employee;
select salary from employee
order by salary asc limit 1;
#  Highest salary
select max(salary) from employee;
#  Average salary
select avg(salary)  from employee;
#  Highest salary - Lowest salary as diff_salary
select (max(salary)-min(salary)) as diff_salary from employee;
# % of difference between Highest salary and lowest salary. (sample output format: 10.5%)
select 
concat(round(((max(salary)-min(salary))/min(salary))*100,1),'%') as percentage_difference from employee;
 select concat(round(((max(salary)-min(salary))/min(salary))*100,1),"%") as percentage_difference from employee;
 #  15. Select “first_name” from the employee table after removing white spaces from
#Right side spaces
select rtrim(first_name) as trimmed_first_name from employee;
# Left side spaces
select ltrim(first_name) as trimmed_first_name from employee;
select * from employee;
# Both right & left side spaces
select trim(first_name) as trimmed_first_name from employee;
#  16. Query to check no.of records present in a table where employees having 50k salary.
select count(*) from employee
where salary > 50000;
# 17. Find the most recently hired employee in each department.
select * from employee;

select department, first_name,joining_date from employee
group by 1,2,3
having joining_date = max(joining_date);
# Display first_name and gender as M/F.(if male then M, if Female then F) 1.
 select first_name,
  case
 when gender= 'male' then 'M'
 else 'F'
 end as gender_short
 from employee;

 #Display first_name, salary, and a salary category. (If salary is below 50,000, categorize as 'Low'; between 50,000 and 60,000 as 'Medium'; above 60,000 as 'High')
 
 select first_name,salary,
 case
 when salary <50000 then"low"
 when salary between 50000 and 60000 then "medium"
 else "high"
 end as salary_category
 from employee;
 #Display first_name, department, and a department classification. (If department is
# 'IT', display 'Technical'; if 'HR', display 'Human Resources'; if 'Finance', display
 #'Accounting'; otherwise, display 'Other'
 
 select first_name,department,
 case
 when department='IT' then 'Technical'
 when department= 'HR' then 'Human Resources'
 when department ='Finance' then 'Accounting'
 else 'other'
 end as department_classification
 from employee;
 # Display first_name, salary, and eligibility for a salary raise. (If salary is less than 50,000, mark as 'Eligible for Raise'; otherwise, 'Not Eligible'
 select first_name,salary,
 case
 when salary < 50000 then 'Eligible for Rise'
 else 'Not eligible'
 end as eligibilty_Salary_Rise
 from employee;
  
 # 4 Display first_name, joining_date, and employment status. (If joining date is before
 #'2022-01-01', mark as 'Experienced'; otherwise, 'New Hire')
 select first_name, joining_date,
 case
 when joining_date <'2022-01-01' then 'Experienced'
 else'New hire'
 end as Employment_status
 from employee;
 # Display first_name, salary, and bonus amount. (If salary is above 60,000, add10%
 # bonus; if between 50,000 and 60,000, add 7%; otherwise, 5%)
 select first_name,salary,
 case
 when salary > 60000 then  salary*0.10
 when salary between 50000 and 60000 then salary*0.07
 else salary*0.05
 end as bonus_amount
 from employee;
# 7 Display first_name, salary, and seniority level
# If salary is greater than 60,000, classify as 'Senior'; between 50,000 and 60,000 as'Mid-Level'; below 50,000 as 'Junior')
 select first_name,salary,
 case
 when salary >60000 then 'Senior'
 when salary between 50000 and 60000 then 'Mid-level'
 else 'junior'
 end as seniority_level
 from employee;
 #  Display first_name, department, and job level for IT employees. (If department is 'IT'
 # and salary is greater than 55,000, mark as 'Senior IT Employee'; otherwise, 'Other')
 select first_name,department,
 case 
 when department='IT' and salary > 55000 then 'Senior IT Employee'
 else 'Other'
 end as job_level_IT_employees
 from employee;
# Display first_name, joining_date, and recent joiner status. (If an employee joined
 # after '2024-01-01', label as 'Recent Joiner'; otherwise, 'Long-Term Employee' 
 select first_name,joining_date,
 case
 when joining_date > '2024-01-01' then 'Recent joiner'
 else 'Long-Term Employee'
 end as Recent_joiner_Status
 from employee;
 
  #13. Display first_name, joining_date, and leave entitlement. (If joined before '2021-01
   #    01', assign '10 Days Leave'; between '2021-01-01' and '2023-01-01', assign '20 Days
    #   Leave'; otherwise, '25 Days Leave'
    select first_name,joining_date,
    case
    when joining_date < '2021-01-01' then '10 Days Leave'
    when joining_date between '2021-01-01' and '2023-01-01' then '20 Days Leave'
    else '25 Days Leave'
    end as Leave_entitlement
    from employee;
   ## 14. Display first_name, salary, department, and promotion eligibility. (If salary is above
     # 60,000 and department is 'IT', mark as 'Promotion Eligible'; otherwise, 'Not Eligible'
    select first_name, salary,department,
    case
    when salary > 60000 and department ='IT' then 'Promotion Eligible'
    else'Not Eligible'
    end as Promotion_Eligibility
    from employee;
    
     #15. Display first_name, salary, and overtime pay eligibility. (If salary is below 50,000,
      # mark as 'Eligible for Overtime Pay'; otherwise, 'Not Eligible'
     select first_name, salary,
     case
     when salary <50000 then 'Eligible for Overpay'
     else 'Not Eligible'
     end as Overtime_pay_Eligiblity
     from employee ;
     # 16. Display first_name, department, salary, and job title. (If department is 'HR' and salary
      # is above 60,000, mark as 'HR Executive'; if department is 'Finance' and salary is above
      # 55,000, mark as 'Finance Manager'; otherwise, 'Regular Employee')
     select first_name,department,salary,
     case
     when department ='HR' and salary >60000 then 'HR Executive'
     when department ='Finance' and salary>55000 then 'Finance Manager'
     else 'Regular Employee'
     end as Job_Title
     from employee;
     
    # 17. Display first_name, salary, and salary comparison to the company average. (If salary is 
     # above the company’s average salary, mark as 'Above Average'; otherwise, 'Below Average')
     
     select first_name,salary,
     case
     when salary > (select avg(salary) from employee) then 'Above Average'
     else 'Below Average'
     end as Salary_comparison_comp_avg
     from employee;
  #Write the query to get the department and department wise total(sum) salary, display it in ascending and descending order according to salary.  
  select department,sum(salary) as total_salary from employee
  group by department
  order by total_salary asc ;
  
    select department,sum(salary) as total_salary from employee
  group by department
  order by total_salary desc;
  
  #  Write down the query to fetch Project name assign to more than one Employee 2.
select * from employee;

#Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "employee table" table. 

select department, count(department),sum(salary) as total_salary  from employee
group by department;
#Get the department-wise salary details from the "employee table" table: 4.
 # What is the average salary? (Order by salary ascending)
 # What is the maximum salary? (Order by salary ascending
select department, avg(salary) as avg_salary from employee
group by department
order by avg_salary asc;

select department, max(salary) as max_salary from employee
group by department
order by max_salary asc ; 
# Display department-wise employee count and categorize based on size. (If a department
  #   has more than 5 employees, label it as 'Large'; between 3 and 5 as 'Medium'; otherwise,'Small')
  select * from employee;
    select department , count(employee_id) as employee_count, 
    case 
    when count(employee_id) > 5 then 'large'
    when count(employee_id) between 3 and 5 then 'Medium'
    else 'Small'
    end as department_size
    from employee
    group by department;
    # Display department-wise average salary and classify pay levels. (If the average salary in a
    # department is above 60,000, label it as 'High Pay'; between 50,000 and 60,000 as 'Medium Pay'; otherwise, 'Low Pay').
    
     select department, avg(salary) as avg_salary , 
     case
     when avg(salary) > 60000 then 'High Pay'
     when avg(salary)  between 50000 and 60000 then 'Medium Pay'
     else 'Low pay'
     end as pay_Levels
     from employee
     group by department;
     
    # 7. Display department, gender, and count of employees in each category. (Group by department and gender, showing total employees in each combination)
    select department,gender,count(employee_id) as employee_count from employee
    group by 1,2;
    # 8. Display the number of employees who joined each year and categorize hiring trends. (If a
    # year had more than 5 hires, mark as 'High Hiring'; 3 to 5 as 'Moderate Hiring'; otherwise,'Low Hiring'
    
    select year(joining_date) as join_year,count(employee_id) as join_count,
    case
    when count(employee_id) >5 then 'High Hiring'
    when count(employee_id) between 3 and 5 then 'Moderate Hiring'
    else 'Low Hiring'
    end as hiring_trend
    from employee
    group by year(joining_date) 
    order by join_year;
    select * from employee;
    # Display department-wise highest salary and classify senior roles. (If the highest salary in a
    # department is above 70,000, label as 'Senior Leadership'; otherwise, 'Mid-Level')
    select department,max(salary) as highest_salary,
    case
    when (select department from employee where salary > 70000) then 'Senior Leadership'
    else 'Mid-Level'
    end as senior_roles
    from employee
    group by department;
    
  #  Display department-wise count of employees earning more than 60,000. (Group
     #  employees by department and count those earning above 60,000, labeling departments with more than 2 such employees as 'High-Paying Team')  
  select   department ,count(employee_id) as employee_cnt,
  case
  when count(employee_id) >2 then 'High PayingTeam'
  else 'Normal Paying Team'
  end as team_category
  from employee
  where salary > 60000
  group by department;
  # Query to extract the below things from joining_date column. (Year, Month, Day, CurrentDate) 
  
    select joining_date,
    year(joining_date) as joining_year,
    month(joining_date) as joining_month,
    day(joining_date) as joining_day,
    current_date() as cur_date
    from employee;
   # Create two new columns that calculate the difference between joining_date and the
 #   current date. One column should show the difference in months, and the other should show the difference in days
 select joining_date,
 timestampdiff(month,joining_date,curdate()) as diff_in_months,
 datediff(curdate() , joining_date) as diff_in_days
 from employee;
   # Get all employee details from the employee table whose joining year is 2020 
   select first_name, employee_id  from employee
   where year(joining_date)=2020;
   select * from employee;
   select first_name,employee_id from employee
   where month(joining_date)= 02;
   describe employee;
    # Get all employee details from employee table whose joining date between "2021-01-01 0and "2021-12-01"
    select * from employee
    where joining_date between "2021-01-01"and "2021-12-01";
    
    select department,count(*) as emp_cnt,
    case 
    when count(*) > 1 then 'departmnt'
    else 'no'
    end as employee_dept
    from employee
    where count(*) >1
    group by department;
    
    
 # Get the employee name and project name from the "employee table" and "ProjectDetail" for employees who have been assigned a project, sorted by first name  
    
    select * from  project;
   select first_name,project_name 
   from employee  as e inner join project as p
   on e.employee_id=p.emp_id_no
   order by first_name;
# Get the employee name and project name from the "employee table" and
 #"ProjectDetail" for all employees, including those who have not been assigned a project,sorted by first name.
 select * from employee;
 select first_name as employee_name,project_name 
 from employee as e left join project as p 
 on e.employee_id=p.emp_id_no
 order by  first_name;
 
  # Get the employee name and project name from the "employee table" and
 #"ProjectDetail" for all employees. If an employee has no assigned project, display "-N0 Project Assigned," sorted by first name
 
 select first_name as employee_name,
 case
 when p.project_name is null then 'NO Project is assigned'
 else p.project_name
 end as project_name
 from employee e left join project p
 on e.employee_id=p.emp_id_no
 order by e.first_name;
 
 # Get all project names from the "ProjectDetail" table, even if they are not linked to any
 # employee, sorted by first name from the "employee table" and "ProjectDetail" table.
 
 select e.first_name,p.project_name
 from employee as e left join project as p
 on e.employee_id=p.emp_id_no
 union
 select e.first_name,p.project_name
 from employee as e right join project as p
 on e.employee_id=p.emp_id_no
 order by  first_name, project_name;
 
 # Find the project names from the "ProjectDetail" table that have not been assigned to any employee using the "employee table" and "ProjectDetail" table.
 select  