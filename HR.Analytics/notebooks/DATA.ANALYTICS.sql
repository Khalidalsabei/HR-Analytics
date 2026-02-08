/*
======================================================================================================================
                                     DATA ANALYTICS
======================================================================================================================


-Objective-
.1.What is the attrition rate?
.2.Which department has the highest number of resignations?
.3.Average salary by department
.4.Best performing recruitment sources
.5.The relationship between job satisfaction and resignations
.6.Which managers are most likely to lose employees?
.7.Performance versus salary
.8.Who has a high absence rate?
----------------------------------------------------------------------------------------------------------------------

     
                                                                                                                          */




    
--1.What is the attrition rate?
SELECT 
CAST(SUM(CASE WHEN Termd = 1 THEN 1 ELSE 0 END) AS FLOAT) /
COUNT(*) * 100 AS AttritionRate
FROM HRData_cleaned;

/* The analysis showed that the attrition rate was 33% */





--2.Which department has the highest number of resignations?
SELECT Department, COUNT(*) Terminations
FROM HRData_cleaned
WHERE Termd = 1
GROUP BY Department
ORDER BY Terminations DESC;

/* The analysis showed that the production department had the highest number of resignations */





--3.Average salary by department
SELECT Department, AVG(Salary) AvgSalary
FROM HRData_cleaned
GROUP BY Department
ORDER BY AvgSalary DESC;





--4.Best performing recruitment sources
SELECT RecruitmentSource, AVG(EngagementSurvey) AvgEngagement
FROM HRData_cleaned
GROUP BY RecruitmentSource
ORDER BY AvgEngagement DESC;

/* The analysis showed that the best performing recruitment source is .On-line Web application. */





--5.The relationship between job satisfaction and resignations.
SELECT EmpSatisfaction, COUNT(*) Cnt
FROM HRData_cleaned
WHERE Termd = 1
GROUP BY EmpSatisfaction
ORDER BY EmpSatisfaction;

/* The analysis showed that most resignations came from employees with average to high satisfaction (3-5).
This indicates that the resignation was not due to dissatisfaction */





--6.Which managers are most likely to lose employees?
SELECT ManagerName, COUNT(*) Terminations
FROM HRData_cleaned
WHERE Termd = 1
GROUP BY ManagerName
ORDER BY Terminations DESC;

/* The analysis showed that managers: Dunn,Butler,Sullivan are most likely to lose employees */





--7.Performance versus salary
SELECT PerformanceScore, AVG(Salary) AvgSalary
FROM HRData_cleaned
GROUP BY PerformanceScore
ORDER BY AvgSalary DESC;

/* The analysis showed that the employees who have exceeds in there performance score have the highest average salaries */





--8.Who has a high absence rate?
SELECT Department, AVG(Absences) AvgAbsences
FROM HRData_cleaned
GROUP BY Department
ORDER BY AvgAbsences DESC;

/* The analysis showed that department: (sales) have the highest absence rate */




