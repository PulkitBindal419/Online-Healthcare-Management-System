<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>System Settings - MediCare</title>

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

        .settings-card {
            background: white;
            max-width: 650px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .setting {
            margin-bottom: 20px;
        }

        .setting label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .setting input,
        .setting select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .save-btn {
            background: #1976d2;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 5px;
            cursor: pointer;
        }

        .save-btn:hover {
            background: #1565c0;
        }

        .success {
            color: green;
            margin-bottom: 15px;
        }

        .error {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>MediCare - System Settings</h1>

    <a class="back"
       href="${pageContext.request.contextPath}/admin/dashboard.jsp">
        Back to Dashboard
    </a>
</div>

<div class="container">

    <h2>System Settings</h2>

    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");
    %>

    <% if (success != null) { %>
        <div class="success"><%= success %></div>
    <% } %>

    <% if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } %>

    <div class="settings-card">

        <form action="${pageContext.request.contextPath}/admin/settings"
              method="post">

            <div class="setting">
                <label>Hospital Name</label>
                <input type="text"
                       name="hospitalName"
                       value="MediCare"
                       required>
            </div>

            <div class="setting">
                <label>Appointment Status</label>

                <select name="appointmentStatus" required>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>

            <div class="setting">
                <label>System Email</label>

                <input type="email"
                       name="systemEmail"
                       value="admin@medicare.com"
                       required>
            </div>

            <button type="submit" class="save-btn">
                Save Settings
            </button>

        </form>

    </div>

</div>

</body>
</html>