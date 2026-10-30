
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
    highestPercentage = ((Number)highestObj).doubleValue();
}

Object students = request.getAttribute("students");
Object subjects = request.getAttribute("subjects");
Object marks = request.getAttribute("marks");
Object topper = request.getAttribute("topper");

String currentDate = new SimpleDateFormat("dd MMMM yyyy").format(new Date());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Admin Dashboard | Result Management System</title>

<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
* {
    box-sizing: border-box;
}

body.dashboard-page {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica, sans-serif;
    background: #f4f7fb;
    color: #172033;
}

.dashboard-header {
    background: linear-gradient(120deg, #101b36, #1d3b70);
    color: white;
    padding: 20px 4%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 4px 18px rgba(15,23,42,.15);
}

.brand-section h1 {
    margin: 0;
    font-size: 25px;
    font-weight: 700;
}

.brand-section p {
    margin: 6px 0 0;
    font-size: 13px;
    color: #cbd5e1;
}

.admin-info {
    display: flex;
    align-items: center;
    gap: 12px;
}

.admin-avatar {
    width: 43px;
    height: 43px;
    border-radius: 50%;
    display: grid;
    place-items: center;
    background: #3b82f6;
    font-size: 20px;
}

.admin-details .welcome {
    color: #cbd5e1;
    font-size: 12px;
}

.admin-details .admin-name {
    font-weight: 700;
    margin-top: 4px;
}

.dashboard-wrapper {
    width: 94%;
    max-width: 1500px;
    margin: 30px auto;
}

.main-layout {
    display: flex;
    gap: 25px;
    align-items: flex-start;
}

.sidebar {
    width: 245px;
    flex-shrink: 0;
    background: #111c35;
    padding: 23px 15px;
    border-radius: 16px;
    box-shadow: 0 8px 25px rgba(15,23,42,.12);
}

.sidebar-title {
    color: white !important;
    text-align: left !important;
    font-size: 19px !important;
    margin: 3px 10px 25px !important;
    letter-spacing: .5px;
}

.sidebar-subtitle {
    color: #8292b1;
    font-size: 10px;
    margin: 20px 10px 10px;
    text-transform: uppercase;
    letter-spacing: 1.3px;
}

.menu-btn {
    display: flex;
    align-items: center;
    gap: 12px;
    width: 100%;
    padding: 12px 13px;
    margin: 5px 0;
    background: transparent;
    color: #dbe5f5;
    text-decoration: none;
    border-radius: 9px;
    font-size: 13px;
    font-weight: 600;
    transition: .2s;
}

.menu-btn i {
    font-size: 17px;
}

.menu-btn:hover {
    background: #254b8d;
    color: white;
    transform: translateX(3px);
}

.menu-divider {
    border: 0;
    border-top: 1px solid #2c3b59;
    margin: 17px 8px;
}

.logout-btn {
    background: #7f2634;
    color: white;
    margin-top: 15px;
}

.logout-btn:hover {
    background: #dc3545;
}

.content {
    flex: 1;
    min-width: 0;
}

.page-intro {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    margin-bottom: 24px;
}

.page-intro h2 {
    margin: 0;
    font-size: 27px;
    color: #14213d;
    text-align: left;
}

.page-intro p {
    margin: 7px 0 0;
    color: #718096;
    font-size: 13px;
}

.date-label {
    background: white;
    padding: 11px 15px;
    border: 1px solid #e5eaf2;
    border-radius: 9px;
    color: #52627a;
    font-size: 12px;
    white-space: nowrap;
}

.stats {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 17px;
    margin-bottom: 23px;
}

.stat-card {
    background: white;
    padding: 21px;
    border-radius: 14px;
    border: 1px solid #e9edf4;
    box-shadow: 0 4px 15px rgba(15,23,42,.045);
    transition: .2s;
    min-width: 0;
}

.stat-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 9px 23px rgba(15,23,42,.09);
}

.stat-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 8px;
}

.stat-label {
    color: #748198;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: .5px;
}

.stat-icon {
    width: 42px;
    height: 42px;
    display: grid;
    place-items: center;
    border-radius: 11px;
    font-size: 20px;
}

.icon-blue {
    background: #e8f0ff;
    color: #2563eb;
}

.icon-green {
    background: #e4f8ed;
    color: #16a34a;
}

.icon-orange {
    background: #fff2df;
    color: #ea8a13;
}

.icon-purple {
    background: #f0eaff;
    color: #7c3aed;
}

.stat-value {
    color: #15213a;
    font-size: 30px;
    font-weight: 750;
    margin-top: 15px;
    overflow-wrap: anywhere;
}

.topper-name {
    font-size: 20px;
}

.stat-description {
    color: #9aa5b5;
    font-size: 11px;
    margin-top: 7px;
}

.dashboard-grid {
    display: grid;
    grid-template-columns: 1.6fr 1fr;
    gap: 20px;
}

.dashboard-card {
    background: white;
    border: 1px solid #e9edf4;
    border-radius: 15px;
    padding: 23px;
    box-shadow: 0 4px 15px rgba(15,23,42,.045);
}

.dashboard-card h3 {
    margin: 0;
    color: #17233e;
    font-size: 18px;
}

.card-subtitle {
    color: #8490a3;
    font-size: 12px;
    margin: 7px 0 20px;
}

.performance-box {
    background: #f8faff;
    border: 1px solid #e9eef8;
    border-radius: 11px;
    padding: 17px;
    margin-top: 13px;
}

.performance-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    margin-bottom: 10px;
}

.performance-label {
    color: #64748b;
    font-size: 12px;
    font-weight: 600;
}

.performance-value {
    color: #17233e;
    font-size: 16px;
    font-weight: 700;
    overflow-wrap: anywhere;
    text-align: right;
}

.progress {
    width: 100%;
    height: 9px;
    background: #e2e8f0;
    border-radius: 20px;
    overflow: hidden;
}

.progress-bar {
    height: 100%;
    width: <%=Math.max(0, Math.min(100, highestPercentage))%>%;
    background: linear-gradient(90deg,#2563eb,#60a5fa);
    border-radius: 20px;
}

.action-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 11px;
}

.action-btn {
    display: flex;
    flex-direction: column;
    gap: 9px;
    padding: 15px 12px;
    background: #f8faff;
    border: 1px solid #e7edf6;
    border-radius: 11px;
    text-decoration: none;
    color: #34425c;
    font-size: 12px;
    font-weight: 700;
    transition: .2s;
}

.action-btn i {
    color: #2563eb;
    font-size: 21px;
}

.action-btn:hover {
    background: #edf4ff;
    border-color: #9bbdf7;
    transform: translateY(-3px);
}

.info-card {
    margin-top: 20px;
}

.info-grid {
    display: grid;
    grid-template-columns: repeat(3,1fr);
    gap: 14px;
    margin-top: 18px;
}

.info-item {
    background: #f8faff;
    padding: 17px;
    border-radius: 11px;
    border: 1px solid #e9eef6;
}

.info-item i {
    color: #2563eb;
    font-size: 21px;
}

.info-item strong {
    display: block;
    color: #34425c;
    font-size: 13px;
    margin: 10px 0 6px;
}

.info-item span {
    color: #8591a5;
    font-size: 11px;
    line-height: 1.6;
}

.dashboard-footer {
    text-align: center;
    color: #9aa5b5;
    font-size: 11px;
    padding: 25px 10px;
}

@media(max-width:1100px) {
    .stats {
        grid-template-columns: repeat(2,1fr);
    }

    .dashboard-grid {
        grid-template-columns: 1fr;
    }
}

@media(max-width:750px) {
    .dashboard-header {
        padding: 18px 20px;
        flex-direction: column;
        align-items: flex-start;
        gap: 17px;
    }

    .main-layout {
        flex-direction: column;
    }

    .sidebar {
        width: 100%;
    }

    .dashboard-wrapper {
        width: 94%;
        margin-top: 20px;
    }

    .page-intro {
        align-items: flex-start;
        flex-direction: column;
    }

    .stats {
        grid-template-columns: 1fr 1fr;
        gap: 10px;
    }

    .stat-card {
        padding: 15px;
    }

    .stat-value {
        font-size: 24px;
    }

    .info-grid {
        grid-template-columns: 1fr;
    }
}

@media(max-width:420px) {
    .stats {
        grid-template-columns: 1fr;
    }

    .action-grid {
        grid-template-columns: 1fr 1fr;
    }

    .brand-section h1 {
        font-size: 21px;
    }
}
</style>
</head>

<body class="dashboard-page">

<header class="dashboard-header">
    <div class="brand-section">
        <h1><i class="bi bi-mortarboard-fill"></i> Result Management System</h1>
        <p>Academic Result & Student Management Portal</p>
    </div>

    <div class="admin-info">
        <div class="admin-avatar"><i class="bi bi-person-fill"></i></div>
        <div class="admin-details">
            <div class="welcome">Logged in as Administrator</div>
            <div class="admin-name"><%=adminName%></div>
        </div>
    </div>
</header>

<div class="dashboard-wrapper">
<div class="main-layout">

    <aside class="sidebar">
        <h2 class="sidebar-title">ADMIN PANEL</h2>

        <div class="sidebar-subtitle">Management</div>

        <a class="menu-btn" href="addStudent.jsp">
            <i class="bi bi-person-plus"></i> Add Student
        </a>

        <a class="menu-btn" href="ViewStudentsServlet">
            <i class="bi bi-people"></i> View Students
        </a>

        <a class="menu-btn" href="addSubject.jsp">
            <i class="bi bi-journal-plus"></i> Manage Subjects
        </a>

        <a class="menu-btn" href="ViewSubjectsServlet">
            <i class="bi bi-journals"></i> View Subjects
        </a>

        <hr class="menu-divider">

        <div class="sidebar-subtitle">Results</div>

        <a class="menu-btn" href="enterMarks.jsp">
            <i class="bi bi-pencil-square"></i> Enter Marks
        </a>

        <a class="menu-btn" href="adminViewResult.jsp">
            <i class="bi bi-file-earmark-text"></i> View Results
        </a>

        <a class="menu-btn" href="PassFailServlet">
            <i class="bi bi-clipboard-check"></i> Pass / Fail Report
        </a>

        <a class="menu-btn" href="TopperServlet">
            <i class="bi bi-trophy"></i> Topper List
        </a>

        <hr class="menu-divider">

        <div class="sidebar-subtitle">Tools</div>

        <a class="menu-btn" href="searchStudent.jsp">
            <i class="bi bi-search"></i> Search Student
        </a>

        <a class="menu-btn" href="ResultSummaryServlet">
            <i class="bi bi-bar-chart-line"></i> Result Summary
        </a>

        <hr class="menu-divider">

        <a href="LogoutServlet" class="menu-btn logout-btn">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </aside>

    <main class="content">

        <div class="page-intro">
            <div>
                <h2>Dashboard Overview</h2>
                <p>Welcome back! Here's what's happening in your institution.</p>
            </div>

            <div class="date-label">
                <i class="bi bi-calendar3"></i> <%=currentDate%>
            </div>
        </div>

        <div class="stats">

            <div class="stat-card">
                <div class="stat-top">
                    <div class="stat-label">TOTAL STUDENTS</div>
                    <div class="stat-icon icon-blue">
                        <i class="bi bi-people-fill"></i>
                    </div>
                </div>
                <div class="stat-value"><%=students != null ? students : 0%></div>
                <div class="stat-description">Registered student records</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <div class="stat-label">TOTAL SUBJECTS</div>
                    <div class="stat-icon icon-green">
                        <i class="bi bi-book-fill"></i>
                    </div>
                </div>
                <div class="stat-value"><%=subjects != null ? subjects : 0%></div>
                <div class="stat-description">Available academic subjects</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <div class="stat-label">MARK ENTRIES</div>
                    <div class="stat-icon icon-orange">
                        <i class="bi bi-pencil-square"></i>
                    </div>
                </div>
                <div class="stat-value"><%=marks != null ? marks : 0%></div>
                <div class="stat-description">Student subject marks</div>
            </div>

            <div class="stat-card">
                <div class="stat-top">
                    <div class="stat-label">TOP PERFORMER</div>
                    <div class="stat-icon icon-purple">
                        <i class="bi bi-trophy-fill"></i>
                    </div>
                </div>
                <div class="stat-value topper-name"><%=topper != null ? topper : "N/A"%></div>
                <div class="stat-description">Highest academic performance</div>
            </div>

        </div>

        <div class="dashboard-grid">

            <section class="dashboard-card">
                <h3><i class="bi bi-graph-up-arrow"></i> Academic Performance</h3>
                <p class="card-subtitle">Highest percentage recorded in the system</p>

                <div class="performance-box">
                    <div class="performance-row">
                        <span class="performance-label">Highest Percentage</span>
                        <span class="performance-value"><%=String.format("%.2f",highestPercentage)%>%</span>
                    </div>

                    <div class="progress">
                        <div class="progress-bar"></div>
                    </div>
                </div>

                <div class="performance-box">
                    <div class="performance-row">
                        <span class="performance-label">Top Performer</span>
                        <span class="performance-value"><%=topper != null ? topper : "N/A"%></span>
                    </div>
                </div>

                <div class="performance-box">
                    <div class="performance-row">
                        <span class="performance-label">Student Records</span>
                        <span class="performance-value"><%=students != null ? students : 0%></span>
                    </div>

                    <div class="performance-row" style="margin-bottom:0">
                        <span class="performance-label">Subject Records</span>
                        <span class="performance-value"><%=subjects != null ? subjects : 0%></span>
                    </div>
                </div>
            </section>

            <section class="dashboard-card">
                <h3><i class="bi bi-lightning-charge-fill"></i> Quick Actions</h3>
                <p class="card-subtitle">Frequently used administration tools</p>

                <div class="action-grid">
                    <a class="action-btn" href="addStudent.jsp">
                        <i class="bi bi-person-plus-fill"></i>
                        Add Student
                    </a>

                    <a class="action-btn" href="ViewStudentsServlet">
                        <i class="bi bi-people-fill"></i>
                        Students
                    </a>

                    <a class="action-btn" href="addSubject.jsp">
                        <i class="bi bi-journal-plus"></i>
                        Subjects
                    </a>

                    <a class="action-btn" href="enterMarks.jsp">
                        <i class="bi bi-pencil-square"></i>
                        Enter Marks
                    </a>

                    <a class="action-btn" href="adminViewResult.jsp">
                        <i class="bi bi-file-earmark-text"></i>
                        Results
                    </a>

                    <a class="action-btn" href="searchStudent.jsp">
                        <i class="bi bi-search"></i>
                        Search
                    </a>
                </div>
            </section>

        </div>

        <section class="dashboard-card info-card">
            <h3><i class="bi bi-info-circle"></i> System Information</h3>
            <p class="card-subtitle">Result Management System administration panel</p>

            <div class="info-grid">
                <div class="info-item">
                    <i class="bi bi-people-fill"></i>
                    <strong>Student Management</strong>
                    <span>Add, edit, delete and search student records.</span>
                </div>

                <div class="info-item">
                    <i class="bi bi-journal-check"></i>
                    <strong>Marks Management</strong>
                    <span>Enter student marks and generate academic results.</span>
                </div>

                <div class="info-item">
                    <i class="bi bi-bar-chart-fill"></i>
                    <strong>Reports & Analytics</strong>
                    <span>View topper, pass/fail and result summary reports.</span>
                </div>
            </div>
        </section>

    </main>
</div>
</div>

<footer class="dashboard-footer">
    © 2026 Result Management System | Academic Administration Portal
</footer>

</body>
</html>
