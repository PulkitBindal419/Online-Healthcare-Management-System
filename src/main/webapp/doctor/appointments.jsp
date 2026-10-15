<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.healthcare.model.Appointment" %>

<!DOCTYPE html>
<html>
<head>
    <title>Doctor Appointments - MediCare</title>

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
        }

        .container {
            padding: 40px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: #1976d2;
            color: white;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            color: #1976d2;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>MediCare - Appointments</h1>
</div>

<div class="container">

    <h2>All Appointments</h2>

    <table>

        <tr>
            <th>Appointment ID</th>
            <th>Patient ID</th>
            <th>Doctor ID</th>
            <th>Date</th>
            <th>Time</th>
            <th>Reason</th>
            <th>Status</th>
        </tr>

        <%
            List<Appointment> appointments =
                    (List<Appointment>) request.getAttribute("appointments");

            if (appointments != null && !appointments.isEmpty()) {

                for (Appointment appointment : appointments) {
        %>

        <tr>
            <td><%= appointment.getId() %></td>
            <td><%= appointment.getPatientId() %></td>
            <td><%= appointment.getDoctorId() %></td>
            <td><%= appointment.getAppointmentDate() %></td>
            <td><%= appointment.getAppointmentTime() %></td>
            <td><%= appointment.getReason() %></td>
            <td><%= appointment.getStatus() %></td>
        </tr>

        <%
                }

            } else {
        %>

        <tr>
            <td colspan="7">
                No appointments found.
            </td>
        </tr>

        <%
            }
        %>

    </table>

    <a class="back" href="dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

</body>
</html>