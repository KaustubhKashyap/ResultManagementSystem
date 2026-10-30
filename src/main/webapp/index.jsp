<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Result Management System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
    rel="stylesheet">

<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background: #f5f7fb;
        color: #243047;
    }

    .navbar {
        background: #101c36;
        padding: 16px 0;
    }

    .navbar-brand {
        font-size: 22px;
        font-weight: 700;
        letter-spacing: .3px;
    }

    .hero {
        background: linear-gradient(135deg, #10264f, #2459a6);
        color: white;
        padding: 100px 20px;
        text-align: center;
    }

    .hero h1 {
        font-size: clamp(34px, 5vw, 54px);
        font-weight: 800;
        margin-bottom: 18px;
    }

    .hero p {
        font-size: 18px;
        color: #e0eaff;
        margin-bottom: 32px;
    }

    .hero .btn {
        padding: 12px 25px;
        border-radius: 9px;
        font-weight: 600;
        margin: 7px;
    }

    .section-title {
        font-weight: 750;
        color: #172b4d;
    }

    .feature-card {
        border: none;
        border-radius: 16px;
        padding: 30px 24px;
        height: 100%;
        background: white;
        box-shadow: 0 6px 25px rgba(20, 40, 80, .07);
        transition: .3s ease;
    }

    .feature-card:hover {
        transform: translateY(-7px);
        box-shadow: 0 12px 30px rgba(20, 40, 80, .13);
    }

    .feature-icon {
        width: 58px;
        height: 58px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #eaf1ff;
        color: #2459a6;
        border-radius: 14px;
        font-size: 27px;
        margin-bottom: 20px;
    }

    .feature-card h4 {
        font-weight: 700;
        margin-bottom: 12px;
    }

    .feature-card p {
        color: #69758a;
        margin-bottom: 0;
        line-height: 1.7;
    }

    .about-card {
        background: white;
        border: none;
        border-radius: 16px;
        padding: 35px;
        box-shadow: 0 6px 25px rgba(20, 40, 80, .06);
        line-height: 1.8;
        color: #69758a;
    }

    .footer {
        background: #101c36;
        color: #cbd5e1;
        text-align: center;
        padding: 24px 15px;
        margin-top: 65px;
    }

    @media (max-width: 576px) {
        .hero {
            padding: 75px 15px;
        }

        .about-card {
            padding: 24px;
        }
    }
</style>
</head>

<body>

<nav class="navbar navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <i class="bi bi-mortarboard-fill me-2"></i>
            Result Management System
        </a>
    </div>
</nav>

<section class="hero">
    <div class="container">
        <h1>Smart & Simple Result Management</h1>

        <p>
            Manage Students, Subjects, Marks and Academic Results
            Efficiently in One Place.
        </p>

        <a href="login.jsp" class="btn btn-warning btn-lg">
            <i class="bi bi-person-lock me-2"></i>Admin Login
        </a>

        <a href="studentLogin.jsp" class="btn btn-success btn-lg">
            <i class="bi bi-mortarboard me-2"></i>Student Login
        </a>
    </div>
</section>

<section class="container py-5">
    <h2 class="section-title text-center mb-2">Project Features</h2>
    <p class="text-center text-secondary mb-5">
        Everything you need to manage academic records.
    </p>

    <div class="row g-4">

        <div class="col-md-4">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="bi bi-people-fill"></i>
                </div>
                <h4>Student Management</h4>
                <p>
                    Add, edit, delete and search student records
                    with an organized management system.
                </p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="bi bi-journal-check"></i>
                </div>
                <h4>Marks Management</h4>
                <p>
                    Enter student marks, manage subject records
                    and generate academic results efficiently.
                </p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="bi bi-bar-chart-fill"></i>
                </div>
                <h4>Reports & Analytics</h4>
                <p>
                    View pass/fail reports, topper reports
                    and academic result summaries.
                </p>
            </div>
        </div>

    </div>
</section>

<section class="container mt-3">
    <div class="about-card">
        <h3 class="section-title mb-3">About the Project</h3>

        <p>
            This Result Management System is developed using
            Java, JSP, Servlets and Oracle Database.
            It helps administrators manage students, subjects,
            marks and academic records through a centralized system.
        </p>
    </div>
</section>

<footer class="footer">
    <div class="container">
        <p class="mb-1">
            © 2026 Result Management System
        </p>
        <small>Designed for efficient academic management.</small>
    </div>
</footer>

</body>
</html>