<%@ page import="java.util.*" %>
<%@ page import="com.rms.model.Subject" %>

<%
List<Subject> list =
(List<Subject>) request.getAttribute("subjectList");
%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>View Subjects - Result Management System</title>

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

/* Main container */
.container {
    width: 900px;
    max-width: 94%;
    margin: 45px auto;
}

/* Card */
.card {
    background: white;
    border-radius: 14px;
    padding: 30px;
    box-shadow: 0 4px 18px rgba(0,0,0,0.10);
}

/* Card header */
.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
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
    margin: 6px 0 0;
    color: #6b7280;
    font-size: 14px;
}

/* Subject count */
.count-badge {
    background: #dbeafe;
    color: #1e3a8a;
    padding: 8px 13px;
    border-radius: 20px;
    font-size: 13px;
    font-weight: bold;
}

/* Table */
.table-wrapper {
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #1e3a8a;
    color: white;
    padding: 14px 12px;
    text-align: left;
    font-size: 14px;
}

td {
    padding: 14px 12px;
    border-bottom: 1px solid #e5e7eb;
    font-size: 14px;
}

tr:hover td {
    background: #f8fafc;
}

/* Subject ID */
.subject-id {
    display: inline-block;
    background: #eff6ff;
    color: #1e3a8a;
    padding: 5px 10px;
    border-radius: 6px;
    font-weight: bold;
    font-size: 13px;
}

/* Subject name */
.subject-name {
    font-weight: bold;
    color: #374151;
}

/* Action buttons */
.action-btn {
    display: inline-block;
    padding: 7px 13px;
    border-radius: 6px;
    text-decoration: none;
    color: white;
    font-size: 13px;
    font-weight: bold;
    margin-right: 5px;
}

.edit-btn {
    background: #2563eb;
}

.edit-btn:hover {
    background: #1d4ed8;
}

.delete-btn {
    background: #dc2626;
}

.delete-btn:hover {
    background: #b91c1c;
}

/* Empty message */
.empty-box {
    text-align: center;
    padding: 30px;
    background: #f9fafb;
    border: 1px solid #e5e7eb;
    border-radius: 10px;
    color: #6b7280;
}

/* Bottom section */
.bottom-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 25px;
}

.total-text {
    color: #6b7280;
    font-size: 14px;
}

.back-btn {
    display: inline-block;
    padding: 11px 20px;
    background: #374151;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: bold;
}

.back-btn:hover {
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
@media (max-width: 650px) {

    .header {
        padding: 20px;
    }

    .container {
        margin: 30px auto;
    }

    .card {
        padding: 20px;
    }

    .card-header {
        display: block;
    }

    .count-badge {
        display: inline-block;
        margin-top: 12px;
    }

    .bottom-section {
        display: block;
    }

    .back-btn {
        margin-top: 15px;
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

<!-- Main -->

<div class="container">

<div class="card">

    <div class="card-header">

        <div>
            <h2>Subject List</h2>
            <p>Manage all subjects available in the result system</p>
        </div>

        <%
        int totalSubjects = (list != null) ? list.size() : 0;
        %>

        <div class="count-badge">
            Total Subjects: <%= totalSubjects %>
        </div>

    </div>

    <%
    if (list != null && !list.isEmpty()) {
    %>

    <div class="table-wrapper">

        <table>

            <tr>
                <th>Subject ID</th>
                <th>Subject Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            <%
            for (Subject s : list) {
            %>

            <tr>

                <td>
                    <span class="subject-id">
                        <%= s.getSubjectId() %>
                    </span>
                </td>

                <td>
                    <span class="subject-name">
                        <%= s.getSubjectName() %>
                    </span>
                </td>

                <td>
                    <a class="action-btn edit-btn"
                       href="EditSubjectServlet?subjectId=<%=s.getSubjectId()%>">
                        Edit
                    </a>
                </td>

                <td>
                    <a class="action-btn delete-btn"
                       href="DeleteSubjectServlet?subjectId=<%=s.getSubjectId()%>"
                       onclick="return confirm('Delete this subject?')">
                        Delete
                    </a>
                </td>

            </tr>

            <%
            }
            %>

        </table>

    </div>

    <%
    } else {
    %>

    <div class="empty-box">
        No subjects found in the system.
    </div>

    <%
    }
    %>

    <div class="bottom-section">

        <div class="total-text">
            Subject records displayed:
            <strong><%= totalSubjects %></strong>
        </div>

        <a href="DashboardServlet" class="back-btn">
            Back To Dashboard
        </a>

    </div>

</div>

<div class="footer">
    Result Management System &copy; 2026
</div>


</div>

</body>
</html>
