<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e3f2fd, #f8f9fa);
        }
        .card {
            border-radius: 12px;
        }
    </style>
</head>

<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">

            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Edit Task</h4>
                </div>

                <div class="card-body">

                    <form action="<c:url value='/task/update' />" method="post">

                        <!-- Task ID -->
                        <div class="mb-3">
                            <label class="form-label">Task ID</label>
                            <input type="text" class="form-control" value="${task.taskId}" readonly />
                            <input type="hidden" name="taskId" value="${task.taskId}" />
                        </div>

                        <!-- Title -->
                        <div class="mb-3">
                            <label class="form-label">Task Title</label>
                            <input type="text" class="form-control"
                                   name="taskTitle"
                                   value="${task.taskTitle}" required />
                        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" rows="3"
                                      name="description">${task.description}</textarea>
                        </div>

                        <!-- Priority -->
                        <div class="mb-3">
                            <label class="form-label">Priority</label>
                            <select name="priority" class="form-select">
                                <option value="LOW" ${task.priority == 'LOW' ? 'selected' : ''}>LOW</option>
                                <option value="MEDIUM" ${task.priority == 'MEDIUM' ? 'selected' : ''}>MEDIUM</option>
                                <option value="HIGH" ${task.priority == 'HIGH' ? 'selected' : ''}>HIGH</option>
                            </select>
                        </div>

                        <!-- Status -->
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select name="status" class="form-select">
                                <option value="PENDING" ${task.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                <option value="IN_PROGRESS" ${task.status == 'IN_PROGRESS' ? 'selected' : ''}>IN_PROGRESS</option>
                                <option value="COMPLETED" ${task.status == 'COMPLETED' ? 'selected' : ''}>COMPLETED</option>
                            </select>
                        </div>

                        <!-- Assign Employee -->
                        <div class="mb-3">
                            <label class="form-label">Assign To</label>

                            <select name="assignedEmployee.employeeId" class="form-select">
                                <option value="">-- Select Employee --</option>

                                <c:forEach var="emp" items="${employeeList}">
                                    <option value="${emp.employeeId}"
                                        ${emp.employeeId == task.assignedEmployee.employeeId ? 'selected' : ''}>
                                        ${emp.employeeName} - ${emp.department}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Buttons -->
                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary px-4">Update Task</button>
                            <a href="<c:url value='/task/list' />" class="btn btn-secondary px-4">Cancel</a>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>