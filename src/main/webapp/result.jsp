<%@ page import="java.util.*" %>
<%@ page import="com.rms.model.Result" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Student Marksheet</title>

<style>

body{
    margin:0;
    font-family:Arial,sans-serif;
    background:#f4f6f9;
}

.container{
    width:85%;
    margin:30px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 4px 15px rgba(0,0,0,0.15);
}

.title{
    text-align:center;
    color:#2c3e50;
    margin-bottom:25px;
}

.info-box{
    background:#ecf0f1;
    padding:20px;
    border-radius:10px;
    margin-bottom:25px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#2c3e50;
    color:white;
    padding:12px;
}

td{
    padding:12px;
    border-bottom:1px solid #ddd;
    text-align:center;
}

tr:hover{
    background:#f8f9fa;
}

.summary{
    margin-top:25px;
    background:#f8f9fa;
    padding:20px;
    border-radius:10px;
}

.summary p{
    font-size:18px;
}

.print-btn{
    background:#27ae60;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:8px;
    cursor:pointer;
    margin-top:15px;
}

.print-btn:hover{
    background:#219150;
}

.back-btn{
    display:inline-block;
    margin-top:15px;
    padding:12px 20px;
    background:#2c3e50;
    color:white;
    text-decoration:none;
    border-radius:8px;
}

@media print{

.print-btn{
    display:none;
}

.back-btn{
    display:none;
}

body{
    background:white;
}

.container{
    box-shadow:none;
}

}

</style>

</head>

<body>

<div class="container">

<h1 class="title">Student Marksheet</h1>

<%
List<Result> list =
(List<Result>)request.getAttribute("resultList");

if(list != null && !list.isEmpty()){
%>

<div class="info-box">

<p>
<b>Roll Number :</b>
<%=list.get(0).getRollNo()%>
</p>

<p>
<b>Student Name :</b>
<%=list.get(0).getStudentName()%>
</p>

</div>

<table>

<tr>
<th>Subject</th>
<th>Marks</th>
</tr>

<%
for(Result r:list){
%>

<tr>
<td><%=r.getSubjectName()%></td>
<td><%=r.getMarks()%></td>
</tr>

<%
}
%>

</table>

<div class="summary">

<h2>Result Summary</h2>

<p>
<b>Total Marks :</b>
<%=list.get(0).getTotalMarks()%>
</p>

<p>
<b>Percentage :</b>
<%=String.format("%.2f",
list.get(0).getPercentage())%>%
</p>

<p>
<b>Status :</b>
<%=list.get(0).getStatus()%>
</p>

<p>
<b>Grade :</b>
<%=list.get(0).getGrade()%>
</p>

<button class="print-btn"
onclick="window.print()">
Print Marksheet </button>

<br><br>
<%
Boolean fromStudent =
    (Boolean) request.getAttribute("fromStudent");

Boolean fromAdmin =
    (Boolean) request.getAttribute("fromAdmin");

if(Boolean.TRUE.equals(fromStudent)){
%>

<a href="studentDashboard.jsp" class="back-btn">
    Back To Dashboard
</a>

<%
} else {
%>

<a href="DashboardServlet" class="back-btn">
    Back To Dashboard
</a>

<%
}
%>
</div>

<%
}
%>

</div>

</body>
</html>
