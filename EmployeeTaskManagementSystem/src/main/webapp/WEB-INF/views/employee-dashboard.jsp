<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
        }

        .container {
            width: 90%;
            margin: 40px auto;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        h2 {
            margin: 0;
            color: #2c3e50;
        }

        .buttons a {
            text-decoration: none;
            padding: 8px 15px;
            margin-left: 10px;
            border-radius: 5px;
            color: white;
        }

        .home-btn { background-color: #6c757d; }
        .add-btn { background-color: #28a745; }

        table {
            width: 100%;
            margin-top: 25px;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #34495e;
            color: white;
            padding: 12px;
        }

        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .action a {
            margin: 0 5px;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            color: white;
        }

        .edit-btn { background-color: #007bff; }
        .delete-btn { background-color: #dc3545; }
    </style>
</head>

<body>

<div class="container">

    <div class="header">
        <h2>Employee Management</h2>

        <div class="buttons">
            <a href="/EmployeeTaskManagementSystem/index.jsp" class="home-btn">Home</a>
            <a href="add" class="add-btn">+ Add Employee</a>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
            <c:choose>
                <c:when test="${not empty employees}">
                    <c:forEach var="emp" items="${employees}">
                        <tr>
                            <td>${emp.employeeId}</td>
                            <td>${emp.employeeName}</td>
                            <td>${emp.email}</td>
                            <td>${emp.department}</td>
                            <td>${emp.designation}</td>

                            <td class="action">
                                <a href="edit/${emp.employeeId}" class="edit-btn">Edit</a>
                                <a href="delete/${emp.employeeId}" 
                                   class="delete-btn"
                                   onclick="return confirm('Are you sure to delete?')">
                                   Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>

                <c:otherwise>
                    <tr>
                        <td colspan="6">No Employees Found</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

</div>

</body>
</html>