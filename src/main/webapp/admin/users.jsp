<%@ page import="java.util.List" %>
<%@ page import="com.healthcare.model.User" %>

<%
    List<User> users = (List<User>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Management - MediCare</title>

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
            width: 90%;
            margin: 30px auto;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #1976d2;
        }

        input, select {
            padding: 10px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 15px;
            background: #1976d2;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
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

        .delete {
            background: #d32f2f;
        }

        .back {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            color: #1976d2;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>MediCare - User Management</h1>
</div>

<div class="container">

    <a class="back" href="dashboard.jsp">
        ← Back to Dashboard
    </a>

    <!-- ADD USER -->

    <div class="card">

        <h2>Add New User</h2>

        <form action="${pageContext.request.contextPath}/admin/users"
              method="post">

            <input type="hidden" name="action" value="add">

            <input type="text"
                   name="name"
                   placeholder="Name"
                   required>

            <input type="email"
                   name="email"
                   placeholder="Email"
                   required>

            <input type="password"
                   name="password"
                   placeholder="Password"
                   required>

            <select name="role" required>
                <option value="">Select Role</option>
                <option value="ADMIN">Admin</option>
                <option value="DOCTOR">Doctor</option>
                <option value="PATIENT">Patient</option>
            </select>

            <button type="submit">
                Add User
            </button>

        </form>

    </div>


    <!-- USER LIST -->

    <div class="card">

        <h2>All Users</h2>

        <table>

            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Action</th>
            </tr>

            <%
                if (users != null) {

                    for (User user : users) {
            %>

            <tr>

                <td><%= user.getId() %></td>

                <td><%= user.getName() %></td>

                <td><%= user.getEmail() %></td>

                <td><%= user.getRole() %></td>

                <td>

                    <form action="${pageContext.request.contextPath}/admin/users"
                          method="post">

                        <input type="hidden"
                               name="action"
                               value="delete">

                        <input type="hidden"
                               name="id"
                               value="<%= user.getId() %>">

                        <button class="delete"
                                type="submit">
                            Delete
                        </button>

                    </form>

                </td>

            </tr>

            <%
                    }
                }
            %>

        </table>

    </div>

</div>

</body>
</html>