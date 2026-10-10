<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
if(session.getAttribute("admin") == null){
    response.sendRedirect("login.jsp");
    return;
}

String adminName = String.valueOf(session.getAttribute("admin"));

Object highestObj = request.getAttribute("highestPercentage");
double highestPercentage = 0;

if(highestObj != null){
    highestPercentage = ((Double)highestObj).doubleValue();
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Admin Dashboard | Result Management System</title>

<link rel="stylesheet" href="style.css">

<style>

/* =========================
   DASHBOARD PAGE
========================= */

.dashboard-page{
    margin:0;
    padding:0;
    font-family:Arial, Helvetica, sans-serif;
    background:#f1f5f9;
    color:#1e293b;
}

/* =========================
   TOP HEADER
========================= */

.dashboard-header{
    background:linear-gradient(135deg,#0f172a,#1e3a5f);
    color:white;
    padding:22px 45px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 3px 12px rgba(0,0,0,0.15);
}

.brand-section h1{
    margin:0;
    font-size:28px;
    letter-spacing:.3px;
}

.brand-section p{
    margin:6px 0 0;
    font-size:14px;
    color:#cbd5e1;
}

.admin-info{
    text-align:right;
}

.admin-info .welcome{
    font-size:13px;
    color:#cbd5e1;
}

.admin-info .admin-name{
    font-size:17px;
    font-weight:bold;
    margin-top:4px;
}

/* =========================
   MAIN WRAPPER
========================= */

.dashboard-wrapper{
    width:92%;
    max-width:1450px;
    margin:28px auto;
}

.main-layout{
    display:flex;
    gap:25px;
    align-items:flex-start;
}

/* =========================
   SIDEBAR
========================= */

.sidebar{
    width:245px;
    flex-shrink:0;
    background:#0f172a;
    padding:22px 16px;
    border-radius:16px;
    box-shadow:0 8px 25px rgba(15,23,42,.18);
}

.sidebar-title{
    color:white !important;
    text-align:left !important;
    font-size:21px !important;
    margin:4px 10px 22px !important;
    letter-spacing:.5px;
}

.sidebar-subtitle{
    color:#94a3b8;
    font-size:11px;
    margin:0 10px 12px;
    text-transform:uppercase;
    letter-spacing:1px;
}

.menu-btn{
    display:block;
    width:100%;
    box-sizing:border-box;
    padding:12px 14px;
    margin:7px 0;
    background:#1d4ed8;
    color:white;
    text-decoration:none;
    border-radius:9px;
    font-size:14px;
    font-weight:600;
    transition:.2s;
}

.menu-btn:hover{
    background:#2563eb;
    transform:translateX(3px);
}

.menu-divider{
    border:0;
    border-top:1px solid #334155;
    margin:18px 10px;
}

.logout-btn{
    background:#dc2626 !important;
}

.logout-btn:hover{
    background:#b91c1c !important;
}

/* =========================
   RIGHT CONTENT
========================= */

.content{
    flex:1;
    min-width:0;
}

.page-intro{
    margin-bottom:20px;
}

.page-intro h2{
    margin:0;
    font-size:26px;
    color:#0f172a;
    text-align:left;
}

.page-intro p{
    margin:7px 0 0;
    color:#64748b;
    font-size:14px;
}

/* =========================
   STATISTICS
========================= */

.stats{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:17px;
    margin-bottom:22px;
}

.stat-card{
    background:white;
    padding:21px;
    border-radius:14px;
    box-shadow:0 5px 18px rgba(15,23,42,.08);
    border:1px solid #e2e8f0;
    position:relative;
    overflow:hidden;
}

.stat-card::before{
    content:"";
    position:absolute;
    left:0;
    top:0;
    bottom:0;
    width:5px;
}

.stat-blue::before{
    background:#2563eb;
}

.stat-green::before{
    background:#16a34a;
}

.stat-orange::before{
    background:#f59e0b;
}

.stat-purple::before{
    background:#7c3aed;
}

.stat-label{
    color:#64748b;
    font-size:13px;
    font-weight:600;
    margin-bottom:10px;
}

.stat-value{
    color:#0f172a;
    font-size:31px;
    font-weight:bold;
}

.stat-description{
    color:#94a3b8;
    font-size:11px;
    margin-top:7px;
}

.topper-name{
    font-size:21px;
    margin-top:7px;
}

/* =========================
   CONTENT GRID
========================= */

.dashboard-grid{
    display:grid;
    grid-template-columns:2fr 1fr;
    gap:20px;
}

/* =========================
   CARDS
========================= */

.dashboard-card{
    background:white;
    border:1px solid #e2e8f0;
    border-radius:15px;
    padding:24px;
    box-shadow:0 5px 18px rgba(15,23,42,.07);
}

.dashboard-card h3{
    margin:0;
    color:#0f172a;
    font-size:19px;
}

.card-subtitle{
    color:#64748b;
    font-size:13px;
    margin:6px 0 20px;
}

/* =========================
   PERFORMANCE BOX
========================= */

.performance-box{
    background:#f8fafc;
    border:1px solid #e2e8f0;
    border-radius:12px;
    padding:18px;
    margin-top:15px;
}

.performance-row{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:10px;
}

.performance-label{
    color:#475569;
    font-size:13px;
    font-weight:600;
}

.performance-value{
    color:#0f172a;
    font-size:17px;
    font-weight:bold;
}

.progress{
    width:100%;
    height:9px;
    background:#e2e8f0;
    border-radius:20px;
    overflow:hidden;
}

.progress-bar{
    height:100%;
    width:<%=highestPercentage%>%;
    background:linear-gradient(90deg,#2563eb,#3b82f6);
    border-radius:20px;
}

/* =========================
   QUICK ACTIONS
========================= */

.action-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:11px;
}

.action-btn{
    display:block;
    padding:13px 10px;
    background:#f8fafc;
    border:1px solid #e2e8f0;
    border-radius:10px;
    text-decoration:none;
    color:#1e293b;
    font-size:13px;
    font-weight:600;
    transition:.2s;
}

.action-btn:hover{
    background:#eff6ff;
    border-color:#93c5fd;
    transform:translateY(-2px);
}

.action-icon{
    display:block;
    font-size:18px;
    margin-bottom:6px;
}

/* =========================
   SYSTEM INFORMATION
========================= */

.info-card{
    margin-top:20px;
}

.info-grid{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:15px;
    margin-top:18px;
}

.info-item{
    background:#f8fafc;
    padding:16px;
    border-radius:10px;
    border:1px solid #e2e8f0;
}

.info-item strong{
    display:block;
    color:#334155;
    font-size:13px;
    margin-bottom:5px;
}

.info-item span{
    color:#64748b;
    font-size:12px;
}

/* =========================
   FOOTER
========================= */

.dashboard-footer{
    text-align:center;
    color:#94a3b8;
    font-size:12px;
    padding:25px 10px;
}

/* =========================
   RESPONSIVE
========================= */

@media(max-width:1000px){

    .stats{
        grid-template-columns:repeat(2,1fr);
    }

    .dashboard-grid{
        grid-template-columns:1fr;
    }

}

@media(max-width:750px){

    .dashboard-header{
        padding:18px 20px;
        flex-direction:column;
        align-items:flex-start;
        gap:10px;
    }

    .admin-info{
        text-align:left;
    }

    .main-layout{
        flex-direction:column;
    }

    .sidebar{
        width:100%;
        box-sizing:border-box;
    }

    .stats{
        grid-template-columns:1fr;
    }

    .info-grid{
        grid-template-columns:1fr;
    }

    .dashboard-wrapper{
        width:94%;
    }

}

</style>

</head>

<body class="dashboard-page">

<!-- ================= HEADER ================= -->

<div class="dashboard-header">

    <div class="brand-section">

        <h1>Result Management System</h1>

        <p>Academic Result & Student Management Portal</p>

    </div>

    <div class="admin-info">

        <div class="welcome">Logged in as</div>

        <div class="admin-name">
           Administrator - <%=adminName%> 
        </div>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="dashboard-wrapper">

<div class="main-layout">


<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <h2 class="sidebar-title">
        ADMIN PANEL
    </h2>

    <div class="sidebar-subtitle">
        Management
    </div>

    <a class="menu-btn" href="addStudent.jsp">
        Add Student
    </a>

    <a class="menu-btn" href="ViewStudentsServlet">
        View Students
    </a>

    <a class="menu-btn" href="addSubject.jsp">
        Manage Subjects
    </a>

    <a class="menu-btn" href="ViewSubjectsServlet">
        View Subjects
    </a>

    <hr class="menu-divider">

    <div class="sidebar-subtitle">
        Results
    </div>

    <a class="menu-btn" href="enterMarks.jsp">
        Enter Marks
    </a>

    <a class="menu-btn" href="adminViewResult.jsp">
    View Results
</a>

    <a class="menu-btn" href="PassFailServlet">
        Pass / Fail Report
    </a>

    <a class="menu-btn" href="TopperServlet">
        Topper List
    </a>

    <hr class="menu-divider">

    <div class="sidebar-subtitle">
        Tools
    </div>

    <a class="menu-btn" href="searchStudent.jsp">
        Search Student
    </a>

    <a class="menu-btn" href="ResultSummaryServlet">
        Result Summary
    </a>

    <hr class="menu-divider">

    <a href="LogoutServlet" class="menu-btn logout-btn">
        Logout
    </a>

</div>


<!-- ================= CONTENT ================= -->

<div class="content">


<!-- INTRO -->

<div class="page-intro">

    <h2>Dashboard Overview</h2>

    <p>
        Monitor students, subjects, marks and academic performance from one place.
    </p>

</div>


<!-- ================= STATISTICS ================= -->

<div class="stats">


    <div class="stat-card stat-blue">

        <div class="stat-label">
            TOTAL STUDENTS
        </div>

        <div class="stat-value">
            <%=request.getAttribute("students")%>
        </div>

        <div class="stat-description">
            Registered student records
        </div>

    </div>


    <div class="stat-card stat-green">

        <div class="stat-label">
            TOTAL SUBJECTS
        </div>

        <div class="stat-value">
            <%=request.getAttribute("subjects")%>
        </div>

        <div class="stat-description">
            Available academic subjects
        </div>

    </div>


    <div class="stat-card stat-orange">

        <div class="stat-label">
            MARK ENTRIES
        </div>

        <div class="stat-value">
            <%=request.getAttribute("marks")%>
        </div>

        <div class="stat-description">
            Student subject marks
        </div>

    </div>


    <div class="stat-card stat-purple">

        <div class="stat-label">
            TOP PERFORMER
        </div>

        <div class="stat-value topper-name">
            <%=request.getAttribute("topper")%>
        </div>

        <div class="stat-description">
            Highest academic performance
        </div>

    </div>

</div>


<!-- ================= MAIN CARDS ================= -->

<div class="dashboard-grid">


<!-- PERFORMANCE -->

<div class="dashboard-card">

    <h3>Academic Performance</h3>

    <p class="card-subtitle">
        Current highest percentage recorded in the system
    </p>


    <div class="performance-box">

        <div class="performance-row">

            <span class="performance-label">
                Highest Percentage
            </span>

            <span class="performance-value">
                <%=String.format("%.2f",highestPercentage)%>%
            </span>

        </div>

        <div class="progress">

            <div class="progress-bar"></div>

        </div>

    </div>


    <div class="performance-box">

        <div class="performance-row">

            <span class="performance-label">
                Top Performer
            </span>

            <span class="performance-value">
                <%=request.getAttribute("topper")%>
            </span>

        </div>

    </div>


    <div class="performance-box">

        <div class="performance-row">

            <span class="performance-label">
                Student Records
            </span>

            <span class="performance-value">
                <%=request.getAttribute("students")%>
            </span>

        </div>

        <div class="performance-row">

            <span class="performance-label">
                Subject Records
            </span>

            <span class="performance-value">
                <%=request.getAttribute("subjects")%>
            </span>

        </div>

    </div>

</div>


<!-- QUICK ACTIONS -->

<div class="dashboard-card">

    <h3>Quick Actions</h3>

    <p class="card-subtitle">
        Frequently used administration tools
    </p>


    <div class="action-grid">


        <a class="action-btn" href="addStudent.jsp">

            <span class="action-icon">+</span>

            Add Student

        </a>


        <a class="action-btn" href="ViewStudentsServlet">

            <span class="action-icon">ST</span>

            Students

        </a>


        <a class="action-btn" href="addSubject.jsp">

            <span class="action-icon">SUB</span>

            Subjects

        </a>


        <a class="action-btn" href="enterMarks.jsp">

            <span class="action-icon">MK</span>

            Enter Marks

        </a>


       <a class="action-btn" href="adminViewResult.jsp">

            <span class="action-icon">RES</span>

            Results

        </a>


        <a class="action-btn" href="searchStudent.jsp">

            <span class="action-icon">SRCH</span>

            Search

        </a>


    </div>

</div>

</div>


<!-- ================= SYSTEM INFORMATION ================= -->

<div class="dashboard-card info-card">

    <h3>System Information</h3>

    <p class="card-subtitle">
        Result Management System administration panel
    </p>


    <div class="info-grid">


        <div class="info-item">

            <strong>Student Management</strong>

            <span>
                Add, edit, delete and search student records.
            </span>

        </div>


        <div class="info-item">

            <strong>Marks Management</strong>

            <span>
                Enter student marks and generate academic results.
            </span>

        </div>


        <div class="info-item">

            <strong>Reports & Analytics</strong>

            <span>
                View topper, pass/fail and result summary reports.
            </span>

        </div>


    </div>

</div>


</div>

</div>

</div>


<!-- ================= FOOTER ================= -->

<div class="dashboard-footer">

    © 2026 Result Management System
    <br>
    Academic Administration Portal

</div>


</body>
</html>