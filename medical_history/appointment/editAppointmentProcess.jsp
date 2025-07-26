<%@ page import="java.sql.*" %> 
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String date = request.getParameter("appointment_date");
    String doctor = request.getParameter("doctor_name");
    boolean updated = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

        PreparedStatement ps = conn.prepareStatement(
            "UPDATE appointments SET appointment_date = ?, doctor_name = ? WHERE id = ?");
        ps.setDate(1, java.sql.Date.valueOf(date));
        ps.setString(2, doctor);
        ps.setInt(3, id);

        int result = ps.executeUpdate();
        if (result > 0) updated = true;

        conn.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            padding: 20px;
            text-align: center;
        }
        .msg {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
        a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
    <div class="msg <%= updated ? "success" : "error" %>">
        <%= updated ? "Appointment updated successfully!" : "Failed to update appointment." %>
    </div>
    <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>
</body>
</html>
