/*
=====================================================================================================================
                               EXPLORATORY DATA ANALYSIS (EDA)
=====================================================================================================================

-Objective-
Understanding:

.Who are the employees? (Number, Gender, Ages, Departments).

.Current employees versus those whose services have ended.

.Salary range.

.Department and Gender distribution. 

.Age calculation and the average age.
---------------------------------------------------------------------------------------------------------------------

                                                                              */
 
 


--Examining the data.
select *
from HRData_cleaned


--Number of employees
SELECT COUNT(*) AS TotalEmployees
FROM HRData_cleaned;

  /* it shows 311 as TotalEmployees */


  --Current employees versus those whose services have ended.
  SELECT Termd, COUNT(*) AS Cnt
FROM HRData_cleaned
GROUP BY Termd;

/* The analysis showed that there are currently 207 employees,
while 104 employees have completed their service.*/


--Check for missing values
SELECT 
COUNT(*) AS TotalRows,
COUNT(Salary) AS Salary_NotNull,
COUNT(EngagementSurvey) AS Engagement_NotNull
FROM HRData_cleaned;

/* No missing values */



--Salary range
SELECT 
MIN(Salary) MinSalary,
MAX(Salary) MaxSalary,
AVG(Salary) AvgSalary
FROM HRData_cleaned;
/* The analysis showed 69000 as average salary*/


--Department distribution
SELECT Department, COUNT(*) Employees
FROM HRData_cleaned
GROUP BY Department
ORDER BY Employees DESC;
/* The analysis showed that the majority of employees are in the production department.*/


--Gender distribution
SELECT Sex, COUNT(*) Employees
FROM HRData_cleaned
GROUP BY Sex;
/*The analysis showed 176 females and 135 males */


--Age calculation
SELECT 
Employee_Name,
DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM HRData_cleaned
--Average Age
select 
AVG(DATEDIFF(YEAR,DOB,GETDATE())) AS Average_Age
from HRData_cleaned;
/*The analysis showed 47 is the average age*/