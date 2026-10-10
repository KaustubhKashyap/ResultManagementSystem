<%@ page import="com.rms.model.Subject" %>

<%
    Subject s = (Subject) request.getAttribute("subject");

    if (s == null) {
        response.sendRedirect("ViewSubjectsServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Update Subject - Result Management System</title>

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
        }

        .header {
            background: #0f4c81;
            color: white;
            padding: 24px 40px;
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 6px;
        }

        .header p {
            font-size: 14px;
            color: #dbeafe;
        }

        .container {
            width: 100%;
            max-width: 700px;
            margin: 45px auto;
            padding: 0 20px;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 35px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        .card h2 {
            color: #1f2937;
            font-size: 24px;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 25px;
        }

        .info-box {
            background: #eff6ff;
            border-left: 4px solid #2563eb;
            padding: 14px 16px;
            margin-bottom: 25px;
            color: #1e40af;
            font-size: 14px;
            line-height: 1.5;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #374151;
            font-size: 14px;
            font-weight: bold;
        }

        input[type="number"],
        input[type="text"] {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            font-size: 15px;
            outline: none;
            transition: 0.2s;
        }

        input[type="number"]:focus,
        input[type="text"]:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
        }

        input[readonly] {
            background: #f3f4f6;
            color: #6b7280;
            cursor: not-allowed;
        }

        .button-row {
            display: flex;
            gap: 12px;
            margin-top: 28px;
        }

        .btn {
            border: none;
            padding: 12px 22px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-update {
            background: #2563eb;
            color: white;
        }

        .btn-update:hover {
            background: #1d4ed8;
        }

        .btn-cancel {
            background: #e5e7eb;
            color: #374151;
        }

        .btn-cancel:hover {
            background: #d1d5db;
        }

        .footer {
            text-align: center;
            color: #9ca3af;
            font-size: 13px;
            margin-top: 35px;
        }

        @media (max-width: 600px) {

            .header {
                padding: 20px;
            }

            .header h1 {
                font-size: 23px;
            }

            .card {
                padding: 25px;
            }

            .button-row {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }

    </style>

</head>

<body>

    <div class="header">
        <h1>Result Management System</h1>
        <p>Academic Result &amp; Student Management Portal</p>
    </div>


    <div class="container">

        <div class="card">

            <h2>Update Subject</h2>

            <p class="subtitle">
                Modify the subject details and save the updated information.
            </p>

            <div class="info-box">
                Subject ID cannot be changed. You can update the subject name below.
            </div>


            <form action="UpdateSubjectServlet" method="post">

                <div class="form-group">

                    <label for="subjectId">
                        Subject ID
                    </label>

                    <input
                        type="number"
                        id="subjectId"
                        name="subjectId"
                        value="<%=s.getSubjectId()%>"
                        readonly>

                </div>


                <div class="form-group">

                    <label for="subjectName">
                        Subject Name
                    </label>

                    <input
                        type="text"
                        id="subjectName"
                        name="subjectName"
                        value="<%=s.getSubjectName()%>"
                        required>

                </div>


                <div class="button-row">

                    <input
                        type="submit"
                        value="Update Subject"
                        class="btn btn-update">

                    <a
                        href="ViewSubjectsServlet"
                        class="btn btn-cancel">
                        Cancel
                    </a>

                </div>

            </form>

        </div>


        <div class="footer">
            Result Management System &copy; 2026
        </div>

    </div>

</body>
</html>