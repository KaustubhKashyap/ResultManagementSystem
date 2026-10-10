<%@ page import="com.rms.model.ResultSummary" %>

<%
ResultSummary s =
    (ResultSummary) request.getAttribute("summary");

String topperName = "N/A";
int totalStudents = 0;
double highestPercentage = 0;

if(s != null) {

    totalStudents = s.getTotalStudents();

    if(s.getTopperName() != null &&
       !s.getTopperName().trim().isEmpty()) {

        topperName = s.getTopperName();
    }

    highestPercentage =
        s.getHighestPercentage();
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Result Summary | Result Management System</title>

<style>

*{
    box-sizing:border-box;
}

body{
    margin:0;
    font-family:Arial, sans-serif;
    background:#f4f6f9;
    color:#2c3e50;
}


/* Header */

.header{
    background:#2c3e50;
    color:white;
    padding:22px 35px;
}

.header h1{
    margin:0;
    font-size:25px;
}

.header p{
    margin:6px 0 0;
    color:#dfe6e9;
    font-size:14px;
}


/* Main Container */

.container{
    width:92%;
    max-width:1100px;
    margin:35px auto;
}


/* Page Title */

.page-title{
    background:white;
    padding:25px;
    border-radius:14px;
    box-shadow:0 4px 15px rgba(0,0,0,0.08);
    margin-bottom:22px;
}

.page-title h2{
    margin:0;
    font-size:25px;
    color:#2c3e50;
}

.page-title p{
    margin:8px 0 0;
    color:#7f8c8d;
}


/* Summary Cards */

.summary-grid{
    display:grid;
    grid-template-columns:
        repeat(3, 1fr);
    gap:20px;
}


.summary-card{
    background:white;
    padding:25px;
    border-radius:14px;
    box-shadow:
        0 4px 15px rgba(0,0,0,0.08);
    text-align:center;
}


.card-icon{
    font-size:32px;
    margin-bottom:12px;
}


.summary-card h3{
    margin:0 0 10px;
    font-size:14px;
    color:#7f8c8d;
    text-transform:uppercase;
}


.summary-card .value{
    font-size:28px;
    font-weight:bold;
    color:#2c3e50;
}


.topper-card{
    background:#fff8dc;
    border:1px solid #f1c40f;
}


.topper-card .value{
    color:#b8860b;
}


.percentage-card{
    background:#eef7ff;
    border:1px solid #b8d8f5;
}


.percentage-card .value{
    color:#2980b9;
}


/* Details */

.details-card{
    margin-top:22px;
    background:white;
    padding:25px;
    border-radius:14px;
    box-shadow:
        0 4px 15px rgba(0,0,0,0.08);
}


.details-card h3{
    margin:0 0 8px;
    font-size:20px;
}


.details-card p{
    margin:0 0 20px;
    color:#7f8c8d;
    font-size:14px;
}


.detail-row{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 5px;
    border-bottom:1px solid #ecf0f1;
}


.detail-row:last-child{
    border-bottom:none;
}


.detail-label{
    color:#7f8c8d;
    font-size:14px;
}


.detail-value{
    font-weight:bold;
    color:#2c3e50;
}


/* Buttons */

.actions{
    margin-top:22px;
}


.back-btn{
    display:inline-block;
    padding:12px 22px;
    background:#2c3e50;
    color:white;
    text-decoration:none;
    border-radius:8px;
    font-weight:bold;
}


.back-btn:hover{
    background:#1f2d3a;
}


/* Footer */

.footer{
    text-align:center;
    padding:25px;
    color:#95a5a6;
    font-size:13px;
}


/* Responsive */

@media(max-width:800px){

    .summary-grid{
        grid-template-columns:1fr;
    }

    .header{
        padding:18px;
    }

    .container{
        width:95%;
        margin:20px auto;
    }

    .page-title,
    .summary-card,
    .details-card{
        padding:20px;
    }

}

</style>

</head>


<body>


<div class="header">

    <h1>
        Result Management System
    </h1>

    <p>
        Academic Result & Student Management Portal
    </p>

</div>


<div class="container">


    <div class="page-title">

        <h2>
            &#128202; Result Summary Report
        </h2>

        <p>
            Overview of the current academic performance
            recorded in the system.
        </p>

    </div>


    <div class="summary-grid">


        <!-- Total Students -->

        <div class="summary-card">

            <div class="card-icon">
                &#128101;
            </div>

            <h3>
                Total Students
            </h3>

            <div class="value">
                <%=totalStudents%>
            </div>

        </div>


        <!-- Topper -->

        <div class="summary-card topper-card">

            <div class="card-icon">
                &#127942;
            </div>

            <h3>
                Top Performer
            </h3>

            <div class="value">
                <%=topperName%>
            </div>

        </div>


        <!-- Highest Percentage -->

        <div class="summary-card percentage-card">

            <div class="card-icon">
                &#128200;
            </div>

            <h3>
                Highest Percentage
            </h3>

            <div class="value">

                <%=String.format(
                    "%.2f",
                    highestPercentage
                )%>%

            </div>

        </div>


    </div>


    <!-- Details -->

    <div class="details-card">

        <h3>
            Academic Performance Overview
        </h3>

        <p>
            Current summary of student records
            and highest academic achievement.
        </p>


        <div class="detail-row">

            <span class="detail-label">
                Registered Students
            </span>

            <span class="detail-value">
                <%=totalStudents%>
            </span>

        </div>


        <div class="detail-row">

            <span class="detail-label">
                Top Performer
            </span>

            <span class="detail-value">
                &#127942; <%=topperName%>
            </span>

        </div>


        <div class="detail-row">

            <span class="detail-label">
                Highest Percentage
            </span>

            <span class="detail-value">

                <%=String.format(
                    "%.2f",
                    highestPercentage
                )%>%

            </span>

        </div>


    </div>


    <div class="actions">

        <a
            href="DashboardServlet"
            class="back-btn">

            &#8592; Back To Dashboard

        </a>

    </div>


</div>


<div class="footer">

    &copy; 2026 Result Management System
    &nbsp;|&nbsp;
    Academic Administration Portal

</div>


</body>

</html>