<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
        }

        .container {
            width: 400px;
            margin: 60px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        label {
            font-weight: 600;
            display: block;
            margin-top: 10px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[readonly] {
            background-color: #e9ecef;
        }

        button {
            width: 100%;
            margin-top: 20px;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: #6c757d;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Edit Employee</h2>

    <!-- FIXED ACTION -->
    <form action="<c:url value='/employee/update' />" method="post">

        <!-- ID (READ ONLY but still submitted via hidden field) -->
        <label>Employee ID</label>
        <input type="text"
               value="${employee.employeeId}"
               readonly />

        <input type="hidden"
               name="employeeId"
               value="${employee.employeeId}" />

        <label>Name</label>
        <input type="text"
               name="employeeName"
               value="${employee.employeeName}"
               required />

        <label>Email</label>
        <input type="email"
               name="email"
               value="${employee.email}"
               required />

        <label>Department</label>
        <input type="text"
               name="department"
               value="${employee.department}"
               required />

        <label>Designation</label>
        <input type="text"
               name="designation"
               value="${employee.designation}"
               required />

        <button type="submit">Update Employee</button>

    </form>

    <a href="<c:url value='/employee/list' />" class="back">← Back to Employee List</a>

</div>

</body>
</html>