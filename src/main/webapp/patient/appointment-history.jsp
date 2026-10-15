<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.healthcare.model.Appointment" %>

<!DOCTYPE html>
<html>
<head>
    <title>Appointment History - MediCare</title>

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

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        th {
            background: #1976d2;
            color: white;
            padding: 14px;
            text-align: left;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
        }

        .status {
            font-weight: bold;
        }

        .empty {
            background: white;
            padding: 30px;
            text-align: center;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>

<body>

<div class="header">
    <h1>MediCare - Appointment History</h1>

    <a class="back"
       href="${pageContext.request.contextPath}/patient/dashboard.jsp">
        Back to Dashboard
    </a>
</div>

<div class="container">

    <h2>My Appointments</h2>

    <%
        List<Appointment> appointments =
                (List<Appointment>) request.getAttribute("appointments");
    %>

    <% if (appointments != null && !appointments.isEmpty()) { %>

        <table>
            <tr>
                <th>ID</th>
                <th>Doctor ID</th>
                <th>Date</th>
                <th>Time</th>
                <th>Reason</th>
                <th>Status</th>
            </tr>

            <% for (Appointment appointment : appointments) { %>

                <tr>
                    <td><%= appointment.getId() %></td>
                    <td><%= appointment.getDoctorId() %></td>
                    <td><%= appointment.getAppointmentDate() %></td>
                    <td><%= appointment.getAppointmentTime() %></td>
                    <td><%= appointment.getReason() %></td>
                    <td class="status">
                        <%= appointment.getStatus() %>
                    </td>
                </tr>

            <% } %>

        </table>

    <% } else { %>

        <div class="empty">
            <h3>No appointments found.</h3>
            <p>You have not booked any appointments yet.</p>
        </div>

    <% } %>

</div>

</body>
</html>