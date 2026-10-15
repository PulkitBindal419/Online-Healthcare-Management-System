<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Doctor Dashboard - MediCare</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f7fb;
        }

        .header {
            background: #1976d2;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
        }

        .logout {
            color: white;
            text-decoration: none;
            background: #d32f2f;
            padding: 10px 18px;
            border-radius: 5px;
        }

        .container {
            padding: 40px;
        }

        .welcome {
            margin-bottom: 30px;
        }

        .cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            width: 220px;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .card h3 {
            color: #1976d2;
        }

        .card a {
            display: inline-block;
            margin-top: 10px;
            color: #1976d2;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="header">

    <h1>MediCare - Doctor Dashboard</h1>

    <a class="logout" href="../logout">Logout</a>

</div>

<div class="container">

    <div class="welcome">
        <h2>Welcome, Doctor</h2>
        <p>Manage your appointments and patient information.</p>
    </div>

    <div class="cards">

        <!-- Appointments -->
        <div class="card">
            <h3>Appointments</h3>
            <p>View your patient appointments.</p>
            <a href="appointments">View Appointments</a>
        </div>

        <!-- Patient Records -->
        <!-- Patient Records -->
        <div class="card">
            <h3>Patient Records</h3>
            <p>Manage patient medical records.</p>
            <a href="${pageContext.request.contextPath}/medical-records?patientId=1&source=doctor">
                Medical Records
            </a>
        </div>
        <!-- Schedule -->
        <div class="card">
            <h3>Schedule</h3>
            <p>Manage your availability and schedule.</p>
            <a href="${pageContext.request.contextPath}/doctor/schedule">
                Manage Schedule
            </a>
        </div>

        <!-- Feedback -->
        <div class="card">
            <h3>Feedback</h3>
            <p>View patient feedback.</p>
            <a href="${pageContext.request.contextPath}/doctor/feedback">
                View Feedback
            </a>
        </div>

    </div>

</div>

</body>
</html>