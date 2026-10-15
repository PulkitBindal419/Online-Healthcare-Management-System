<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.healthcare.model.User" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Profile - MediCare</title>

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

        .profile-card {
            background: white;
            max-width: 600px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .profile-row {
            padding: 15px 0;
            border-bottom: 1px solid #ddd;
        }

        .label {
            font-weight: bold;
            color: #555;
        }

        .value {
            margin-top: 5px;
            color: #222;
        }
    </style>
</head>

<body>

<%
    User user = (User) session.getAttribute("user");
%>

<div class="header">
    <h1>MediCare - My Profile</h1>

    <a class="back"
       href="${pageContext.request.contextPath}/patient/dashboard.jsp">
        Back to Dashboard
    </a>
</div>

<div class="container">

    <h2>Patient Profile</h2>

    <div class="profile-card">

        <% if (user != null) { %>

            <div class="profile-row">
                <div class="label">Name</div>
                <div class="value"><%= user.getName() %></div>
            </div>

            <div class="profile-row">
                <div class="label">Email</div>
                <div class="value"><%= user.getEmail() %></div>
            </div>

            <div class="profile-row">
                <div class="label">Role</div>
                <div class="value"><%= user.getRole() %></div>
            </div>

        <% } else { %>

            <p>Session expired. Please login again.</p>

        <% } %>

    </div>

</div>

</body>
</html>