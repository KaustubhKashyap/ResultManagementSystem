<%@ page import="java.util.*" %>
<%@ page import="com.rms.model.Student" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Students</title>
</head>
<body>

<h2>Student List</h2>

<table border="1" cellpadding="10">


<tr>
    <th>Roll No</th>
    <th>Name</th>
    <th>Class</th>
    <th>Email</th>
    <th>Edit</th>
    <th>Delete</th>
</tr>

<%
List<Student> list =
(List<Student>)request.getAttribute("studentList");

if(list != null){

for(Student s : list){
%>

<tr>

    <td><%=s.getRollNo()%></td>
    <td><%=s.getName()%></td>
    <td><%=s.getStudentClass()%></td>
    <td><%=s.getEmail()%></td>

    <td>
        <a href="EditStudentServlet?rollno=<%=s.getRollNo()%>">
            Edit
        </a>
    </td>

    <td>
        <a href="DeleteStudentServlet?rollno=<%=s.getRollNo()%>">
            Delete
        </a>
    </td>

</tr>

<%
}
}
%>

</table>

<br>

<a href="dashboard.jsp">
Back To Dashboard
</a>

</body>
</html>