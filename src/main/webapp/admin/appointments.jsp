<%@ page import="java.util.List" %>
<%@ page import="com.healthcare.model.Appointment" %>

<%
    List<Appointment> appointments =
            (List<Appointment>) request.getAttribute("appointments");
%>

<!DOCTYPE html>
<html>
<head>

    <title>Appointment Management - MediCare</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f2f7fb;
            margin: 0;
        }

        .header {
            background: #1976d2;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 95%;
            margin: 30px auto;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .back {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            color: #1976d2;
            font-weight: bold;
        }

        h2 {
            color: #1976d2;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: #e3f2fd;
        }

        select {
            padding: 7px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 7px 12px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

        .update {
            background: #1976d2;
        }

        .delete {
            background: #d32f2f;
        }

        .no-data {
            text-align: center;
            padding: 30px;
            color: #777;
        }

    </style>

</head>

<body>

<div class="header">

    <h1>MediCare - Appointment Management</h1>

</div>


<div class="container">

    <a class="back"
       href="${pageContext.request.contextPath}/admin/dashboard.jsp">

        ← Back to Dashboard

    </a>


    <div class="card">

        <h2>All Appointments</h2>


        <table>

            <tr>

                <th>ID</th>
                <th>Patient ID</th>
                <th>Doctor ID</th>
                <th>Date</th>
                <th>Time</th>
                <th>Reason</th>
                <th>Status</th>
                <th>Actions</th>

            </tr>


            <%
                if (appointments != null && !appointments.isEmpty()) {

                    for (Appointment appointment : appointments) {
            %>

            <tr>

                <td>
                    <%= appointment.getId() %>
                </td>

                <td>
                    <%= appointment.getPatientId() %>
                </td>

                <td>
                    <%= appointment.getDoctorId() %>
                </td>

                <td>
                    <%= appointment.getAppointmentDate() %>
                </td>

                <td>
                    <%= appointment.getAppointmentTime() %>
                </td>

                <td>
                    <%= appointment.getReason() %>
                </td>

                <td>

                    <%= appointment.getStatus() %>

                </td>

                <td>

                    <!-- UPDATE STATUS -->

                    <form
                            action="${pageContext.request.contextPath}/admin/appointments"
                            method="post"
                            style="display:inline;">

                        <input type="hidden"
                               name="action"
                               value="updateStatus">

                        <input type="hidden"
                               name="id"
                               value="<%= appointment.getId() %>">


                        <select name="status">

                            <option value="PENDING">
                                PENDING
                            </option>

                            <option value="CONFIRMED">
                                CONFIRMED
                            </option>

                            <option value="COMPLETED">
                                COMPLETED
                            </option>

                            <option value="CANCELLED">
                                CANCELLED
                            </option>

                        </select>


                        <button class="update"
                                type="submit">

                            Update

                        </button>

                    </form>


                    <!-- DELETE -->

                    <form
                            action="${pageContext.request.contextPath}/admin/appointments"
                            method="post"
                            style="display:inline;">

                        <input type="hidden"
                               name="action"
                               value="delete">

                        <input type="hidden"
                               name="id"
                               value="<%= appointment.getId() %>">


                        <button class="delete"
                                type="submit">

                            Delete

                        </button>

                    </form>

                </td>

            </tr>

            <%
                    }

                } else {
            %>

            <tr>

                <td colspan="8" class="no-data">

                    No appointments found.

                </td>

            </tr>

            <%
                }
            %>

        </table>

    </div>

</div>

</body>

</html>