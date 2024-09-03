select * from hrdata

select sum(employee_count) from hrdata
---------------------------------------------
select sum(employee_count) from hrdata 
where education = 'High School'
----------------------------------------------
select sum(employee_count) from hrdata
where department = 'Sales'
-------------------------------------------
select sum(employee_count) from hrdata
where department = 'R&D'
-------------------------------------------
select sum(employee_count) as employee_count from hrdata
where education_field = 'Medical'
-----------------------------------------
select count(attrition) from hrdata
where attrition = 'Yes'
-------------------------------------------
select count(attrition) from hrdata
where attrition = 'Yes' and education = 'Doctoral Degree'
----------------------------------------------------------
select count(attrition) from hrdata
where attrition = 'Yes' and department = 'R&D'
--------------------------------------------------------
select count(attrition) from hrdata
where attrition = 'Yes' and department = 'R&D' and education_field = 'Medical' 
and education = 'High School'
-----------------------------------------------------------------
select round(((select count(attrition) from hrdata where attrition = 'Yes') / 
sum (employee_count))*100, 2) from hrdata
------------------------------------------------------------------------
select round(((select count(attrition) from hrdata where attrition = 'Yes') / 
sum (employee_count))*100, 2) from hrdata
where department = 'Sales'
------------------------------------------------------------------------
select count(attrition) from hrdata where attrition = 'Yes' and department = 'Sales'
----------------------------------------------------------------------------------
select sum(employee_count) - (select count(attrition) from hrdata  where attrition='Yes') from hrdata
-------------------------------------------------------------------------------
select sum(employee_count) - (select count(attrition) from hrdata  where attrition='Yes') 
from hrdata where gender = 'Male'
---------------------------------------------------------------------------------------------
select count(attrition) from hrdata  where attrition='Yes'
----------------------------------------------------------------
select sum(employee_count) - (select count(attrition) from hrdata  where attrition='Yes'
                             and gender = 'Male') 
from hrdata where gender = 'Male'
------------------------------------------------------------------------------
select avg(age) from hrdata
-------------------------------------------------
select round(avg(age),0) from hrdata
-----------------------------------------------
select gender,count (attrition) from hrdata
where attrition = 'Yes'
group by gender
order by count(attrition) desc
--------------------------------------------------
select gender,count (attrition) from hrdata
where attrition = 'Yes' and education = 'High School'
group by gender
order by count(attrition) desc
---------------------------------------------------------
select department, count(attrition) from hrdata 
where attrition = 'Yes'
group by department 
--------------------------------------------------------
select department, count(attrition) from hrdata 
where attrition = 'Yes'
group by department 
order by count(attrition) desc
-------------------------------------------------------
select department, count(attrition) , 
count(attrition) / (select count (attrition) from hrdata where attrition='Yes')
from hrdata
where attrition= 'Yes'
group by department 
order by count(attrition) desc 
---------------------------------------------------------------------
select department, count(attrition) , 
(count(attrition) / (select count (attrition) from hrdata where attrition='Yes'))*100
from hrdata
where attrition= 'Yes'
group by department 
order by count(attrition) desc 
---------------------------------------------------------------------------
select department, count(attrition), round((cast (count(attrition) as numeric) / 
(select count(attrition) from hrdata where attrition= 'Yes')) * 100, 2) as pct from hrdata
where attrition='Yes'
group by department 
order by count(attrition) desc;
-----------------------------------------------------------------------------
SELECT age,  sum(employee_count) AS employee_count FROM hrdata
GROUP BY age
order by age;
-----------------------------------------------------------------
SELECT age,  sum(employee_count) FROM hrdata
GROUP BY age
order by age
--------------------------------------------------------
SELECT age,  sum(employee_count) FROM hrdata
where department = 'R&D'
GROUP BY age
order by age
---------------------------------------------------------
select education_field,count(attrition) from hrdata
where attrition = 'Yes'
group by education_field
order by count(attrition) desc
----------------------------------------------------
select education_field,count(attrition) from hrdata
where attrition = 'Yes' and department = 'Sales'
group by education_field
order by count(attrition) desc
---------------------------------------------------
select age_band,gender, count(attrition), 
(count(attrition) / (select count(attrition) from hrdata where attrition = 'Yes' )
where attrition = 'Yes' 
group by age_band, gender
order by age_band , gender
------------------------------------------------
select age_band, gender, count(attrition) as attrition, 
round((cast(count(attrition) as numeric) / (select count(attrition) from hrdata where attrition = 'Yes')) * 100,2) as pct
from hrdata
where attrition = 'Yes'
group by age_band, gender
order by age_band, gender desc;
------------------------------------------------------------------------
select age_band,gender,sum(employee_count) from hrdata
group by age_band,gender
order by age_band,gender desc 


   

