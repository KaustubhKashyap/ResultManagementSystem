<%@ page import="java.util.*" %>
<%@ page import="com.rms.model.Subject" %>

<%
List<Subject> list =
(List<Subject>)request.getAttribute("subjectList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject List</title>
</head>

<body>

<h2>Subject List</h2>

<table border="1">

<tr>
    <th>Subject ID</th>
    <th>Subject Name</th>
</tr>

<%
for(Subject s : list){
%>

<tr>
    <td><%=s.getSubjectId()%></td>
    <td><%=s.getSubjectName()%></td>
</tr>

<%
}
%>

</table>

<br>

<a href="dashboard.jsp">
Back To Dashboard
</a>

</body>
</html>