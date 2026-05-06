<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #eef2f3, #dfe9f3);
        }
        .card {
            border-radius: 12px;
        }
        .form-label {
            font-weight: 500;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Add Employee</h4>
                </div>

                <div class="card-body">

                    <form:form action="save" method="post" modelAttribute="employee">

                        <!-- Name -->
                        <div class="mb-3">
                            <label class="form-label">Employee Name</label>
                            <form:input path="employeeName" cssClass="form-control" placeholder="Enter full name" required="true"/>
                        </div>

                        <!-- Email -->
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <form:input path="email" cssClass="form-control" type="email" placeholder="Enter email" required="true"/>
                        </div>

                        <!-- Department -->
                        <div class="mb-3">
                            <label class="form-label">Department</label>
                            <form:input path="department" cssClass="form-control" placeholder="Enter department" required="true"/>
                        </div>

                        <!-- Designation -->
                        <div class="mb-3">
                            <label class="form-label">Designation</label>
                            <form:input path="designation" cssClass="form-control" placeholder="Enter designation"/>
                        </div>

                        <!-- Buttons -->
                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-success px-4">Save</button>
                            <a href="/EmployeeTaskManagementSystem/employee/list" class="btn btn-secondary px-4">Cancel</a>
                        </div>

                    </form:form>

                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>