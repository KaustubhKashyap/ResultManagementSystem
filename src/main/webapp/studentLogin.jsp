<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Student Login | Result Management System</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    min-height:100vh;
    font-family:Arial, sans-serif;

    display:flex;
    justify-content:center;
    align-items:center;

    background:
        linear-gradient(
            135deg,
            #1f2d3a,
            #2c3e50,
            #3498db
        );
}


/* Login Card */

.container{
    width:410px;
    max-width:92%;

    background:white;

    padding:40px;

    border-radius:18px;

    box-shadow:
        0 15px 40px rgba(0,0,0,0.28);
}


/* Logo */

.logo{
    text-align:center;
    margin-bottom:28px;
}

.logo-icon{
    width:68px;
    height:68px;

    margin:0 auto 15px;

    border-radius:50%;

    display:flex;
    align-items:center;
    justify-content:center;

    background:#3498db;

    color:white;

    font-size:28px;
    font-weight:bold;
}

.logo h1{
    color:#2c3e50;
    font-size:28px;
    margin-bottom:7px;
}

.logo p{
    color:#7f8c8d;
    font-size:14px;
}


/* Heading */

.login-heading{
    text-align:center;
    margin-bottom:22px;
}

.login-heading h2{
    color:#2c3e50;
    font-size:21px;
}

.login-heading p{
    color:#95a5a6;
    font-size:13px;
    margin-top:6px;
}


/* Form */

.form-group{
    margin-top:16px;
}

.form-group label{
    display:block;

    margin-bottom:7px;

    color:#34495e;

    font-size:14px;
    font-weight:bold;
}

input{
    width:100%;

    padding:13px 14px;

    border:1px solid #dfe4ea;

    border-radius:9px;

    font-size:15px;

    background:#fafbfc;

    transition:0.25s;
}

input:focus{
    outline:none;

    border-color:#3498db;

    background:white;

    box-shadow:
        0 0 0 3px rgba(52,152,219,0.12);
}


/* Login Button */

button{
    width:100%;

    padding:14px;

    margin-top:24px;

    border:none;

    border-radius:9px;

    background:#3498db;

    color:white;

    font-size:16px;

    font-weight:bold;

    cursor:pointer;

    transition:0.25s;
}

button:hover{
    background:#2980b9;

    transform:translateY(-1px);

    box-shadow:
        0 5px 14px rgba(52,152,219,0.3);
}


/* Admin Login Link */

.admin-link{
    display:block;

    text-align:center;

    margin-top:18px;

    color:#3498db;

    text-decoration:none;

    font-size:13px;

    font-weight:bold;
}

.admin-link:hover{
    text-decoration:underline;
}


/* Footer */

.footer{
    text-align:center;

    margin-top:22px;

    padding-top:18px;

    border-top:1px solid #ecf0f1;

    color:#95a5a6;

    font-size:12px;
}


/* Responsive */

@media(max-width:500px){

    .container{
        padding:30px 24px;
    }

    .logo h1{
        font-size:25px;
    }

}

</style>

</head>


<body>


<div class="container">


    <!-- Logo -->

    <div class="logo">

        <div class="logo-icon">
            RMS
        </div>

        <h1>
            Result Management System
        </h1>

        <p>
            Academic Result & Student Management Portal
        </p>

    </div>


    <!-- Login Heading -->

    <div class="login-heading">

        <h2>
            Student Login
        </h2>

        <p>
            Login to view your academic result
        </p>

    </div>


    <!-- Login Form -->

    <form
        action="StudentLoginServlet"
        method="post">


        <div class="form-group">

            <label for="rollno">
                Roll Number
            </label>

            <input
                type="number"
                id="rollno"
                name="rollno"
                placeholder="Enter Roll Number"
                required>

        </div>


        <div class="form-group">

            <label for="password">
                Password
            </label>

            <input
                type="password"
                id="password"
                name="password"
                placeholder="Enter Password"
                autocomplete="current-password"
                required>

        </div>


        <button type="submit">
            Login
        </button>


    </form>


    <!-- Admin Login -->

    <a
        href="login.jsp"
        class="admin-link">

        &#8592; Back To Admin Login

    </a>


    <!-- Footer -->

    <div class="footer">

        Student Portal
        &nbsp;•&nbsp;
        Secure Access

    </div>


</div>


</body>

</html>