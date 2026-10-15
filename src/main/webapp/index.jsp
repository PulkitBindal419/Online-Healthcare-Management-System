<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>MediCare - Online Healthcare</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f2f7fb;
        }

        .header {
            background: #1976d2;
            color: white;
            padding: 20px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
        }

        .login-btn {
            background: white;
            color: #1976d2;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .hero {
            text-align: center;
            padding: 80px 20px;
        }

        .hero h2 {
            font-size: 40px;
            color: #1976d2;
        }

        .hero p {
            font-size: 18px;
            color: #555;
        }

        .features {
            display: flex;
            justify-content: center;
            gap: 25px;
            padding: 30px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            width: 220px;
            padding: 25px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .card h3 {
            color: #1976d2;
        }
    </style>
</head>

<body>

<div class="header">

    <h1>MediCare</h1>

    <a class="login-btn" href="login.jsp">
        Login
    </a>

</div>

<div class="hero">

    <h2>Online Healthcare Management System</h2>

    <p>
        Manage appointments, doctors, patients and medical records
        in one simple system.
    </p>

</div>

<div class="features">

    <div class="card">
        <h3>Doctors</h3>
        <p>Manage doctor information and appointments.</p>
    </div>

    <div class="card">
        <h3>Patients</h3>
        <p>Access profiles and medical history.</p>
    </div>

    <div class="card">
        <h3>Appointments</h3>
        <p>Book and manage healthcare appointments.</p>
    </div>

    <div class="card">
        <h3>Medical Records</h3>
        <p>Maintain patient medical information.</p>
    </div>

</div>

</body>
</html>