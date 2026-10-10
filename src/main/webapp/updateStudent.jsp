<%@ page import="com.rms.model.Student" %>

<%
Student s = (Student)request.getAttribute("student");

if(s == null){
response.sendRedirect("ViewStudentsServlet");
return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Update Student - Result Management System</title>

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
    width: 92%;
    max-width: 700px;
    margin: 40px auto;
}

/* Card */

.card {
    background: white;
    padding: 32px;
    border-radius: 14px;
    border: 1px solid #e5e7eb;
    box-shadow: 0 8px 30px rgba(0,0,0,0.08);
}

.card-header {
    margin-bottom: 25px;
}

.card-header h2 {
    font-size: 24px;
    color: #111827;
    margin-bottom: 7px;
}

.card-header p {
    font-size: 14px;
    color: #6b7280;
}

/* Student information */

.student-info {
    background: #eff6ff;
    border: 1px solid #dbeafe;
    padding: 15px 18px;
    border-radius: 9px;
    margin-bottom: 25px;
    color: #1e40af;
    font-size: 14px;
}

.student-info strong {
    color: #1e3a8a;
}

/* Form */

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 7px;
    font-size: 14px;
    font-weight: 600;
    color: #374151;
}

.form-group input {
    width: 100%;
    padding: 12px 13px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    font-size: 14px;
    outline: none;
    transition: 0.2s;
}

.form-group input:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37,99,235,0.10);
}

.form-group input[readonly] {
    background: #f3f4f6;
    color: #6b7280;
    cursor: not-allowed;
}

/* Buttons */

.actions {
    display: flex;
    gap: 12px;
    margin-top: 25px;
}

.update-btn {
    flex: 1;
    border: none;
    padding: 12px 18px;
    background: #2563eb;
    color: white;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s;
}

.update-btn:hover {
    background: #1d4ed8;
}

.cancel-btn {
    flex: 1;
    padding: 12px 18px;
    background: #374151;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    text-align: center;
    font-size: 14px;
    font-weight: 600;
    transition: 0.2s;
}

.cancel-btn:hover {
    background: #1f2937;
}

/* Footer */

.footer {
    text-align: center;
    margin-top: 35px;
    padding: 18px;
    background: white;
    border-top: 1px solid #e5e7eb;
    color: #6b7280;
    font-size: 13px;
}

/* Responsive */

@media (max-width: 600px) {

    .header {
        padding: 18px 20px;
    }

    .main {
        width: 94%;
        margin: 25px auto;
    }

    .card {
        padding: 22px;
    }

    .actions {
        flex-direction: column;
    }

}

</style>

</head>

<body>

<div class="header">


<h1>Result Management System</h1>

<p>Academic Result &amp; Student Management Portal</p>


</div>

<div class="main">


<div class="card">

    <div class="card-header">

        <h2>Update Student</h2>

        <p>
            Update the student's academic and contact information.
        </p>

    </div>


    <div class="student-info">

        Updating student account for

        <strong><%=s.getName()%></strong>

        &nbsp; | &nbsp;

        Roll No:

        <strong><%=s.getRollNo()%></strong>

    </div>


    <form action="UpdateStudentServlet" method="post">

        <div class="form-group">

            <label>Roll Number</label>

            <input
                type="number"
                name="rollno"
                value="<%=s.getRollNo()%>"
                readonly>

        </div>


        <div class="form-group">

            <label>Student Name</label>

            <input
                type="text"
                name="name"
                value="<%=s.getName()%>"
                required>

        </div>


        <div class="form-group">

            <label>Class</label>

            <input
                type="text"
                name="studentClass"
                value="<%=s.getStudentClass()%>"
                required>

        </div>


        <div class="form-group">

            <label>Email Address</label>

            <input
                type="email"
                name="email"
                value="<%=s.getEmail()%>"
                required>

        </div>


        <div class="actions">

            <button
                type="submit"
                class="update-btn">

                Update Student

            </button>


            <a
                href="ViewStudentsServlet"
                class="cancel-btn">

                Cancel

            </a>

        </div>

    </form>

</div>


</div>

<div class="footer">

Result Management System &nbsp;|&nbsp; Administrator Portal


</div>

</body>

</html>
