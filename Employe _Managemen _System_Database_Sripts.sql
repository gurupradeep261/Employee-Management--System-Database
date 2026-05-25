
--Employee Management System Database

--Step 1 Create Database 2026-04-14 Time: 11:05

Create Database EmployeeManagementDB

---Department Table

Create Table Department(
   DepartmentID INT PRIMARY KEY,
   DeparmentName NVarchar(50)
);

 ---Step 2 Employees (Master Table)

CREATE TABLE Employees (
   EmployeeID INT PRIMARY KEY,
   FirstName NVarchar(50),
   LastName NVarchar(50),
   Gender NVarchar(10),
   DateOfBirth DATE,
   PhoneNumber NVarchar(15),
   Email NVarchar(100),
   Addrees NVarchar(200),
   DepartmentID INT,
   JobRole NVarchar(50),
   Salary DECIMAL(10,2),
   HireDate DATE,
   ManagersID INT,
   Status NVarchar(20),

   CONSTRAINT FK_EMPLOYEES_PK_DEPARTMENT
   FOREIGN KEY(DepartmentID)
   REFERENCES Department(DepartmentID)
);
 
 
 ---Step 3 Attendances Table 2026-04-15 Time:11:00

CREATE TABLE Attendances (
   AttendanceID INT PRIMARY KEY,
   EmployeeID INT,
   AttendanceDate DATE,
   Status NVarchar(20),
   

   CONSTRAINT FK_Attendances_pk_Employee
   FOREIGN KEY (EmployeeID)
   References Employees(EmployeeID)
);

   -- Step 4 Create payroll Table

      Create Table Payrolls(
          PayrollID INT PRIMARY KEY,
          EmployeeID INT,
          Salary DECIMAL(10,2),

     CONSTRAINT FK_Payrolls_PK_Employee
     Foreign key(EmployeeID)
     References Employees(EmployeeID)
    );

    --Step 5 Create LeaveDetails Table

    Create Table LeaveDetailes(
       LeaveID INT,
       EmployeeID INT,
       LeaveType Varchar(30),

       Constraint FK_LeaveDetailes_PK_Employee
       Foreign Key(EmployeeID)
       References Employees(EmployeeID)
    );

    

    --2026-o4-16 A-11.37
   --- step 6 Create EmployeeProject Table

    Create Table EmployeeProject1(
        EmployeeProjectID INT Primary key,
        EmployeeID INT,
        ProjectName Varchar(50),

        Constraint FK_EmployeeProject1_Employee
        Foreign Key(EmployeeID)
        References Employees(EmployeeID)
    );
       
       Select * From EmployeeProject1 ;

       

       --Step 7:Create LoginUsers Table

       Create Table LoginUsers1(
             UserID Int Primary Key,
             EmployeeID INT,
             UserName Varchar(50),
             Password varchar(50),

        Constraint FK_LoginUsers1_Employee
        Foreign Key(EmployeeID)
        References Employees(EmployeeID)
    );
       
       Select * From LoginUsers1 ;

        

   --Step 8: Create Performance Table

   Create Table Performances(
      PerformanceID INT Primary key,
      EmployeeID INT,
      Rating Varchar(10),

  Constraint FK_Performances_Employee
  Foreign Key(EmployeeID)
  References Employees(EmployeeID)
);
  
  Select * From Performances ;




 ---Step 9: Create Training Table

   Create Table Training1(
      Training INT Primary Key,
      EmployeeID INT,
      CourseName Varchar(50),

    Constraint FK_Training1_Employee
    Foreign Key(EmployeeID)
    References Employees(EmployeeID)
);
      Select * From Training1 ; 

      Drop Table Training 



                   

     ---Real - Time Connection Flow
            
            --Department
                 --
             --Employee
                --
            --Attendance
            --Payroll
            --LeaveDetails
            --EmployeeProject
            --LoginUsers
            --Permance
            --Training
               
  
    --- Step 10: Insert Department Data
      
   
  Insert Into Department values (1,'HR'),
                               (2,'Testing'),
                               (3, 'DataBase'),
                                (4, 'IT');
      
            
            select * from department

            sp_help department

--- Step 11: Insert Into Employee Data
    
        Insert Into Employees 
        (
        EmployeeID,
        FirstName,
        LastName,
        Gender,
        DateOfBirth,
        PhoneNumber,
        Email,
        Addrees,
        DepartmentID,
        JobRole,
        Salary,
        HireDate,
        ManagersID,
        Statuss
        )

        Values

        (101, 'Rahul', 'Sharma', 'male',
        '2001-03-12',
        '9807654321',
        'rahul@company.com',
        'Hyderbad',
        1,
        'BackEnd Developer',
         40000.00,
        '2025-04-10',
        201,
        'Active'),
        
     (102, 'Suresh', 'Kumar', 'Male',
     '2002-03-12',
     '9807654322',
     'suresh@company.com',
     'Bangalore',
     2,
     'HR Exective',
     45000.00,
     '2023-03-10',
     202,
     'Active'),

     (103, 'Anil', 'Reddy', 'Male',
     '1999-09-15',
     '9087634523',
     'anil@company.com',
     'Chennia',
     3,
     'QA Tester',
     48000.00,
     '2022-06-10',
     203,
     'Active');
                                          
                                             
     --- Step 12 : Insert Attendance Data
    
     Insert Into Attendances  
     (
        AttendanceID,
        EmployeeID,
        AttendanceDate,
        Status
    )
     Values
     (1, 101, '2026-05-10', 'Present'),
     (2, 102,  '2026-05-10', 'Absent'),
     (3, 103,  '2026-05-10', 'Present');

     

                                             Select * From Attendances  
---- Step 13: Insert Payroll Data          

    Insert Into Payrolls
    (
    PayrollID,
    EmployeeID,
    Salary 
    )
    Values

    (1,101,50000.00),
    (2,102,40000.00),
    (3,103,60000.00);
                                     select * from Payroll 
     
---Step 14: Insert LeavesDetails Data
   
   Insert Into LeaveDetailes   Values
   (1, 101,'Sick Leave');

--- Step 15: Insert EmployeeProject Data

 Insert Into EmployeeProject Values
 (1, 101, 'Banking App'),
 (2, 102, 'Banking App');

---Step 16: Insert LoginUser Data
  
  Insert Into LoginUsers1  Values
  (1, 101, 'Rahul123', 'rahul@123'),
  (2, 102, 'Suresh123', 'Suresh@123');
                                            select * from LoginUsers 

--- Step 17: Insert Performance Data
   
 Insert Into Performances  Values
 (1, 101, 'A'),
 (2, 102, 'B');

--- Step 18: Insert Training Data
   
Insert Into Training1  Values
(1, 101, 'Sql Training'),
(2, 102, 'Sql Training');


---Final Real - Time Data Flow

---Department - Employee - All Connected Tables


-- Date :2026-05-22 Time:14:09

----Real-Time Company Join Query

      --- EMPLOYEE
            --
        -- Department
         ---Attendence
        ---Pyroll
        --LeaveDetails
        --Employeeproject
        --LoginUsers
        --Performance
        --Training



       

      
 
        
        --- All Tables Data

        Select * From Employees ;
        select * from Department ;
        select * from Attendances ;
        select * from Payrolls ;
        Select * From LeaveDetailes;
        select * from LoginUsers1 ;
        select * from Performances ;
        select * from Training1 ;

 






































