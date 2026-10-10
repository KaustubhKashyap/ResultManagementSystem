<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Add Subject - Result Management System</title>

<style>

* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f7fb;
    color: #1f2937;
}

/* Header */
.header {
    background: #1e3a8a;
    color: white;
    padding: 22px 40px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.12);
}

.header h1 {
    margin: 0;
    font-size: 25px;
}

.header p {
    margin: 6px 0 0;
    font-size: 14px;
    opacity: 0.9;
}

/* Main container */
.container {
    width: 560px;
    max-width: 92%;
    margin: 50px auto;
}

/* Card */
.card {
    background: white;
    border-radius: 14px;
    padding: 32px;
    box-shadow: 0 4px 18px rgba(0,0,0,0.10);
}

/* Card header */
.card-header {
    border-bottom: 1px solid #e5e7eb;
    padding-bottom: 18px;
    margin-bottom: 24px;
}

.card-header h2 {
    margin: 0;
    color: #1e3a8a;
    font-size: 22px;
}

.card-header p {
    margin: 7px 0 0;
    color: #6b7280;
    font-size: 14px;
}

/* Form */
.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 7px;
    font-weight: bold;
    color: #374151;
    font-size: 14px;
}

input[type="number"],
input[type="text"] {
    width: 100%;
    padding: 12px 13px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    font-size: 14px;
    color: #111827;
    background: white;
}

input[type="number"]:focus,
input[type="text"]:focus {
    outline: none;
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37,99,235,0.10);
}

/* Submit */
.submit-btn {
    width: 100%;
    padding: 13px;
    margin-top: 5px;
    border: none;
    border-radius: 8px;
    background: #2563eb;
    color: white;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.2s;
}

.submit-btn:hover {
    background: #1d4ed8;
}

/* Back button */
.back-btn {
    display: block;
    text-align: center;
    margin-top: 18px;
    padding: 11px;
    border-radius: 8px;
    text-decoration: none;
    background: #374151;
    color: white;
    font-size: 14px;
    font-weight: bold;
    transition: 0.2s;
}

.back-btn:hover {
    background: #1f2937;
}

/* Info box */
.info-box {
    background: #eff6ff;
    border: 1px solid #bfdbfe;
    color: #1e40af;
    padding: 12px 14px;
    border-radius: 8px;
    font-size: 13px;
    margin-bottom: 22px;
}

/* Footer */
.footer {
    text-align: center;
    color: #6b7280;
    font-size: 13px;
    margin-top: 25px;
}

/* Mobile */
@media (max-width: 600px) {

    .header {
        padding: 20px;
    }

    .container {
        margin: 30px auto;
    }

    .card {
        padding: 22px;
    }
}

</style>

</head>

<body>

<!-- Header -->

<div class="header">
    <h1>Result Management System</h1>
    <p>Academic Result & Student Management Portal</p>
</div>

<!-- Main -->

<div class="container">

<div class="card">

    <div class="card-header">
        <h2>Add New Subject</h2>
        <p>Create a new subject for the academic result system</p>
    </div>

    <div class="info-box">
        Enter a unique Subject ID and the corresponding Subject Name.
    </div>

    <form action="AddSubjectServlet" method="post">

        <div class="form-group">
            <label>Subject ID</label>
            <input type="number"
                   name="subjectId"
                   placeholder="Enter subject ID"
                   required>
        </div>

        <div class="form-group">
            <label>Subject Name</label>
            <input type="text"
                   name="subjectName"
                   placeholder="Enter subject name"
                   required>
        </div>

        <input type="submit"
               value="Add Subject"
               class="submit-btn">

    </form>

    <a href="DashboardServlet"
       class="back-btn">
        Back To Dashboard
    </a>

</div>

<div class="footer">
    Result Management System &copy; 2026
</div>


</div>

</body>
</html>
