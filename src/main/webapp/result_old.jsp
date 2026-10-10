<%@ page import="java.util.*" %>
<%@ page import="com.rms.model.Result" %>

<html>
<head>
<style>

body{
    font-family: Arial;
    margin:40px;
}

table{
    border-collapse: collapse;
}

th,td{
    padding:10px;
}

@media print{

button{
    display:none;
}

a{
    display:none;
}

}

</style>
<title>Results</title>
</head>

<body>

<h2>Student Results</h2>

<table border="1">

<tr>
<th>Roll No</th>
<th>Name</th>
<th>Subject</th>
<th>Marks</th>
</tr>

<%
List<Result> list =
(List<Result>)request.getAttribute("resultList");

if(list!=null){

for(Result r:list){
%>

<tr>

<td><%=r.getRollNo()%></td>

<td><%=r.getStudentName()%></td>

<td><%=r.getSubjectName()%></td>

<td><%=r.getMarks()%></td>

</tr>

<%
}
}
%>

</table>
<%
if(list != null && !list.isEmpty()){
%>

<br><br>

<h3>Result Summary</h3>

<p>
Student Name :
<b><%=list.get(0).getStudentName()%></b>
</p>

<p>
Total Marks :
<b><%=list.get(0).getTotalMarks()%></b>
</p>

<p>
Percentage :
<b><%=String.format("%.2f",
list.get(0).getPercentage())%>%</b>
</p>

<p>
Status :
<b><%=list.get(0).getStatus()%></b>
</p>

<p>
Grade :
<b><%=list.get(0).getGrade()%></b>
</p>
<br><br>

<button onclick="window.print()">
    Print Marksheet
</button>
<%
}
%>

<br>

<a href="dashboard.jsp">
Back To Dashboard
</a>

</body>
</html>