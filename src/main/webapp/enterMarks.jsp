<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">

<title>Enter Marks - Result Management System</title>

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
    min-height: calc(100vh - 145px);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
}

/* Card */

.card {
    width: 100%;
    max-width: 500px;
    background: white;
    border-radius: 14px;
    padding: 35px;
    border: 1px solid #e5e7eb;
    box-shadow: 0 8px 30px rgba(0,0,0,0.08);
}

.card-header {
    margin-bottom: 28px;
}

.card-header h2 {
    font-size: 24px;
    color: #111827;
    margin-bottom: 8px;
}

.card-header p {
    font-size: 14px;
    color: #6b7280;
    line-height: 1.5;
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
    padding: 12px 14px;
    border: 1px solid #d1d5db;
    border-radius: 8px;
    font-size: 15px;
    outline: none;
    transition: 0.2s;
}

.form-group input:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 3px rgba(37,99,235,0.12);
}

/* Marks hint */

.marks-info {
    margin-top: -8px;
    margin-bottom: 22px;
    padding: 12px 14px;
    background: #eff6ff;
    border-left: 4px solid #2563eb;
    border-radius: 6px;
    font-size: 13px;
    color: #374151;
    line-height: 1.5;
}

/* Buttons */

.button-row {
    display: flex;
    gap: 12px;
    margin-top: 8px;
}

.btn {
    flex: 1;
    padding: 12px 16px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    transition: 0.2s;
}

.submit-btn {
    border: none;
    background: #2563eb;
    color: white;
}

.submit-btn:hover {
    background: #1d4ed8;
}

.back-btn {
    background: #f3f4f6;
    color: #374151;
    border: 1px solid #d1d5db;
}

.back-btn:hover {
    background: #e5e7eb;
}

/* Footer */

.footer {
    text-align: center;
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

    .card {
        padding: 25px 20px;
    }

    .button-row {
        flex-direction: column;
    }

}

</style>

</head>

<body>

<div class="header">

```
<h1>Result Management System</h1>

<p>Academic Result &amp; Student Management Portal</p>
```

</div>

<div class="main">

<div class="card">

    <div class="card-header">

        <h2>Enter Student Marks</h2>

        <p>
            Add subject-wise marks for a student in the result system.
        </p>

    </div>


    <form action="EnterMarksServlet" method="post">

        <div class="form-group">

            <label for="rollno">
                Roll Number
            </label>

            <input
                type="number"
                id="rollno"
                name="rollno"
                placeholder="Enter student roll number"
                required
            >

        </div>


        <div class="form-group">

            <label for="subjectId">
                Subject ID
            </label>

            <input
                type="number"
                id="subjectId"
                name="subjectId"
                placeholder="Enter subject ID"
                required
            >

        </div>


        <div class="form-group">

            <label for="marks">
                Marks
            </label>

            <input
                type="number"
                id="marks"
                name="marks"
                placeholder="Enter marks obtained"
                min="0"
                max="100"
                required
            >

        </div>


        <div class="marks-info">

            <strong>Marks Range:</strong>
            Enter marks between 0 and 100.

        </div>


        <div class="button-row">

            <button
                type="submit"
                class="btn submit-btn">
                Save Marks
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
