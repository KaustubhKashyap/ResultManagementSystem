<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
}

.container{

width:350px;
margin:100px auto;
padding:20px;

background:white;

border-radius:10px;

box-shadow:0px 0px 10px gray;
}

input{

width:100%;
padding:10px;
margin-top:10px;
}

button{

width:100%;
padding:10px;
margin-top:15px;

cursor:pointer;
}

</style>

</head>

<body>

<div class="container">

<h2>Admin Login</h2>

<form action="LoginServlet" method="post">

<input type="text"
name="username"
placeholder="Username"
required>

<input type="password"
name="password"
placeholder="Password"
required>

<button type="submit">

Login

</button>

</form>

</div>

</body>
</html>