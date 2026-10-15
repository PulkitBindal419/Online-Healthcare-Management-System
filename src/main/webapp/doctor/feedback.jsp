<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.healthcare.model.Feedback" %>

<!DOCTYPE html>
<html>
<head>
    <title>Patient Feedback - MediCare</title>

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
        }

        .card h2 {
            color: #1976d2;
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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

        .rating {
            font-weight: bold;
            color: #f57c00;
        }

        .delete-btn {
            background: #d32f2f;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 4px;
            cursor: pointer;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #777;
        }
    </style>
</head>

<body>

<div class="header">

    <h1>MediCare - Patient Feedback</h1>

    <a class="back"
       href="${pageContext.request.contextPath}/doctor/dashboard.jsp">
        Back to Dashboard
    </a>

</div>

<div class="container">

    <div class="card">

        <h2>Patient Feedback</h2>

        <%
            List<Feedback> feedbackList =
                    (List<Feedback>) request.getAttribute("feedbackList");
        %>

        <% if (feedbackList != null && !feedbackList.isEmpty()) { %>

            <table>

                <tr>
                    <th>ID</th>
                    <th>Patient ID</th>
                    <th>Rating</th>
                    <th>Comments</th>
                    <th>Action</th>
                </tr>

                <% for (Feedback feedback : feedbackList) { %>

                    <tr>

                        <td>
                            <%= feedback.getId() %>
                        </td>

                        <td>
                            <%= feedback.getPatientId() %>
                        </td>

                        <td class="rating">
                            <%= feedback.getRating() %> / 5
                        </td>

                        <td>
                            <%= feedback.getComments() %>
                        </td>

                        <td>

                            <form
                                action="${pageContext.request.contextPath}/doctor/feedback"
                                method="post">

                                <input type="hidden"
                                       name="action"
                                       value="delete">

                                <input type="hidden"
                                       name="id"
                                       value="<%= feedback.getId() %>">

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
                No patient feedback found.
            </div>

        <% } %>

    </div>

</div>

</body>
</html>