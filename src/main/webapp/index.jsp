<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>Result Management System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f4f6f9;
}

.hero{
    background:linear-gradient(135deg,#1e3c72,#2a5298);
    color:white;
    padding:100px 20px;
    text-align:center;
}

.feature-card{
    border:none;
    border-radius:15px;
    box-shadow:0 5px 20px rgba(0,0,0,.1);
    transition:.3s;
}

.feature-card:hover{
    transform:translateY(-5px);
}

.footer{
    background:#1e3c72;
    color:white;
    text-align:center;
    padding:20px;
    margin-top:50px;
}

</style>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class="container">

<a class="navbar-brand" href="#">
Result Management System
</a>

</div>
</nav>

<section class="hero">

<h1 class="display-4 fw-bold">
Result Management System
</h1>

<p class="lead">
Manage Students, Subjects, Marks and Results Efficiently
</p>

<br>

<a href="login.jsp" class="btn btn-warning btn-lg">
Admin Login
</a>

<br><br>

<a href="studentLogin.jsp" class="btn btn-success btn-lg">
Student Login
</a>


</section>

<div class="container mt-5">

<h2 class="text-center mb-4">
Project Features
</h2>

<div class="row">

<div class="col-md-4 mb-4">
<div class="card feature-card p-4">

<h4>Student Management</h4>

<p>
Add, Edit, Delete and Search Student Records.
</p>

</div>
</div>

<div class="col-md-4 mb-4">
<div class="card feature-card p-4">

<h4>Marks Management</h4>

<p>
Enter Student Marks and Generate Results.
</p>

</div>
</div>

<div class="col-md-4 mb-4">
<div class="card feature-card p-4">

<h4>Reports & Analytics</h4>

<p>
Pass/Fail Report, Topper Report and Result Summary.
</p>

</div>
</div>

</div>

</div>

<div class="container mt-5">

<div class="card p-4">

<h3>About Project</h3>

<p>

This Result Management System is developed using
JSP, Servlets and Oracle Database.

The system helps administrators manage students,
subjects, marks and generate academic reports.

</p>

</div>

</div>

<div class="footer">

© 2026 Result Management System

</div>

</body>
</html>
