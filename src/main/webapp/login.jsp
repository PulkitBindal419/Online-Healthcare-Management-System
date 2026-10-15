<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>MediCare - Login</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f7fb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background: white;
            width: 350px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        h1 {
            text-align: center;
            color: #1976d2;
            margin-bottom: 5px;
        }

        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 12px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 11px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            background: #1976d2;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #125ca1;
        }

        .error {
            color: #d32f2f;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<div class="login-box">

    <h1>MediCare</h1>

    <div class="subtitle">
        Online Healthcare Management System
    </div>

    <form action="login" method="post">

        <label>Email</label>
        <input type="email"
               name="email"
               placeholder="Enter your email"
               required>

        <label>Password</label>
        <input type="password"
               name="password"
               placeholder="Enter your password"
               required>

        <button type="submit">Login</button>

    </form>

    <% if (request.getParameter("error") != null) { %>
        <div class="error">
            <%= request.getParameter("error") %>
        </div>
    <% } %>

</div>

</body>
</html>