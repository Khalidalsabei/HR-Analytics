/*
                                     DATA CLEANING

IN This Data cleaning:

-.Examine the table structure
-.create a new table for cleaning
-.Standardization of data types.
-.Handling missing values.
-.Remove duplicates if any.




--Examine the table structure
                                                                                     */
SELECT *
FROM HRDataset_v14

/*

create a new table where I can manipulate and restructure the data without altering the original.     
 
 */

 SELECT*
 INTO HRData_cleaned
 FROM HRDataset_v14
 WHERE 1 = 0;
 
 --Fill in the data
 INSERT INTO HRData_cleaned
 SELECT *
 FROM HRDataset_v14;

 SELECT *
 FROM HRData_cleaned
 
 
 --.Standardization of data types.
UPDATE HRData_cleaned
SET DOB = CONVERT(DATE,DOB,101),
    DateofHire = CONVERT(DATE,DateofHire,101),
    LastPerformanceReview_Date = CONVERT(DATE, LastPerformanceReview_Date,101),
     DateofTermination = CONVERT(DATE,DateofTermination,101)
    ;


--.Handling missing values.
SELECT
  COUNT(*) AS total_rows
FROM HRData_cleaned;
UPDATE HRData_cleaned
SET EmpID = 0
WHERE EmpID IS NULL;




--.Remove duplicates if any.

SELECT 
EmpID, Employee_Name,
COUNT(*)
FROM HRData_cleaned
GROUP BY EmpID, Employee_Name
HAVING COUNT(*) > 1;

--Verify whether there is duplicates
SELECT *
FROM HRData_cleaned
WHERE EmpID = '10026'
AND Employee_Name = 'Adinolfi, Wilson  K';
--No duplicates found