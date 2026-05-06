<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Task Status</title>

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
        <div class="col-md-6">

            <div class="card shadow-lg">
                <div class="card-header bg-warning text-dark text-center">
                    <h4>Update Task Status</h4>
                </div>

                <div class="card-body">

                    <form action="<c:url value='/task/update-status/${task.taskId}' />" method="post">

                        <!-- Task Title -->
                        <div class="mb-3">
                            <label class="form-label">Task Title</label>
                            <input type="text" 
                                   class="form-control"
                                   value="${task.taskTitle}" 
                                   readonly />
                        </div>

                        <!-- Current Status -->
                        <div class="mb-3">
                            <label class="form-label">Current Status</label>
                            <input type="text" 
                                   class="form-control"
                                   value="${task.status}" 
                                   readonly />
                        </div>

                        <!-- Change Status -->
                        <div class="mb-3">
                            <label class="form-label">Change Status</label>
                            <select name="status" class="form-select">
                                <option value="PENDING" ${task.status == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                <option value="IN_PROGRESS" ${task.status == 'IN_PROGRESS' ? 'selected' : ''}>IN_PROGRESS</option>
                                <option value="COMPLETED" ${task.status == 'COMPLETED' ? 'selected' : ''}>COMPLETED</option>
                            </select>
                        </div>

                        <!-- Buttons -->
                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-warning px-4">Update</button>
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