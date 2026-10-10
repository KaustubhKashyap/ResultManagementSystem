<%@ page import="com.rms.model.Marks" %>

<%
    Marks m = (Marks) request.getAttribute("marks");

    if (m == null) {
        response.sendRedirect("ViewMarksServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Update Marks - Result Management System</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #f4f7fb;
            min-height: 100vh;
            color: #1f2937;
        }

        .header {
            background: #1e3a8a;
            color: white;
            padding: 22px 40px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.12);
        }

        .header h1 {
            font-size: 25px;
            margin-bottom: 5px;
        }

        .header p {
            font-size: 14px;
            opacity: 0.85;
        }

        .main {
            min-height: calc(100vh - 145px);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .card {
            width: 100%;
            max-width: 550px;
            background: white;
            border-radius: 14px;
            padding: 35px;
            border: 1px solid #e5e7eb;
            box-shadow: 0 8px 30px rgba(0,0,0,0.08);
        }

        .card-header {
            margin-bottom: 25px;
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

        .info-box {
            background: #eff6ff;
            border-left: 4px solid #2563eb;
            padding: 13px 15px;
            margin-bottom: 25px;
            border-radius: 6px;
            color: #374151;
            font-size: 13px;
            line-height: 1.5;
        }

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

        .form-group input[readonly] {
            background: #f3f4f6;
            color: #6b7280;
            cursor: not-allowed;
        }

        .marks-info {
            margin-top: -5px;
            margin-bottom: 22px;
            padding: 12px 14px;
            background: #f0fdf4;
            border-left: 4px solid #16a34a;
            border-radius: 6px;
            font-size: 13px;
            color: #374151;
        }

        .button-row {
            display: flex;
            gap: 12px;
            margin-top: 25px;
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

        .update-btn {
            border: none;
            background: #2563eb;
            color: white;
        }

        .update-btn:hover {
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

        .footer {
            text-align: center;
            padding: 18px;
            background: white;
            border-top: 1px solid #e5e7eb;
            color: #6b7280;
            font-size: 13px;
        }

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

        <h1>Result Management System</h1>

        <p>
            Academic Result &amp; Student Management Portal
        </p>

    </div>


    <div class="main">

        <div class="card">

            <div class="card-header">

                <h2>Update Student Marks</h2>

                <p>
                    Modify the existing subject-wise marks for a student.
                </p>

            </div>


            <div class="info-box">

                Roll Number and Subject ID identify the existing marks
                record and cannot be changed.

            </div>


            <form action="UpdateMarksServlet" method="post">


                <div class="form-group">

                    <label for="rollno">
                        Roll Number
                    </label>

                    <input
                        type="number"
                        id="rollno"
                        name="rollno"
                        value="<%=m.getRollNo()%>"
                        readonly>

                </div>


                <div class="form-group">

                    <label for="subjectId">
                        Subject ID
                    </label>

                    <input
                        type="number"
                        id="subjectId"
                        name="subjectId"
                        value="<%=m.getSubjectId()%>"
                        readonly>

                </div>


                <div class="form-group">

                    <label for="marks">
                        Marks
                    </label>

                    <input
                        type="number"
                        id="marks"
                        name="marks"
                        value="<%=m.getMarks()%>"
                        min="0"
                        max="100"
                        required>

                </div>


                <div class="marks-info">

                    <strong>Marks Range:</strong>
                    Enter marks between 0 and 100.

                </div>


                <div class="button-row">

                    <button
                        type="submit"
                        class="btn update-btn">

                        Update Marks

                    </button>


                    <a
                        href="ViewMarksServlet"
                        class="btn back-btn">

                        Cancel

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