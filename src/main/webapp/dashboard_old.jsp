<%
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>

body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f4f6f9;
}

.header{
    background:#2c3e50;
    color:white;
    text-align:center;
    padding:20px;
}

.container{
    width:80%;
    margin:30px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0px 0px 10px rgba(0,0,0,0.2);
}

.stats{
    background:#ecf0f1;
    padding:20px;
    border-radius:8px;
    margin-bottom:25px;
}

.stats p{
    font-size:18px;
}

.btn{
    display:block;
    width:250px;
    padding:15px;
    margin:10px 0;
    background:#3498db;
    color:white;
    text-decoration:none;
    text-align:center;
    border-radius:5px;
    font-size:16px;
}

.btn:hover{
    background:#2980b9;
}

.footer{
    text-align:center;
    margin-top:30px;
    color:#777;
}

</style>

</head>

<body>

<div class="header">
    <h1>Result Management System</h1>
    <h3>Welcome Admin</h3>
</div>

<div class="container">

    <div style="display:flex; gap:20px; margin-bottom:25px;">

<div class="stats" style="flex:1;">
<h3>Total Students</h3>
<h2><%=request.getAttribute("students")%></h2>
</div>

<div class="stats" style="flex:1;">
<h3>Total Subjects</h3>
<h2><%=request.getAttribute("subjects")%></h2>
</div>

<div class="stats" style="flex:1;">
<h3>Total Marks</h3>
<h2><%=request.getAttribute("marks")%></h2>
</div>

</div>

    <a class="btn" href="addStudent.jsp">
        Add Student
    </a>

    <a class="btn" href="ViewStudentsServlet">
        View Students
    </a>

    <a class="btn" href="manageSubjects.jsp">
        Manage Subjects
    </a>

    <a class="btn" href="ViewSubjectsServlet">
        View Subjects
    </a>

    <a class="btn" href="enterMarks.jsp">
        Enter Marks
    </a>

    <a class="btn" href="searchResult.jsp">
        View Results
    </a>

    <a href="LogoutServlet"
style="
display:block;
width:250px;
padding:12px;
margin:10px 0;
text-decoration:none;
text-align:center;
border-radius:5px;
background:#e74c3c;
color:white;
font-weight:bold;">
Logout
</a>

    <div class="footer">
        <hr>
        © 2026 Result Management System
    </div>

</div>

</body>
</html>