<%@ page import="com.rms.model.Student" %>

<%
Student s = (Student) session.getAttribute("student");

if(s == null){
response.sendRedirect("studentLogin.jsp");
return;
}
%>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Change Password - Result Management System</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    min-height: 100vh;
    background: #f4f7fb;
    color: #1f2937;
}

/* Header */

.header {
    background: #1e3a8a;
    color: white;
    padding: 20px 40px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.12);
}

.header h1 {
    font-size: 24px;
    margin-bottom: 5px;
}

.header p {
    font-size: 14px;
    opacity: 0.85;
}

/* Main */

.main {
    min-height: calc(100vh - 145px);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
}

/* Card */

.card {
    width: 100%;
    max-width: 480px;
    background: white;
    border-radius: 14px;
    padding: 35px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.08);
    border: 1px solid #e5e7eb;
}

.card-header {
    margin-bottom: 28px;
}

.card-header h2 {
    font-size: 24px;
    color: #111827;
    margin-bottom: 8px;
}

.card-header p {
    color: #6b7280;
    font-size: 14px;
    line-height: 1.5;
}

/* Student information */

.student-info {
    background: #f8fafc;
    border: 1px solid #e5e7eb;
    border-radius: 10px;
    padding: 14px 16px;
    margin-bottom: 24px;
}

.student-info strong {
    color: #111827;
}

.student-info span {
    color: #4b5563;
}

/* Form */

.form-group {
    margin-bottom: 22px;
}

.form-group label {
    display: block;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 8px;
    color: #374151;
}

.form-group input {
    width: 100%;
    padding: 12px 14px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    font-size: 15px;
    outline: none;
    transition: 0.2s;
}

.form-group input:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37,99,235,0.12);
}

/* Buttons */

.button-row {
    display: flex;
    gap: 12px;
    margin-top: 10px;
}

.btn {
    flex: 1;
    display: inline-block;
    text-align: center;
    text-decoration: none;
    padding: 12px 16px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s;
}

.btn-primary {
    border: none;
    background: #2563eb;
    color: white;
}

.btn-primary:hover {
    background: #1d4ed8;
}

.btn-secondary {
    background: #f3f4f6;
    color: #374151;
    border: 1px solid #d1d5db;
}

.btn-secondary:hover {
    background: #e5e7eb;
}

/* Security note */

.security-note {
    margin-top: 24px;
    padding: 12px 14px;
    background: #eff6ff;
    border-left: 4px solid #2563eb;
    border-radius: 6px;
    font-size: 13px;
    color: #374151;
    line-height: 1.5;
}

/* Footer */

.footer {
    text-align: center;
    padding: 18px;
    color: #6b7280;
    font-size: 13px;
    border-top: 1px solid #e5e7eb;
    background: white;
}

/* Responsive */

@media (max-width: 600px) {

    .header {
        padding: 18px 20px;
    }

    .card {
        padding: 25px 20px;
    }

    .button-row {
        flex-direction: column;
    }

}

</style>

</head>

<body>

<div class="header">

<h1>Result Management System</h1>

<p>Student Portal - Account Security</p>

</div>

<div class="main">

<div class="card">

    <div class="card-header">

        <h2>Change Password</h2>

        <p>
            Update your student portal password to keep your account secure.
        </p>

    </div>


    <div class="student-info">

        <strong>Student:</strong>

        <span><%=s.getName()%></span>

        &nbsp;&nbsp; | &nbsp;&nbsp;

        <strong>Roll No:</strong>

        <span><%=s.getRollNo()%></span>

    </div>


    <form action="ChangePasswordServlet" method="post">

        <div class="form-group">

            <label for="newPassword">
                New Password
            </label>

            <input
                type="password"
                id="newPassword"
                name="newPassword"
                placeholder="Enter new password"
                required
            >

        </div>


        <div class="button-row">

            <button
                type="submit"
                class="btn btn-primary">
                Change Password
            </button>

            <a
                href="studentDashboard.jsp"
                class="btn btn-secondary">
                Cancel
            </a>

        </div>

    </form>


    <div class="security-note">

        <strong>Security Note:</strong>
        Use a password that is difficult for others to guess.
        Do not share your password with anyone.

    </div>

</div>

</div>

<div class="footer">

Result Management System &nbsp;|&nbsp; Student Portal


</div>

</body>
</html>
