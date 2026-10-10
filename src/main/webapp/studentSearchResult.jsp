<%@ page import="com.rms.model.Student" %>

<%
Student s = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Student Details - Result Management System</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    color: #1f2937;
}

/* Header */
.header {
    background: #1e3a8a;
    color: white;
    padding: 22px 40px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.12);
}

.header h1 {
    margin: 0;
    font-size: 25px;
}

.header p {
    margin: 6px 0 0;
    font-size: 14px;
    opacity: 0.9;
}

/* Main */
.container {
    width: 700px;
    max-width: 92%;
    margin: 50px auto;
}

/* Card */
.card {
    background: white;
    border-radius: 14px;
    padding: 32px;
    box-shadow: 0 4px 18px rgba(0,0,0,0.10);
}

.card-header {
    border-bottom: 1px solid #e5e7eb;
    padding-bottom: 18px;
    margin-bottom: 24px;
}

.card-header h2 {
    margin: 0;
    color: #1e3a8a;
    font-size: 22px;
}

.card-header p {
    margin: 7px 0 0;
    color: #6b7280;
    font-size: 14px;
}

/* Student information */
.student-info {
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    overflow: hidden;
}

.info-row {
    display: flex;
    padding: 16px 18px;
    border-bottom: 1px solid #e5e7eb;
}

.info-row:last-child {
    border-bottom: none;
}

.info-label {
    width: 180px;
    font-weight: bold;
    color: #374151;
}

.info-value {
    flex: 1;
    color: #111827;
}

/* Roll badge */
.roll-badge {
    display: inline-block;
    background: #dbeafe;
    color: #1e3a8a;
    padding: 5px 11px;
    border-radius: 20px;
    font-weight: bold;
    font-size: 13px;
}

/* Success */
.success-box {
    background: #ecfdf5;
    border: 1px solid #a7f3d0;
    color: #047857;
    padding: 12px 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    font-size: 14px;
}

/* Error */
.error-box {
    text-align: center;
    background: #fef2f2;
    border: 1px solid #fecaca;
    color: #b91c1c;
    padding: 18px;
    border-radius: 10px;
    font-weight: bold;
    font-size: 16px;
}

/* Buttons */
.button-group {
    display: flex;
    justify-content: center;
    gap: 12px;
    margin-top: 28px;
}

.btn {
    display: inline-block;
    padding: 12px 22px;
    border-radius: 8px;
    text-decoration: none;
    color: white;
    font-weight: bold;
    font-size: 14px;
    transition: 0.2s;
}

.search-btn {
    background: #2563eb;
}

.search-btn:hover {
    background: #1d4ed8;
}

.dashboard-btn {
    background: #374151;
}

.dashboard-btn:hover {
    background: #1f2937;
}

/* Footer */
.footer {
    text-align: center;
    color: #6b7280;
    font-size: 13px;
    margin-top: 25px;
}

/* Mobile */
@media (max-width: 600px) {

    .header {
        padding: 20px;
    }

    .container {
        margin: 30px auto;
    }

    .card {
        padding: 22px;
    }

    .info-row {
        display: block;
    }

    .info-label {
        width: auto;
        margin-bottom: 6px;
    }

    .button-group {
        flex-direction: column;
    }

    .btn {
        text-align: center;
    }
}

</style>

</head>

<body>

<!-- Header -->

<div class="header">
    <h1>Result Management System</h1>
    <p>Academic Result & Student Management Portal</p>
</div>

<!-- Main Content -->

<div class="container">

7
<div class="card">

    <div class="card-header">
        <h2>Student Details</h2>
        <p>Student information retrieved from the system</p>
    </div>

    <%
    if (s != null) {
    %>

    <div class="success-box">
        Student record found successfully.
    </div>

    <div class="student-info">

        <div class="info-row">
            <div class="info-label">Roll Number</div>
            <div class="info-value">
                <span class="roll-badge">
                    <%= s.getRollNo() %>
                </span>
            </div>
        </div>

        <div class="info-row">
            <div class="info-label">Student Name</div>
            <div class="info-value">
                <%= s.getName() %>
            </div>
        </div>

        <div class="info-row">
            <div class="info-label">Class</div>
            <div class="info-value">
                <%= s.getStudentClass() %>
            </div>
        </div>

        <div class="info-row">
            <div class="info-label">Email</div>
            <div class="info-value">
                <%= s.getEmail() %>
            </div>
        </div>

    </div>

    <%
    } else {
    %>

    <div class="error-box">
        Student Not Found
    </div>

    <%
    }
    %>

    <!-- Buttons -->
    <div class="button-group">

        <a class="btn search-btn"
           href="searchStudent.jsp">
            Search Again
        </a>

        <a class="btn dashboard-btn"
           href="DashboardServlet">
            Dashboard
        </a>

    </div>

</div>

<div class="footer">
    Result Management System &copy; 2026
</div>


</div>

</body>
</html>
