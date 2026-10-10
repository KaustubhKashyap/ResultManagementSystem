<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Admin Login | Result Management System</title>

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
    margin-bottom:30px;
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
    font-size:30px;
    font-weight:bold;
}

.logo h1{
    color:#2c3e50;
    font-size:30px;
    margin-bottom:7px;
}

.logo p{
    color:#7f8c8d;
    font-size:14px;
}


/* Login Heading */

.login-heading{
    text-align:center;
    margin-bottom:20px;
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


/* Footer */

.footer{
    text-align:center;
    margin-top:24px;
    padding-top:18px;
    border-top:1px solid #ecf0f1;
    color:#95a5a6;
    font-size:12px;
}

.footer strong{
    color:#7f8c8d;
}


/* Responsive */

@media(max-width:500px){

    .container{
        padding:30px 24px;
    }

    .logo h1{
        font-size:27px;
    }

}

</style>

</head>


<body>


<div class="container">


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


    <div class="login-heading">

        <h2>
            Admin Login
        </h2>

        <p>
            Sign in to access the administration panel
        </p>

    </div>


    <form
        action="LoginServlet"
        method="post">


        <div class="form-group">

            <label for="username">
                Username
            </label>

            <input
                type="text"
                id="username"
                name="username"
                placeholder="Enter Username"
                autocomplete="username"
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


    <div class="footer">

        <strong>Admin Panel</strong>
        &nbsp;•&nbsp;
        Secure Access

    </div>


</div>


</body>

</html>