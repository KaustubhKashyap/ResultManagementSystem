<%@ page import="java.util.List" %>
<%@ page import="com.rms.model.Marks" %>

<%
    List<Marks> marksList =
        (List<Marks>) request.getAttribute("marksList");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>View Marks - Result Management System</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #f4f7fb;
            min-height: 100vh;
            color: #1f2937;
        }

        .header {
            background: #1e3a8a;
            color: white;
            padding: 22px 40px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.12);
        }

        .header h1 {
            font-size: 25px;
            margin-bottom: 5px;
        }

        .header p {
            font-size: 14px;
            opacity: 0.85;
        }

        .main {
            width: 100%;
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .card {
            background: white;
            border-radius: 14px;
            padding: 30px;
            border: 1px solid #e5e7eb;
            box-shadow: 0 8px 30px rgba(0,0,0,0.07);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .card-header h2 {
            font-size: 24px;
            color: #111827;
            margin-bottom: 6px;
        }

        .card-header p {
            color: #6b7280;
            font-size: 14px;
        }

        .count {
            background: #eff6ff;
            color: #1d4ed8;
            padding: 8px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #f8fafc;
            color: #374151;
            font-size: 14px;
            text-align: left;
            padding: 14px 16px;
            border-bottom: 2px solid #e5e7eb;
        }

        td {
            padding: 14px 16px;
            font-size: 14px;
            border-bottom: 1px solid #e5e7eb;
            color: #4b5563;
        }

        tr:hover {
            background: #f8fafc;
        }

        .marks {
            font-weight: bold;
            color: #111827;
        }

        .edit-btn {
            display: inline-block;
            padding: 7px 13px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 13px;
            font-weight: bold;
        }

        .edit-btn:hover {
            background: #1d4ed8;
        }

        .empty {
            text-align: center;
            padding: 45px 20px;
            color: #6b7280;
        }

        .empty h3 {
            color: #374151;
            margin-bottom: 8px;
        }

        .bottom {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .total {
            color: #6b7280;
            font-size: 14px;
        }

        .dashboard-btn {
            display: inline-block;
            background: #f3f4f6;
            color: #374151;
            border: 1px solid #d1d5db;
            padding: 10px 18px;
            border-radius: 7px;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
        }

        .dashboard-btn:hover {
            background: #e5e7eb;
        }

        .footer {
            text-align: center;
            padding: 18px;
            background: white;
            border-top: 1px solid #e5e7eb;
            color: #6b7280;
            font-size: 13px;
            margin-top: 40px;
        }

        @media (max-width: 650px) {

            .header {
                padding: 18px 20px;
            }

            .main {
                margin-top: 25px;
            }

            .card {
                padding: 20px;
            }

            .card-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .bottom {
                flex-direction: column;
                gap: 15px;
                align-items: stretch;
            }

            .dashboard-btn {
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

                <div>
                    <h2>Marks List</h2>
                    <p>
                        View and update student subject-wise marks.
                    </p>
                </div>

                <div class="count">
                    Total Records:
                    <%= marksList == null ? 0 : marksList.size() %>
                </div>

            </div>


            <%
                if (marksList != null && !marksList.isEmpty()) {
            %>

                <div class="table-container">

                    <table>

                        <thead>
                            <tr>
                                <th>Roll Number</th>
                                <th>Subject ID</th>
                                <th>Marks</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>

                        <%
                            for (Marks m : marksList) {
                        %>

                            <tr>

                                <td>
                                    <%=m.getRollNo()%>
                                </td>

                                <td>
                                    <%=m.getSubjectId()%>
                                </td>

                                <td class="marks">
                                    <%=m.getMarks()%>
                                </td>

                                <td>
                                    <a
                                        href="EditMarksServlet?rollno=<%=m.getRollNo()%>&subjectId=<%=m.getSubjectId()%>"
                                        class="edit-btn">
                                        Edit
                                    </a>
                                </td>

                            </tr>

                        <%
                            }
                        %>

                        </tbody>

                    </table>

                </div>

            <%
                } else {
            %>

                <div class="empty">

                    <h3>No Marks Found</h3>

                    <p>
                        There are currently no marks records available.
                    </p>

                </div>

            <%
                }
            %>


            <div class="bottom">

                <div class="total">
                    Manage student marks from this section.
                </div>

                <a
                    href="DashboardServlet"
                    class="dashboard-btn">
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