<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Patient Dashboard - MediCare</title>

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

    <h1>MediCare - Patient Dashboard</h1>

    <a class="logout"
       href="${pageContext.request.contextPath}/logout">
        Logout
    </a>

</div>

<div class="container">

    <div class="welcome">
        <h2>Welcome, Patient</h2>
        <p>Manage your appointments and medical information.</p>
    </div>

    <div class="cards">

        <!-- Book Appointment -->
        <div class="card">
            <h3>Book Appointment</h3>
            <p>Book an appointment with a doctor.</p>

            <a href="${pageContext.request.contextPath}/patient/book-appointment">
                Book Appointment
            </a>
        </div>


        <!-- Appointment History -->
        <div class="card">
            <h3>Appointment History</h3>
            <p>View your previous appointments.</p>

            <a href="${pageContext.request.contextPath}/patient/appointments">
                View History
            </a>
        </div>


        <!-- Medical History -->
        <div class="card">
            <h3>Medical History</h3>
            <p>View your medical records.</p>

            <a href="${pageContext.request.contextPath}/medical-records?patientId=1">
                View Records
            </a>
        </div>


        <!-- Profile -->
        <div class="card">
            <h3>Profile</h3>
            <p>Manage your personal information.</p>

            <a href="${pageContext.request.contextPath}/patient/profile.jsp">
                My Profile
            </a>
        </div>

    </div>

</div>

</body>
</html>