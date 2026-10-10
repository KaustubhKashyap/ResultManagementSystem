<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if(session.getAttribute("admin") == null){
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

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI,sans-serif;
}

body{
    background:#f4f6f9;
}

.header{
    background:#1e293b;
    color:white;
    text-align:center;
    padding:25px;
}

.header h1{
    margin-bottom:10px;
}

.container{
    width:95%;
    margin:20px auto;
}

.cards{
    display:flex;
    gap:20px;
    margin-bottom:30px;
}

.card{
    flex:1;
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0px 2px 10px rgba(0,0,0,0.1);
}

.card h2{
    color:#2563eb;
    margin-top:10px;
}

.menu{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:15px;
}

.menu a{
    text-decoration:none;
    background:#2563eb;
    color:white;
    padding:18px;
    text-align:center;
    border-radius:10px;
    font-size:18px;
    transition:0.3s;
}

.menu a:hover{
    background:#1d4ed8;
    transform:translateY(-3px);
}

.footer{
    text-align:center;
    margin-top:40px;
    color:gray;
}

</style>

</head>
<body>

<div class="header">
    <h1>🎓 Result Management System</h1>
    <h3>Welcome Admin</h3>
</div>

<div class="container">

    <div class="cards">

        <div class="card">
            <h3>Total Students</h3>
            <h2><%=request.getAttribute("students")%></h2>
        </div>

        <div class="card">
            <h3>Total Subjects</h3>
            <h2><%=request.getAttribute("subjects")%></h2>
        </div>

        <div class="card">
            <h3>Total Marks</h3>
            <h2><%=request.getAttribute("marks")%></h2>
        </div>

    </div>

    <div class="menu">

        <a href="addStudent.jsp">Add Student</a>

        <a href="ViewStudentsServlet">View Students</a>

        <a href="addSubject.jsp">Manage Subjects</a>

        <a href="ViewSubjectsServlet">View Subjects</a>

        <a href="enterMarks.jsp">Enter Marks</a>

       <a href="ViewResultServlet">View Results</a>

        <a href="LogoutServlet">Logout</a>

    </div>

    <div class="footer">
        <h4>© 2026 Result Management System</h4>
    </div>

</div>

</body>
</html>