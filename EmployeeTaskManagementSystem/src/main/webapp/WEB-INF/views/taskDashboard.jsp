<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Task Dashboard</title>

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
            color: #2c3e50;
        }

        .btn {
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            margin-left: 10px;
        }

        .add-btn { background-color: #28a745; }
        .home-btn { background-color: #6c757d; }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #2c3e50;
            color: white;
            padding: 12px;
        }

        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .action a {
            margin: 0 5px;
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
            color: white;
        }

        .edit { background-color: #007bff; }
        .delete-btn { background-color: #dc3545; }
        .status { background-color: #ffc107; color: black; }
    </style>
</head>

<body>

<div class="container">

    <!-- HEADER -->
    <div class="header">
        <h2>Task Management</h2>

        <div>
            <a href="<c:url value='/task/add' />" class="btn add-btn">+ Add Task</a>
            <a href="<c:url value='/' />" class="btn home-btn">Home</a>
        </div>
    </div>

    <!-- TASK TABLE -->
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Priority</th>
            <th>Status</th>
            <th>Assigned Employee</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <c:choose>
            <c:when test="${not empty tasks}">
                <c:forEach var="t" items="${tasks}">
                    <tr>
                        <td>${t.taskId}</td>
                        <td>${t.taskTitle}</td>
                        <td>${t.description}</td>
                        <td>${t.priority}</td>
                        <td>${t.status}</td>

                        <td>
                            <c:choose>
                                <c:when test="${t.assignedEmployee != null}">
                                    ${t.assignedEmployee.employeeName}
                                </c:when>
                                <c:otherwise>
                                    Not Assigned
                                </c:otherwise>
                            </c:choose>
                        </td>

                        <td class="action">

                            <!-- EDIT -->
                            <a class="edit"
                               href="<c:url value='/task/edit/${t.taskId}' />">
                               Edit
                            </a>
                            
                            <!-- UPDATE STATUS -->
                            <a class="status"
                               href="<c:url value='/task/update-status/${t.taskId}' />">
                               Update Status
                            </a>

                            <!-- DELETE TASK -->
                            <a href="<c:url value='/task/delete/${t.taskId}' />" 
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
                    <td colspan="7">No Tasks Found</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

</div>

</body>
</html>