<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.healthcare.model.MedicalRecord" %>

<!DOCTYPE html>
<html>
<head>
    <title>Medical Records - MediCare</title>

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

        .logout {
            color: white;
            text-decoration: none;
            background: #d32f2f;
            padding: 10px 18px;
            border-radius: 5px;
        }

        .container {
            width: 90%;
            margin: 40px auto;
        }

        .back {
            display: inline-block;
            margin-bottom: 20px;
            color: #1976d2;
            text-decoration: none;
            font-weight: bold;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        h2 {
            color: #1976d2;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input,
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
        }

        button {
            margin-top: 20px;
            padding: 12px 20px;
            background: #1976d2;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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

        .empty {
            padding: 20px;
            background: #f5f5f5;
            border-radius: 5px;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>MediCare - Medical Records</h1>
    <a class="logout" href="../logout">Logout</a>
</div>

<div class="container">

   <a class="back" href="${pageContext.request.contextPath}/doctor/dashboard.jsp">
       ← Back to Dashboard
   </a>

    <!-- ADD MEDICAL RECORD -->
    <div class="card">

        <h2>Add Medical Record</h2>

        <form action="../medical-records" method="post">

            <label>Patient ID</label>
            <input type="number" name="patientId" required>

            <label>Doctor ID</label>
            <input type="number" name="doctorId" required>

            <label>Diagnosis</label>
            <textarea name="diagnosis" required></textarea>

            <label>Prescription</label>
            <textarea name="prescription" required></textarea>

            <label>Notes</label>
            <textarea name="notes"></textarea>

            <label>Record Date</label>
            <input type="date" name="recordDate" required>

            <button type="submit">
                Save Medical Record
            </button>

        </form>

    </div>

    <!-- EXISTING MEDICAL RECORDS -->
    <div class="card">

        <h2>Existing Medical Records</h2>

        <%
            List<MedicalRecord> records =
                    (List<MedicalRecord>) request.getAttribute("records");

            if (records != null && !records.isEmpty()) {
        %>

        <table>
            <tr>
                <th>Record ID</th>
                <th>Patient ID</th>
                <th>Doctor ID</th>
                <th>Diagnosis</th>
                <th>Prescription</th>
                <th>Notes</th>
                <th>Record Date</th>
            </tr>

            <%
                for (MedicalRecord record : records) {
            %>

            <tr>
                <td><%= record.getId() %></td>
                <td><%= record.getPatientId() %></td>
                <td><%= record.getDoctorId() %></td>
                <td><%= record.getDiagnosis() %></td>
                <td><%= record.getPrescription() %></td>
                <td><%= record.getNotes() %></td>
                <td><%= record.getRecordDate() %></td>
            </tr>

            <%
                }
            %>

        </table>

        <%
            } else {
        %>

        <div class="empty">
            No medical records found.
        </div>

        <%
            }
        %>

    </div>

</div>

</body>
</html>