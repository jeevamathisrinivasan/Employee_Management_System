<!DOCTYPE html>
<html>
<head>
    <title>Employee & Task Management System</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f7fa;
        }

        header {
            background-color: #34495e;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            display: flex;
            justify-content: center;
            gap: 40px;
            margin-top: 80px;
        }

        .card {
            width: 300px;
            padding: 30px;
            text-align: center;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        h2 {
            margin-bottom: 20px;
        }

        p {
            color: #555;
            margin-bottom: 25px;
        }

        a {
            text-decoration: none;
        }

        button {
            padding: 10px 20px;
            border: none;
            background-color: #3498db;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<header>
    <h1>Employee & Task Management System</h1>
</header>

<div class="container">

    <!-- Employee Management -->
    <div class="card">
        <h2>Employee Management</h2>
        <p>Add, view, update and delete employee records.</p>

        <a href="employee/list">
            <button>Go to Employees</button>
        </a>
    </div>

    <!-- Task Management -->
    <div class="card">
        <h2>Task Management</h2>
        <p>Create tasks, assign employees and track status.</p>

        <a href="task/list">
            <button>Go to Tasks</button>
        </a>
    </div>

</div>

</body>
</html>