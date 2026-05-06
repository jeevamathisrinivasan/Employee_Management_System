<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>

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
                <div class="card-header bg-dark text-white text-center">
                    <h4>Create Task</h4>
                </div>

                <div class="card-body">

                    <form:form action="saveTask" method="post" modelAttribute="task">

                        <!-- Task Title -->
                        <div class="mb-3">
                            <label class="form-label">Task Title</label>
                            <form:input path="taskTitle" cssClass="form-control" placeholder="Enter task title" required="true"/>
                        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <form:textarea path="description" cssClass="form-control" rows="3"/>
                        </div>

                        <!-- Priority Dropdown -->
                        <div class="mb-3">
                            <label class="form-label">Priority</label>
                            <form:select path="priority" cssClass="form-select" required="true" onsubmit="return validateForm()">
                            	<form:option value="">-- Select Priority --</form:option>
                                <form:option value="LOW">LOW</form:option>
                                <form:option value="MEDIUM">MEDIUM</form:option>
                                <form:option value="HIGH">HIGH</form:option>
                            </form:select>
                        </div>

                        <!-- Status Dropdown -->
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <form:select path="status" cssClass="form-select" required="true" onsubmit="return validateForm()">
                                <form:option value="">-- Select Status --</form:option>
                                <form:option value="PENDING">PENDING</form:option>
                                <form:option value="IN_PROGRESS">IN_PROGRESS</form:option>
                                <form:option value="COMPLETED">COMPLETED</form:option>
                            </form:select>
                        </div>

                        <!-- Assign To (Employee Dropdown) -->
						<div class="mb-3"> 
						<label class="form-label">Assign To</label> 
						<form:select path="assignedEmployee.employeeId" cssClass="form-select" required="true" onsubmit="return validateForm()"> 
						<form:option value="">-- Select Employee --</form:option> 
						<c:forEach var="emp" items="${employeeList}"> 
						<option value="${emp.employeeId}"> ${emp.employeeName} - ${emp.department} </option> </c:forEach> 
						</form:select> 
						</div>
           
                        <!-- Buttons -->
                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-success px-4">Save Task</button>
                            <a href="/EmployeeTaskManagementSystem/task/list" class="btn btn-secondary px-4">Cancel</a>
                        </div>

                    </form:form>

                </div>
            </div>

        </div>
    </div>
</div>

<script>
function validateForm() {

    var priority = document.querySelector("[name='priority']").value;
    var status = document.querySelector("[name='status']").value;
    var emp = document.querySelector("[name='assignedEmployee.employeeId']").value;

    if (priority === "" || status === "" || emp === "") {
        alert("Please select all required fields!");
        return false;
    }

    return true;
}
</script>

</body>
</html>