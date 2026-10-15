<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.healthcare.model.Doctor" %>

<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment - MediCare</title>

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
            width: 500px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        h2 {
            color: #1976d2;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input,
        select,
        textarea {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #1976d2;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .back {
            display: block;
            margin-top: 15px;
            text-align: center;
            text-decoration: none;
            color: #1976d2;
        }

        .success {
            color: green;
            text-align: center;
            margin-bottom: 15px;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>MediCare</h1>
</div>

<div class="container">

    <h2>Book Appointment</h2>

    <% if (request.getParameter("success") != null) { %>
        <div class="success">
            <%= request.getParameter("success") %>
        </div>
    <% } %>

    <% if (request.getParameter("error") != null) { %>
        <div class="error">
            <%= request.getParameter("error") %>
        </div>
    <% } %>

    <form action="${pageContext.request.contextPath}/patient/book-appointment"
          method="post">

        <label>Select Doctor</label>

        <select name="doctorId" required>

            <option value="">-- Select Doctor --</option>

            <%
                List<Doctor> doctors =
                        (List<Doctor>) request.getAttribute("doctors");

                if (doctors != null) {
                    for (Doctor doctor : doctors) {
            %>

                <option value="<%= doctor.getId() %>">
                    Doctor ID <%= doctor.getId() %>
                    - <%= doctor.getSpecialization() %>
                </option>

            <%
                    }
                }
            %>

        </select>

        <label>Appointment Date</label>

        <input type="date"
               name="appointmentDate"
               required>

        <label>Appointment Time</label>

        <input type="time"
               name="appointmentTime"
               required>

        <label>Reason</label>

        <textarea name="reason"
                  rows="4"
                  placeholder="Enter reason for appointment"
                  required></textarea>

        <button type="submit">
            Book Appointment
        </button>

    </form>

    <a class="back"
       href="${pageContext.request.contextPath}/patient/dashboard.jsp">
        ← Back to Dashboard
    </a>

</div>

</body>
</html>