<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.healthcare.model.DoctorSchedule" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Schedule - MediCare</title>

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
            background: #455a64;
            padding: 10px 18px;
            border-radius: 5px;
        }

        .container {
            padding: 40px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .card h2 {
            color: #1976d2;
            margin-top: 0;
        }

        .form-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .form-group label {
            margin-bottom: 6px;
            font-weight: bold;
        }

        select,
        input {
            padding: 10px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background: #1976d2;
            color: white;
            border: none;
            padding: 11px 22px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn:hover {
            background: #125ca1;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #1976d2;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f5f5f5;
        }

        .delete-btn {
            background: #d32f2f;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        .available {
            color: green;
            font-weight: bold;
        }

        .empty {
            text-align: center;
            padding: 20px;
            color: #777;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>MediCare - Manage Schedule</h1>

    <a class="back"
       href="${pageContext.request.contextPath}/doctor/dashboard.jsp">
        Back to Dashboard
    </a>
</div>

<div class="container">

    <!-- Add Schedule -->
    <div class="card">

        <h2>Add Doctor Schedule</h2>

        <form action="${pageContext.request.contextPath}/doctor/schedule"
              method="post">

            <div class="form-row">

                <div class="form-group">
                    <label>Day of Week</label>

                    <select name="dayOfWeek" required>
                        <option value="">Select Day</option>
                        <option value="Monday">Monday</option>
                        <option value="Tuesday">Tuesday</option>
                        <option value="Wednesday">Wednesday</option>
                        <option value="Thursday">Thursday</option>
                        <option value="Friday">Friday</option>
                        <option value="Saturday">Saturday</option>
                        <option value="Sunday">Sunday</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Start Time</label>

                    <input type="time"
                           name="startTime"
                           required>
                </div>

                <div class="form-group">
                    <label>End Time</label>

                    <input type="time"
                           name="endTime"
                           required>
                </div>

            </div>

            <button type="submit" class="btn">
                Add Schedule
            </button>

        </form>

    </div>


    <!-- Existing Schedules -->
    <div class="card">

        <h2>My Schedule</h2>

        <%
            List<DoctorSchedule> schedules =
                    (List<DoctorSchedule>) request.getAttribute("schedules");
        %>

        <% if (schedules != null && !schedules.isEmpty()) { %>

            <table>

                <tr>
                    <th>ID</th>
                    <th>Day</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>

                <% for (DoctorSchedule schedule : schedules) { %>

                    <tr>

                        <td>
                            <%= schedule.getId() %>
                        </td>

                        <td>
                            <%= schedule.getDayOfWeek() %>
                        </td>

                        <td>
                            <%= schedule.getStartTime() %>
                        </td>

                        <td>
                            <%= schedule.getEndTime() %>
                        </td>

                        <td class="available">
                            <%= schedule.getStatus() %>
                        </td>

                        <td>

                            <form action="${pageContext.request.contextPath}/doctor/schedule"
                                  method="post">

                                <input type="hidden"
                                       name="action"
                                       value="delete">

                                <input type="hidden"
                                       name="id"
                                       value="<%= schedule.getId() %>">

                                <button type="submit"
                                        class="delete-btn">
                                    Delete
                                </button>

                            </form>

                        </td>

                    </tr>

                <% } %>

            </table>

        <% } else { %>

            <div class="empty">
                No schedules found.
            </div>

        <% } %>

    </div>

</div>

</body>
</html>