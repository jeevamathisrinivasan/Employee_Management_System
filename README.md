# Employee Task Management System

A Spring MVC-based web application designed to manage employees and their assigned tasks efficiently. The system demonstrates a complete CRUD workflow, layered architecture, and MySQL integration using Hibernate (JPA).

It allows administrators to manage employees and assign tasks with real-time status tracking.

---

## KEY FEATURES

### Employee Management
- Add new employee  
- View employee list  
- Update employee details  
- Delete employee  

### Task Management
- Create new task  
- Assign task to employee  
- View task list  
- Update task details  
- Update task status (PENDING / IN_PROGRESS / COMPLETED)  
- Delete task  

### Relationship Handling
- One-to-Many relationship (Employee → Tasks)  
- If employee is deleted → assigned tasks become unassigned (NULL handling)

---

## PROJECT STRUCTURE

src/main/java  
└── com.assessment.taskmanagement  
  ├── controller → Handles HTTP requests  
  ├── service → Business logic layer  
  ├── dao → Database operations (JPA/Hibernate)  
  ├── model → Entity classes  
  └── config → Configuration classes  

---

## TECH STACK

- Java  
- Spring MVC  
- JSP  
- Maven  
- Apache Tomcat  
- MySQL  
- Hibernate (JPA)  

---

## SETUP INSTRUCTIONS

### 1 Clone the Project
git clone https://github.com/your-username/Employee_Management_System.git

OR import into Eclipse:
File → Import → Existing Maven Project

---

### 2 Database Setup (MySQL)
CREATE DATABASE employee_db;
USE employee_db;

---

### 3 Table Creation (Optional)

If `hibernate.hbm2ddl.auto=update` is enabled, tables are auto-generated.

Employee Table:
CREATE TABLE employee (
    employeeId INT NOT NULL AUTO_INCREMENT,
    employeeName VARCHAR(255),
    email VARCHAR(255),
    department VARCHAR(255),
    designation VARCHAR(255),
    PRIMARY KEY (employeeId)
);

Task Table:
CREATE TABLE task (
    taskId INT NOT NULL AUTO_INCREMENT,
    taskTitle VARCHAR(255),
    description VARCHAR(255),
    priority VARCHAR(255),
    status VARCHAR(255),
    assignedEmployee_employeeId INT,
    PRIMARY KEY (taskId),
    CONSTRAINT FK_task_employee
    FOREIGN KEY (assignedEmployee_employeeId)
    REFERENCES employee(employeeId)
    ON DELETE SET NULL
);

---

### 4 Configure Database Connection

Update persistence.xml:

<property name="javax.persistence.jdbc.driver" value="com.mysql.cj.jdbc.Driver"/>
<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/employee_db"/>
<property name="javax.persistence.jdbc.user" value="root"/>
<property name="javax.persistence.jdbc.password" value="root"/>
<property name="hibernate.hbm2ddl.auto" value="update"/>

---

### 5 Run the Application

Using Eclipse + Tomcat:
- Right click project  
- Run on Server  
- Choose Apache Tomcat 10+  
- Start server  

---

### 6 Access Application

http://localhost:8080/EmployeeTaskManagementSystem/

---

## APPLICATION FLOW

### Employee Flow
- Add employee  
- View employee list  
- Edit employee details  
- Delete employee  
- If employee deleted → tasks become unassigned  

### Task Flow
- Create task  
- Assign employee  
- View tasks  
- Update status  
- Delete task  

---
