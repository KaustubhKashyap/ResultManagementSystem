<%@ page import="java.util.*" %>
<%@ page import="com.rms.model.Student" %>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>View Students - Result Management System</title>

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
    max-width: 1250px;
    margin: 35px auto;
}

/* Card */

.card {
    background: white;
    border-radius: 14px;
    padding: 30px;
    border: 1px solid #e5e7eb;
    box-shadow: 0 8px 30px rgba(0,0,0,0.08);
}

.card-header {
    margin-bottom: 25px;
}

.card-header h2 {
    color: #111827;
    font-size: 24px;
    margin-bottom: 7px;
}

.card-header p {
    color: #6b7280;
    font-size: 14px;
}

/* Table */

.table-wrapper {
    width: 100%;
    overflow-x: auto;
    border: 1px solid #e5e7eb;
    border-radius: 10px;
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 750px;
}

thead {
    background: #1e3a8a;
    color: white;
}

th {
    padding: 14px 12px;
    font-size: 13px;
    font-weight: 600;
    text-align: center;
    white-space: nowrap;
}

td {
    padding: 14px 12px;
    border-bottom: 1px solid #e5e7eb;
    text-align: center;
    font-size: 14px;
    color: #374151;
}

tbody tr:hover {
    background: #f8fafc;
}

tbody tr:last-child td {
    border-bottom: none;
}

/* Student name */

.student-name {
    font-weight: 600;
    color: #111827;
}

/* Roll badge */

.roll-badge {
    display: inline-block;
    min-width: 42px;
    padding: 5px 9px;
    border-radius: 6px;
    background: #eff6ff;
    color: #1d4ed8;
    font-weight: 600;
}

/* Action buttons */

.action-btn {
    display: inline-block;
    padding: 8px 14px;
    border-radius: 7px;
    text-decoration: none;
    font-size: 13px;
    font-weight: 600;
    transition: 0.2s;
}

.edit-btn {
    background: #2563eb;
    color: white;
}

.edit-btn:hover {
    background: #1d4ed8;
}

.delete-btn {
    background: #dc2626;
    color: white;
}

.delete-btn:hover {
    background: #b91c1c;
}

/* Empty state */

.empty-state {
    text-align: center;
    padding: 35px 20px;
    color: #6b7280;
    font-size: 14px;
}

/* Bottom buttons */

.bottom-actions {
    margin-top: 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.student-count {
    color: #6b7280;
    font-size: 14px;
}

.back-btn {
    display: inline-block;
    padding: 11px 18px;
    background: #374151;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    transition: 0.2s;
}

.back-btn:hover {
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

@media (max-width: 700px) {

    .header {
        padding: 18px 20px;
    }

    .main {
        width: 95%;
        margin: 20px auto;
    }

    .card {
        padding: 20px 15px;
    }

    .bottom-actions {
        flex-direction: column;
        gap: 15px;
        align-items: stretch;
    }

    .back-btn {
        text-align: center;
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

        <h2>Student List</h2>

        <p>
            View and manage all registered students.
        </p>

    </div>


    <div class="table-wrapper">

        <table>

            <thead>

                <tr>

                    <th>Roll No</th>
                    <th>Student Name</th>
                    <th>Class</th>
                    <th>Email</th>
                    <th>Edit</th>
                    <th>Delete</th>

                </tr>

            </thead>


            <tbody>

            <%

            List<Student> list =
                (List<Student>) request.getAttribute("studentList");

            if(list != null && !list.isEmpty()) {

                for(Student s : list) {

            %>

                <tr>

                    <td>

                        <span class="roll-badge">
                            <%=s.getRollNo()%>
                        </span>

                    </td>

                    <td class="student-name">
                        <%=s.getName()%>
                    </td>

                    <td>
                        <%=s.getStudentClass()%>
                    </td>

                    <td>
                        <%=s.getEmail()%>
                    </td>

                    <td>

                        <a
                            class="action-btn edit-btn"
                            href="EditStudentServlet?rollno=<%=s.getRollNo()%>">

                            Edit

                        </a>

                    </td>

                    <td>

                        <a
                            class="action-btn delete-btn"
                            href="DeleteStudentServlet?rollno=<%=s.getRollNo()%>"
                            onclick="return confirm('Are you sure you want to delete this student?');">

                            Delete

                        </a>

                    </td>

                </tr>

            <%

                }

            } else {

            %>

                <tr>

                    <td colspan="6">

                        <div class="empty-state">

                            No students found in the system.

                        </div>

                    </td>

                </tr>

            <%

            }

            %>

            </tbody>

        </table>

    </div>


    <div class="bottom-actions">

        <div class="student-count">

            <% if(list != null) { %>

                Total Students: <strong><%=list.size()%></strong>

            <% } else { %>

                Total Students: <strong>0</strong>

            <% } %>

        </div>


        <a
            class="back-btn"
            href="DashboardServlet">

            Back To Dashboard

        </a>

    </div>

</div>


</div>

<div class="footer">

Result Management System &nbsp;|&nbsp; Administrator Portal


</div>

</body>
</html>
