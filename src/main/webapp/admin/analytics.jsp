<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Analytics - MediCare</title>

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

        .back {
            color: white;
            text-decoration: none;
            background: #1565c0;
            padding: 10px 18px;
            border-radius: 5px;
        }

        .container {
            padding: 40px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
            max-width: 800px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .card h3 {
            margin-top: 0;
            color: #333;
        }

        .number {
            font-size: 36px;
            font-weight: bold;
            color: #1976d2;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>MediCare - Analytics</h1>

    <a class="back"
       href="${pageContext.request.contextPath}/admin/dashboard.jsp">
        Back to Dashboard
    </a>
</div>

<div class="container">

    <h2>System Performance Analytics</h2>

    <div class="cards">

        <div class="card">
            <h3>Total Users</h3>
            <div class="number">${totalUsers}</div>
        </div>

        <div class="card">
            <h3>Total Appointments</h3>
            <div class="number">${totalAppointments}</div>
        </div>

        <div class="card">
            <h3>Total Medical Records</h3>
            <div class="number">${totalMedicalRecords}</div>
        </div>

        <div class="card">
            <h3>Total Feedback</h3>
            <div class="number">${totalFeedback}</div>
        </div>

    </div>

</div>

</body>
</html>