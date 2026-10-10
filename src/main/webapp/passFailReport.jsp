<%@ page import="java.util.*" %>
<%@ page import="com.rms.model.Result" %>

<%
    List<Result> list =
        (List<Result>) request.getAttribute("resultList");

    int totalStudents = 0;
    int passedStudents = 0;
    int failedStudents = 0;

    if(list != null) {

        totalStudents = list.size();

        for(Result r : list) {

            if("PASS".equalsIgnoreCase(r.getStatus())) {
                passedStudents++;
            } else {
                failedStudents++;
            }
        }
    }

    double passRate = 0;

    if(totalStudents > 0) {
        passRate =
            ((double) passedStudents / totalStudents) * 100;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Pass / Fail Report - Result Management System</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    color: #1f2937;
}

/* Header */

.header {
    background: #1e3a8a;
    color: white;
    padding: 25px 50px;
}

.header h1 {
    font-size: 28px;
    margin-bottom: 6px;
}

.header p {
    font-size: 14px;
    opacity: 0.85;
}

/* Main */

.main {
    max-width: 1150px;
    margin: 40px auto;
    padding: 0 20px;
}

/* Page Header */

.page-heading {
    margin-bottom: 25px;
}

.page-heading h2 {
    font-size: 27px;
    margin-bottom: 7px;
}

.page-heading p {
    color: #6b7280;
    font-size: 15px;
}

/* Summary Cards */

.summary-grid {
    display: grid;
    grid-template-columns:
        repeat(4, 1fr);

    gap: 18px;

    margin-bottom: 30px;
}

.summary-card {
    background: white;

    padding: 22px;

    border-radius: 12px;

    box-shadow:
        0 5px 18px rgba(0,0,0,0.07);
}

.summary-card .label {
    color: #6b7280;
    font-size: 13px;
    font-weight: bold;

    text-transform: uppercase;

    margin-bottom: 10px;
}

.summary-card .value {
    font-size: 28px;
    font-weight: bold;
}

/* Report Card */

.card {
    background: white;

    border-radius: 12px;

    box-shadow:
        0 5px 18px rgba(0,0,0,0.07);

    overflow: hidden;
}

.card-header {
    padding: 25px;

    border-bottom:
        1px solid #e5e7eb;
}

.card-header h3 {
    font-size: 21px;
    margin-bottom: 5px;
}

.card-header p {
    color: #6b7280;
    font-size: 14px;
}

/* Table */

.table-container {
    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background: #f8fafc;

    color: #374151;

    font-size: 13px;

    text-transform: uppercase;

    padding: 15px;

    text-align: center;

    border-bottom:
        1px solid #e5e7eb;
}

td {
    padding: 15px;

    text-align: center;

    border-bottom:
        1px solid #eef0f3;

    font-size: 14px;
}

tbody tr:hover {
    background: #f8fafc;
}

/* Status */

.status {
    display: inline-block;

    padding: 6px 13px;

    border-radius: 20px;

    font-size: 12px;

    font-weight: bold;
}

.pass {
    background: #dcfce7;
    color: #166534;
}

.fail {
    background: #fee2e2;
    color: #991b1b;
}

/* Empty */

.empty {
    text-align: center;

    padding: 45px;

    color: #6b7280;
}

/* Bottom */

.bottom-section {
    display: flex;

    justify-content: space-between;

    align-items: center;

    padding: 20px 25px;
}

.record-info {
    color: #6b7280;

    font-size: 14px;
}

.back-btn {
    display: inline-block;

    padding: 11px 20px;

    background: #1e3a8a;

    color: white;

    text-decoration: none;

    border-radius: 7px;

    font-size: 14px;

    font-weight: bold;
}

.back-btn:hover {
    background: #1e40af;
}

/* Footer */

.footer {
    text-align: center;

    padding: 25px;

    color: #6b7280;

    font-size: 13px;
}

/* Responsive */

@media(max-width: 800px) {

    .summary-grid {
        grid-template-columns:
            repeat(2, 1fr);
    }

    .header {
        padding: 22px;
    }
}

@media(max-width: 500px) {

    .summary-grid {
        grid-template-columns: 1fr;
    }

    .bottom-section {
        flex-direction: column;
        gap: 15px;
    }
}

</style>

</head>

<body>

<!-- Header -->

<div class="header">

    <h1>Result Management System</h1>

    <p>
        Academic Result &amp; Student Management Portal
    </p>

</div>


<!-- Main -->

<div class="main">

    <div class="page-heading">

        <h2>Pass / Fail Report</h2>

        <p>
            Monitor student performance and view pass or fail status.
        </p>

    </div>


    <!-- Summary -->

    <div class="summary-grid">

        <div class="summary-card">

            <div class="label">
                Total Students
            </div>

            <div class="value">
                <%=totalStudents%>
            </div>

        </div>


        <div class="summary-card">

            <div class="label">
                Passed
            </div>

            <div class="value">
                <%=passedStudents%>
            </div>

        </div>


        <div class="summary-card">

            <div class="label">
                Failed
            </div>

            <div class="value">
                <%=failedStudents%>
            </div>

        </div>


        <div class="summary-card">

            <div class="label">
                Pass Rate
            </div>

            <div class="value">

                <%=String.format(
                    "%.2f",
                    passRate
                )%>%

            </div>

        </div>

    </div>


    <!-- Report -->

    <div class="card">

        <div class="card-header">

            <h3>Student Performance Report</h3>

            <p>
                Student-wise percentage and examination status.
            </p>

        </div>


        <div class="table-container">

        <table>

            <thead>

                <tr>

                    <th>Roll Number</th>

                    <th>Student Name</th>

                    <th>Percentage</th>

                    <th>Status</th>

                </tr>

            </thead>


            <tbody>

            <%
                if(list != null && !list.isEmpty()) {

                    for(Result r : list) {
            %>

                <tr>

                    <td>
                        <%=r.getRollNo()%>
                    </td>

                    <td>
                        <%=r.getStudentName()%>
                    </td>

                    <td>
                        <strong>
                            <%=String.format(
                                "%.2f",
                                r.getPercentage()
                            )%>%
                        </strong>
                    </td>

                    <td>

                        <span class="status
                            <%= "PASS".equalsIgnoreCase(
                                r.getStatus()
                            )
                            ? "pass"
                            : "fail"
                            %>">

                            <%=r.getStatus()%>

                        </span>

                    </td>

                </tr>

            <%
                    }

                } else {
            %>

                <tr>

                    <td
                        colspan="4"
                        class="empty">

                        No student result records
                        are available.

                    </td>

                </tr>

            <%
                }
            %>

            </tbody>

        </table>

        </div>


        <div class="bottom-section">

            <div class="record-info">

                Total Records:
                <strong>
                    <%=totalStudents%>
                </strong>

            </div>


            <a
                href="DashboardServlet"
                class="back-btn">

                Back To Dashboard

            </a>

        </div>

    </div>

</div>


<!-- Footer -->

<div class="footer">

    Result Management System
    &nbsp;|&nbsp;
    Administrator Portal

</div>

</body>

</html>