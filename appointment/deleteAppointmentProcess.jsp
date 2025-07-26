<%@ page import="java.sql.*" %>  
<%
    int id = Integer.parseInt(request.getParameter("id"));
    boolean deleted = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

        PreparedStatement ps = conn.prepareStatement("DELETE FROM appointments WHERE id=?");
        ps.setInt(1, id);

        int rows = ps.executeUpdate();
        if (rows > 0) deleted = true;

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Appointment</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 90%;
            max-width: 500px;
        }

        .message {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .success {
            color: #28a745;
        }

        .fail {
            color: #dc3545;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message <%= deleted ? "success" : "fail" %>">
            <%= deleted ? "Appointment deleted successfully!" : "Failed to delete appointment." %>
        </div>
        <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>
    </div>
</body>
</html>
