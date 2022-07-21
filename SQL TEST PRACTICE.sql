USE NELITO

CREATE TABLE WORKER(WORKER_ID INT NOT NULL PRIMARY KEY IDENTITY ,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INT,
JOINING_DATE DATE,
DEPARTMENT CHAR(25));

--SET IDENTITY_INSERT WORKER ON

DROP TABLE WORKER
SELECT * FROM WORKER

INSERT INTO WORKER 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '2000-02-20', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '2014-06-11', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '2014-02-20', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '2014-02-20', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '2014-06-11', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '2014-06-11', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '2014-01-20', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '2014-04-11','Admin');


CREATE TABLE BONUS (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATE,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES WORKER (WORKER_ID)
        ON DELETE CASCADE
);

SELECT * FROM BONUS

INSERT INTO BONUS 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '2016-02-20'),
		(002, 3000, '2017-06-11'),
		(003, 4000, '2018-02-20'),
		(001, 4500, '2019-02-20'),
		(002, 3500, '2020-06-11');

CREATE TABLE TITLE (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATE,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES WORKER(WORKER_ID)
        ON DELETE CASCADE
);
SELECT * FROM TITLE

INSERT INTO TITLE 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 '),
 (002, 'Executive', '2017-06-11'),
 (008, 'Executive', '2018-06-11'),
 (005, 'Manager', '2019-06-11'),
 (004, 'Asst. Manager', '2020-06-11'),
 (007, 'Executive', '2021-06-11'),
 (006, 'Lead', '2022-06-11'),
 (003, 'Lead', '2023-06-11');

 --1 Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME FROM WORKER 

SELECT * FROM WORKER

--Write an SQL query to fetch unique values of DEPARTMENT from Worker table
 SELECT DISTINCT DEPARTMENT FROM WORKER

--3 Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
 SELECT SUBSTRING (FIRST_NAME,1,3) AS EXTRACTSTRING FROM WORKER

--4 Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

  SELECT CHARINDEX('A','AMITABH')  AS POSITION	

--5 Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

SELECT RTRIM ( FIRST_NAME) FROM WORKER ;

--6 Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT LEN (DEPARTMENT) FROM WORKER

-- 7Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table 
--into a single column COMPLETE_NAME. A space char should separate them.

SELECT CONCAT(FIRST_NAME,' ', LAST_NAME,' ') AS 'COMPLETE_NAME' FROM WORKER

--8 Write an SQL query to print all Worker details from the Worker table order by 
--FIRST_NAME Ascending and DEPARTMENT Descending.

SELECT FIRST_NAME  FROM WORKER ORDER BY  FIRST_NAME ASC 
SELECT DEPARTMENT FROM WORKER ORDER BY  DEPARTMENT DESC

--9 Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table
SELECT * FROM WORKER WHERE FIRST_NAME  IN ('VIPUL', 'SATISH')


--10 Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('VIPUL', 'SATISH')

--11 Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”

SELECT * FROM WORKER WHERE DEPARTMENT LIKE 'ADMIN%'

--12 Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%A%'

--13 Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

SELECT * FROM WORKER WHERE FIRST_NAME LIKE '_____H'

--14 Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

SELECT SALARY FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000

--15 Write an SQL query to print details of the Workers WHO HAVE JOINED IN FEB 2014

SELECT * FROM WORKER WHERE YEAR(JOINING_DATE)= 2014 AND MONTH(JOINING_DATE)= 2 AND DAY (JOINING_DATE)=20

--------------------------------------------2-------------------------------------------------------------
SELECT * FROM CUSTOMERS
--1 QUERY TO DISPLAY FIRST NAME
SELECT SUBSTRING (CONTACTNAME,1,CHARINDEX(' ' ,CONTACTNAME)) FIRSTNAME FROM CUSTOMERS

---------------------------------------
--QUERY TO DISPLAY LAST NAME

SELECT SUBSTRING (CONTACTNAME, CHARINDEX(' ' ,CONTACTNAME)+1, LEN(CONTACTNAME)) LASTNAME FROM CUSTOMERS
---------------------------------------

--3 DISPLAY ALL RECORDS WHOSE IS CONSISTING OF rd or road in address column

SELECT COUNT (*) FROM CUSTOMERS WHERE CHARINDEX ('RD',ADDRESS)>0 OR CHARINDEX('ROAD',ADDRESS)>0			--COUNT HOW MANY RD OR ROAD

---------------------------------------
--4 display domainname from email address like gmail,hotmail etc

SELECT EMAIL, RIGHT(EMAIL,CHARINDEX('@', REVERSE(EMAIL))-1) FROM CUSTOMERS

--5 display number of employees in every domain

SELECT CONTACTNAME, COUNT(*) FROM CUSTOMERS GROUP BY CONTACTNAME

SELECT * FROM CUSTOMERS

-----------------------------------------------------------------------------------

CREATE TABLE DEPTMASTER (
	DEPTID INT PRIMARY KEY, 
	DEPTNAME VARCHAR(30)
);

INSERT INTO DEPTMASTER VALUES 
	(100,'SALES'),
	(200,'PURCHASE'),
	(300,'PROGRAMMING'),
	(400,'ACCOUNTS');



	SELECT * FROM EMPLOYEE
	SELECT * FROM DEPTMASTER
----------------------------------------------------
--1. make a procedure in sql ,which will input 1 parameter OF integer type
--AND ANOTHER OF VARCHAR(20) and INSERT RECORD IN EMPLOYEE TABLE(COLUMNS ARE ID AND NAME)

CREATE PROC INSERT_NAME
	@EMPID INT,
	@NAME VARCHAR(20)
AS
	BEGIN
	INSERT INTO EMPLOYEE (ID, EMPNAME) VALUES (@EMPID, @NAME)
	END;

EXEC INSERT_NAME 107, 'KAUSTUBH';

---------------------------------------------------------------------------------------------------------------
--2. make a procedure in sql which will take 2 parameter 1 input integer type  and another output  varchar type 
--we will pass id and input parameter and it must returns name as ouptut paramter 

CREATE PROC GET_EMPLOYEE_NAME
	@ID INT, @NAME VARCHAR(20) OUTPUT
AS
	BEGIN
	SELECT @NAME = EMPNAME FROM EMPLOYEE WHERE ID =@ID
	RETURN 0
	END;

DECLARE @MY_NAME VARCHAR(20);
EXEC GET_EMPLOYEE_NAME 101, @MY_NAME OUTPUT;
PRINT @MY_NAME;

---------------------------------------------------------
CREATE PROC PR 
AS 
	BEGIN
	PRINT 'PROC CALLING'
	END;

EXEC PR;

--------------------------------------------------------------------------------------

--3. write a trigger in sql which will
--for insert if the name is blank and salary is less than 10000 then 
--It must NOT allow to inserT the record in the table and display appropriate message 

CREATE TRIGGER CHECK_INSERT ON EMPLOYEE
	FOR INSERT
AS
	DECLARE @NAME VARCHAR(20)
	DECLARE @SAL INT
	SELECT @SAL = SALARY, @NAME = EMPNAME FROM INSERTED
		IF @NAME IS NULL OR @sal<10000 
		BEGIN
			PRINT 'DATA CANNOT BE INSERTED :- NAME IS NULL OR CONDITION 2:- SALARY IS LESS THAN 10000'
			ROLLBACK TRAN
		END ;

		SELECT *  FROM EMPLOYEE
INSERT INTO EMPLOYEE VALUES (107,70000,'SATISH','THANE',300)

INSERT INTO EMPLOYEE VALUES (107,70000,NULL,'THANE',300)

INSERT INTO EMPLOYEE VALUES (108,70000,'  ','THANE',300)



