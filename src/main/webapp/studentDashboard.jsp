<%@ page import="com.rms.model.Student" %>

<%
Student s =
    (Student) session.getAttribute("student");

if(s == null){
    response.sendRedirect("studentLogin.jsp");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Student Dashboard | Result Management System</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    min-height:100vh;
    font-family:Arial, sans-serif;
    background:#f4f6f9;
    color:#2c3e50;
}


/* Header */

.header{
    background:#2c3e50;
    color:white;
    padding:20px 35px;

    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header-left h1{
    font-size:24px;
}

.header-left p{
    margin-top:5px;
    color:#dfe6e9;
    font-size:13px;
}

.header-right{
    font-size:14px;
}


/* Main */

.container{
    width:92%;
    max-width:1050px;
    margin:35px auto;
}


/* Welcome */

.welcome-card{
    background:white;
    padding:28px;
    border-radius:15px;

    box-shadow:
        0 4px 15px rgba(0,0,0,0.08);

    margin-bottom:22px;
}

.welcome-card h2{
    color:#2c3e50;
    font-size:25px;
}

.welcome-card p{
    margin-top:8px;
    color:#7f8c8d;
}


/* Profile Section */

.profile-card{
    background:white;
    padding:28px;
    border-radius:15px;

    box-shadow:
        0 4px 15px rgba(0,0,0,0.08);
}

.profile-card h3{
    font-size:20px;
    margin-bottom:20px;
    color:#2c3e50;
}


/* Student Information */

.info-grid{
    display:grid;
    grid-template-columns:
        repeat(2,1fr);

    gap:16px;
}

.info-box{
    background:#f8fafc;
    border:1px solid #e5e9ed;
    border-radius:10px;
    padding:18px;
}

.info-label{
    display:block;
    color:#7f8c8d;
    font-size:13px;
    margin-bottom:7px;
}

.info-value{
    color:#2c3e50;
    font-size:16px;
    font-weight:bold;
}


/* Action Section */

.actions{
    margin-top:25px;

    display:grid;
    grid-template-columns:
        repeat(3,1fr);

    gap:15px;
}

.btn{
    display:block;
    padding:14px;

    text-align:center;

    color:white;
    text-decoration:none;

    border-radius:9px;

    font-weight:bold;
    font-size:14px;

    transition:0.25s;
}

.btn:hover{
    transform:translateY(-2px);
}


/* Buttons */

.result-btn{
    background:#3498db;
}

.result-btn:hover{
    background:#2980b9;
}

.password-btn{
    background:#27ae60;
}

.password-btn:hover{
    background:#219150;
}

.logout-btn{
    background:#e74c3c;
}

.logout-btn:hover{
    background:#c0392b;
}


/* Footer */

.footer{
    text-align:center;
    padding:25px;

    color:#95a5a6;
    font-size:12px;
}


/* Responsive */

@media(max-width:700px){

    .header{
        padding:18px;
        display:block;
    }

    .header-right{
        margin-top:10px;
    }

    .container{
        width:94%;
        margin:20px auto;
    }

    .info-grid{
        grid-template-columns:1fr;
    }

    .actions{
        grid-template-columns:1fr;
    }

}

</style>

</head>


<body>


<!-- Header -->

<div class="header">

    <div class="header-left">

        <h1>
            RMS
        </h1>

        <p>
            Result Management System
        </p>

    </div>


    <div class="header-right">

        Welcome,
        <strong><%=s.getName()%></strong>

    </div>

</div>


<!-- Main -->

<div class="container">


    <!-- Welcome Card -->

    <div class="welcome-card">

        <h2>
            Welcome, <%=s.getName()%> 
        </h2>

        <p>
            View your academic information and examination result
            from your student portal.
        </p>

    </div>


    <!-- Profile -->

    <div class="profile-card">

        <h3>
            Student Profile
        </h3>


        <div class="info-grid">


            <div class="info-box">

                <span class="info-label">
                    Roll Number
                </span>

                <span class="info-value">
                    <%=s.getRollNo()%>
                </span>

            </div>


            <div class="info-box">

                <span class="info-label">
                    Student Name
                </span>

                <span class="info-value">
                    <%=s.getName()%>
                </span>

            </div>


            <div class="info-box">

                <span class="info-label">
                    Class
                </span>

                <span class="info-value">
                    <%=s.getStudentClass()%>
                </span>

            </div>


            <div class="info-box">

                <span class="info-label">
                    Email Address
                </span>

                <span class="info-value">
                    <%=s.getEmail()%>
                </span>

            </div>


        </div>


        <!-- Actions -->

        <div class="actions">


            <a
                href="ViewResultServlet"
                class="btn result-btn">

                 View Result

            </a>


            <a
                href="changePassword.jsp"
                class="btn password-btn">

                 Change Password

            </a>


            <a
                href="StudentLogoutServlet"
                class="btn logout-btn">

                 Logout

            </a>


        </div>


    </div>


</div>


<!-- Footer -->

<div class="footer">

    &copy; 2026 Result Management System
    &nbsp;|&nbsp;
    Student Portal

</div>


</body>

</html>