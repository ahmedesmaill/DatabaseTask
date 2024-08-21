--Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
create table Employees (
ID INT,
Name varchar(50) ,
Salary decimal(10,2)

);



--Add a new column named "Department" to the "Employees" table with data type varchar(50).

alter table dbo.Employees
add Department varchar(50)




--Remove the "Salary" column from the "Employees" table.
alter table dbo.Employees
drop column Salary



--Rename the "Department" column in the "Employees" table to "DeptName".

EXEC sp_rename 'Employees.Department', 'DeptName', 'COLUMN';




--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table Projects(
ProjectID int,
ProjectName varchar(50)

);




--Add a primary key constraint to the "Employees" table for the "ID" column.

ALTER TABLE dbo.Employees
ALTER COLUMN ID int NOT NULL;

ALTER TABLE dbo.Employees
ADD PRIMARY KEY (ID);




--Create a foreign key relationship between the "Employees" table (referencing "ID") 
--and the "Projects" table (referencing "ProjectID")
ALTER TABLE dbo.Projects
add EmpolyeeID int 


ALTER TABLE dbo.Projects
ADD Constraint fk FOREIGN KEY (EmpolyeeID) REFERENCES Employees(ID);



 
--Remove the foreign key relationship between "Employees" and "Projects."

ALTER TABLE dbo.Projects
drop constraint fk





 --Add a unique constraint to the "Name" column in the "Employees" table.

 ALTER TABLE dbo.Employees
ADD CONSTRAINT uni UNIQUE (Name);

drop table dbo.customers





--Create a table named "Customers" with columns for CustomerID (integer), 
--FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
create table Customers (
CustomerID INT ,
FirstName varchar(50),
lastName varchar(50),
Email varchar(50) ,
Status varchar(50)

);






--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE dbo.Customers
ADD CONSTRAINT unii UNIQUE (FirstName,LastName);






--Add a default value of 'Active' for the "Status" column in the "Customers" table,
--where the default value should be applied when a new record is inserted.

ALTER TABLE Customers
ADD CONSTRAINT DF_status DEFAULT 'Active' FOR  Status with values;  -- with values from chat-gpt






--Create a table named "Orders" with columns for OrderID (integer),
--CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).


CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2)
);







--Add a check constraint to the "TotalAmount" column in the "Orders" table 
--to ensure that it is greater than zero.

ALTER TABLE dbo.Orders
ADD CONSTRAINT ta CHECK(TotalAmount > 0);

--Create a schema named "Sales" and move the "Orders" table into this schema.

 CREATE SCHEMA Sales;

 ALTER SCHEMA Sales TRANSFER dbo.Orders;
 





--Rename the "Orders" table to "SalesOrders

EXEC sp_rename 'Sales.Orders', 'SalesOrders';


