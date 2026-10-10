<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>View Student Result - Result Management System</title>

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

.main {
    max-width: 700px;
    margin: 50px auto;
    padding: 0 20px;
}

.card {
    background: white;
    border-radius: 12px;
    padding: 35px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.card h2 {
    font-size: 24px;
    margin-bottom: 8px;
}

.card p {
    color: #6b7280;
    margin-bottom: 25px;
}

.info-box {
    background: #eff6ff;
    border-left: 4px solid #2563eb;
    padding: 14px;
    margin-bottom: 25px;
    font-size: 14px;
    color: #374151;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 8px;
}

.form-group input {
    width: 100%;
    padding: 12px;
    border: 1px solid #d1d5db;
    border-radius: 7px;
    font-size: 15px;
}

.form-group input:focus {
    outline: none;
    border-color: #2563eb;
}

.button-row {
    display: flex;
    gap: 12px;
    margin-top: 25px;
}

.btn {
    padding: 12px 22px;
    border-radius: 7px;
    text-decoration: none;
    border: none;
    cursor: pointer;
    font-size: 15px;
}

.search-btn {
    background: #2563eb;
    color: white;
}

.search-btn:hover {
    background: #1d4ed8;
}

.back-btn {
    background: #e5e7eb;
    color: #374151;
}

.footer {
    text-align: center;
    margin-top: 50px;
    padding: 20px;
    color: #6b7280;
    font-size: 13px;
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

        <h2>View Student Result</h2>

        <p>
            Enter a student's roll number to view the complete academic result.
        </p>

        <div class="info-box">
            Enter the registered roll number of the student whose result you want to view.
        </div>

        <form action="AdminViewResultServlet" method="get">

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

            <div class="button-row">

                <button
                    type="submit"
                    class="btn search-btn">
                    View Result
                </button>

                <a
                    href="DashboardServlet"
                    class="btn back-btn">
                    Back To Dashboard
                </a>

            </div>

        </form>

    </div>

</div>

<div class="footer">

    Result Management System &nbsp;|&nbsp; Administrator Portal

</div>

</body>
</html>