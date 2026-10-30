
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Portal | Result Management System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    min-height: 100vh;
    font-family: 'Segoe UI', Arial, sans-serif;
    background: #f4f7fc;
    color: #172b4d;
}

.page {
    min-height: 100vh;
    display: grid;
    grid-template-columns: 1.05fr .95fr;
}

/* LEFT PANEL */
.brand-panel {
    position: relative;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    padding: 55px 9%;
    color: white;
    background: linear-gradient(145deg, #10264f, #1e4d91 65%, #2865ad);
}

.brand-panel::before,
.brand-panel::after {
    content: "";
    position: absolute;
    border: 1px solid rgba(255,255,255,.12);
    border-radius: 50%;
    pointer-events: none;
}

.brand-panel::before {
    width: 430px;
    height: 430px;
    right: -160px;
    top: 15%;
}

.brand-panel::after {
    width: 300px;
    height: 300px;
    right: -100px;
    top: 25%;
}

.brand-name {
    position: relative;
    z-index: 1;
    font-size: 19px;
    font-weight: 750;
    letter-spacing: .3px;
}

.brand-name i {
    font-size: 25px;
    margin-right: 10px;
}

.brand-content {
    position: relative;
    z-index: 1;
    max-width: 530px;
    margin: 50px 0;
}

.eyebrow {
    display: inline-block;
    padding: 8px 14px;
    border: 1px solid rgba(255,255,255,.25);
    border-radius: 30px;
    color: #dceaff;
    font-size: 12px;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin-bottom: 24px;
}

.brand-content h1 {
    font-size: clamp(34px, 4vw, 52px);
    line-height: 1.18;
    font-weight: 800;
    margin-bottom: 22px;
}

.brand-content p {
    color: #d6e5fa;
    font-size: 16px;
    line-height: 1.8;
}

.portal-points {
    margin-top: 32px;
    display: grid;
    gap: 17px;
}

.portal-points div {
    display: flex;
    align-items: center;
    gap: 12px;
    color: #edf4ff;
    font-size: 14px;
}

.portal-points i {
    color: #8fc3ff;
    font-size: 19px;
}

.brand-footer {
    position: relative;
    z-index: 1;
    color: #c4d7f2;
    font-size: 12px;
}

/* RIGHT PANEL */
.login-panel {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 45px 25px;
}

.login-card {
    width: 100%;
    max-width: 410px;
    background: white;
    padding: 42px;
    border-radius: 18px;
    box-shadow: 0 12px 45px rgba(25, 48, 86, .09);
}

.login-logo {
    width: 55px;
    height: 55px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 14px;
    background: #eaf1ff;
    color: #2459a6;
    font-size: 25px;
    margin-bottom: 26px;
}

.login-card h2 {
    font-size: 27px;
    font-weight: 800;
    color: #172b4d;
    margin-bottom: 8px;
}

.subtitle {
    font-size: 14px;
    color: #8490a3;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 21px;
}

.form-group label {
    display: block;
    color: #34445e;
    font-size: 13px;
    font-weight: 700;
    margin-bottom: 9px;
}

.input-wrap {
    position: relative;
}

.input-wrap > i {
    position: absolute;
    left: 14px;
    top: 50%;
    transform: translateY(-50%);
    color: #8a98ad;
    font-size: 17px;
}

.input-wrap input {
    width: 100%;
    height: 49px;
    border: 1px solid #dce3ed;
    border-radius: 9px;
    padding: 0 43px;
    font-size: 14px;
    outline: none;
    background: #fbfcff;
    transition: .2s;
}

.input-wrap input:focus {
    border-color: #2a5298;
    background: white;
    box-shadow: 0 0 0 3px rgba(42,82,152,.10);
}

.password-toggle {
    position: absolute;
    right: 14px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #8490a3;
    font-size: 17px;
}

.login-btn {
    width: 100%;
    height: 50px;
    border: none;
    border-radius: 9px;
    background: #1e477f;
    color: white;
    font-size: 15px;
    font-weight: 700;
    margin-top: 8px;
    transition: .25s;
    cursor: pointer;
}

.login-btn:hover {
    background: #163765;
    box-shadow: 0 7px 18px rgba(30,71,127,.2);
    transform: translateY(-1px);
}

.admin-link,
.home-link {
    display: block;
    text-align: center;
    margin-top: 18px;
    color: #426da9;
    text-decoration: none;
    font-size: 13px;
    font-weight: 600;
}

.admin-link:hover,
.home-link:hover {
    text-decoration: underline;
}

.login-bottom {
    text-align: center;
    color: #9aa5b5;
    font-size: 11px;
    margin-top: 25px;
    padding-top: 19px;
    border-top: 1px solid #edf0f5;
}

@media(max-width: 850px) {
    .page {
        grid-template-columns: 1fr;
    }

    .brand-panel {
        min-height: 340px;
        padding: 30px 8%;
    }

    .brand-content {
        margin: 45px 0 20px;
    }

    .brand-content h1 {
        font-size: 35px;
    }

    .portal-points,
    .brand-footer {
        display: none;
    }

    .login-panel {
        padding: 35px 18px;
    }
}

@media(max-width: 480px) {
    .login-card {
        padding: 30px 23px;
    }

    .brand-content h1 {
        font-size: 30px;
    }
}
</style>
</head>

<body>

<div class="page">

    <section class="brand-panel">

        <div class="brand-name">
            <i class="bi bi-mortarboard-fill"></i>
            RMS | STUDENT PORTAL
        </div>

        <div class="brand-content">

            <span class="eyebrow">
                <i class="bi bi-book-half me-1"></i>
                Student Access Portal
            </span>

            <h1>Your Academic Journey, All in One Place.</h1>

            <p>
                Access your academic performance, view examination
                results and stay updated with your educational records
                through a simple and secure portal.
            </p>

            <div class="portal-points">
                <div>
                    <i class="bi bi-check-circle-fill"></i>
                    View Your Examination Results
                </div>

                <div>
                    <i class="bi bi-check-circle-fill"></i>
                    Access Academic Records
                </div>

                <div>
                    <i class="bi bi-check-circle-fill"></i>
                    Simple and Secure Student Access
                </div>
            </div>

        </div>

        <div class="brand-footer">
            © 2026 Result Management System
        </div>

    </section>

    <section class="login-panel">

        <div class="login-card">

            <div class="login-logo">
                <i class="bi bi-mortarboard-fill"></i>
            </div>

            <h2>Welcome, Student!</h2>

            <p class="subtitle">
                Sign in to view your academic results.
            </p>

            <form action="StudentLoginServlet" method="post">

                <div class="form-group">

                    <label for="rollno">ROLL NUMBER</label>

                    <div class="input-wrap">
                        <i class="bi bi-person-vcard"></i>

                        <input
                            type="number"
                            id="rollno"
                            name="rollno"
                            placeholder="Enter your roll number"
                            required>
                    </div>

                </div>

                <div class="form-group">

                    <label for="password">PASSWORD</label>

                    <div class="input-wrap">
                        <i class="bi bi-lock"></i>

                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder="Enter your password"
                            autocomplete="current-password"
                            required>

                        <i class="bi bi-eye password-toggle"
                            id="togglePassword"
                            onclick="togglePasswordVisibility()"
                            role="button"
                            aria-label="Show password"
                            tabindex="0"></i>
                    </div>

                </div>

                <button type="submit" class="login-btn">
                    View My Results
                    <i class="bi bi-arrow-right ms-2"></i>
                </button>

            </form>

            <a href="login.jsp" class="admin-link">
                <i class="bi bi-shield-lock me-1"></i>
                Back to Admin Login
            </a>

            <a href="index.jsp" class="home-link">
                <i class="bi bi-house me-1"></i>
                Back to Home
            </a>

            <div class="login-bottom">
                Secure Student Access Portal
            </div>

        </div>

    </section>

</div>

<script>
function togglePasswordVisibility() {
    const password = document.getElementById("password");
    const icon = document.getElementById("togglePassword");

    if (password.type === "password") {
        password.type = "text";
        icon.classList.replace("bi-eye", "bi-eye-slash");
        icon.setAttribute("aria-label", "Hide password");
    } else {
        password.type = "password";
        icon.classList.replace("bi-eye-slash", "bi-eye");
        icon.setAttribute("aria-label", "Show password");
    }
}
</script>

</body>
</html>
