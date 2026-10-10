<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Search Student - Result Management System</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    min-height: 100vh;
    background: #f4f7fb;
    color: #1f2937;
}

/* Header */

.header {
    background: #1e3a8a;
    color: white;
    padding: 20px 40px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.12);
}

.header h1 {
    font-size: 24px;
    margin-bottom: 5px;
}

.header p {
    font-size: 14px;
    opacity: 0.85;
}

/* Main */

.main {
    width: 92%;
    max-width: 600px;
    margin: 55px auto;
}

/* Card */

.card {
    background: white;
    padding: 35px;
    border-radius: 14px;
    border: 1px solid #e5e7eb;
    box-shadow: 0 8px 30px rgba(0,0,0,0.08);
}

.card-header {
    text-align: center;
    margin-bottom: 28px;
}

.card-header h2 {
    font-size: 25px;
    color: #111827;
    margin-bottom: 8px;
}

.card-header p {
    color: #6b7280;
    font-size: 14px;
    line-height: 1.5;
}

/* Search icon area */

.search-box {
    background: #eff6ff;
    border: 1px solid #dbeafe;
    padding: 18px;
    border-radius: 10px;
    margin-bottom: 25px;
    text-align: center;
}

.search-box-title {
    color: #1e40af;
    font-size: 14px;
    font-weight: 600;
    margin-bottom: 5px;
}

.search-box-text {
    color: #64748b;
    font-size: 13px;
}

/* Form */

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-size: 14px;
    font-weight: 600;
    color: #374151;
}

.form-group input {
    width: 100%;
    padding: 13px 14px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    font-size: 15px;
    outline: none;
    transition: 0.2s;
}

.form-group input:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37,99,235,0.10);
}

/* Buttons */

.search-btn {
    width: 100%;
    padding: 13px;
    border: none;
    background: #2563eb;
    color: white;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s;
}

.search-btn:hover {
    background: #1d4ed8;
}

.back-btn {
    display: block;
    width: 100%;
    margin-top: 12px;
    padding: 12px;
    background: #374151;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    text-align: center;
    font-size: 14px;
    font-weight: 600;
    transition: 0.2s;
}

.back-btn:hover {
    background: #1f2937;
}

/* Footer */

.footer {
    text-align: center;
    margin-top: 35px;
    padding: 18px;
    background: white;
    border-top: 1px solid #e5e7eb;
    color: #6b7280;
    font-size: 13px;
}

/* Responsive */

@media (max-width: 600px) {

    .header {
        padding: 18px 20px;
    }

    .main {
        width: 94%;
        margin: 30px auto;
    }

    .card {
        padding: 24px 20px;
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

        <h2>Search Student</h2>

        <p>
            Find a registered student using their roll number.
        </p>

    </div>


    <div class="search-box">

        <div class="search-box-title">
            Student Search
        </div>

        <div class="search-box-text">
            Enter the student's roll number to view their details.
        </div>

    </div>


    <form action="SearchStudentServlet" method="post">

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


        <button
            type="submit"
            class="search-btn">

            Search Student

        </button>

    </form>


    <a
        href="DashboardServlet"
        class="back-btn">

        Back To Dashboard

    </a>

</div>


</div>

<div class="footer">

Result Management System &nbsp;|&nbsp; Administrator Portal


</div>

</body>

</html>
