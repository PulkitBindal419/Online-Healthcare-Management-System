<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.healthcare.model.MedicalRecord" %>

<!DOCTYPE html>
<html>
<head>
    <title>Medical History - MediCare</title>

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
    <h1>MediCare - Medical History</h1>

    <a class="back"
       href="${pageContext.request.contextPath}/patient/dashboard.jsp">
        Back to Dashboard
    </a>
</div>

<div class="container">

    <h2>My Medical History</h2>

    <%
        List<MedicalRecord> records =
                (List<MedicalRecord>) request.getAttribute("records");
    %>

    <% if (records != null && !records.isEmpty()) { %>

        <table>
            <tr>
                <th>ID</th>
                <th>Doctor ID</th>
                <th>Diagnosis</th>
                <th>Prescription</th>
                <th>Notes</th>
                <th>Record Date</th>
            </tr>

            <% for (MedicalRecord record : records) { %>

                <tr>
                    <td><%= record.getId() %></td>
                    <td><%= record.getDoctorId() %></td>
                    <td><%= record.getDiagnosis() %></td>
                    <td><%= record.getPrescription() %></td>
                    <td><%= record.getNotes() %></td>
                    <td><%= record.getRecordDate() %></td>
                </tr>

            <% } %>

        </table>

    <% } else { %>

        <div class="empty">
            <h3>No medical records found.</h3>
            <p>Your medical history will appear here when a doctor adds a record.</p>
        </div>

    <% } %>

</div>

</body>
</html>