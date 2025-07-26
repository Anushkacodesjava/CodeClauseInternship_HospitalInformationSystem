<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String message = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
        PreparedStatement ps = conn.prepareStatement("DELETE FROM rooms WHERE id=?");
        ps.setString(1, id);
        int result = ps.executeUpdate();
        if (result > 0) {
            message = "Room deleted successfully.";
        } else {
            message = "Room not found or could not be deleted.";
        }
        conn.close();
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Room Result</title>
    <style>
        body {
            background-color: #f2f7fb;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .box {
            background-color: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .box h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .success {
            color: green;
            font-weight: bold;
        }
        .error {
            color: red;
            font-weight: bold;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 16px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Delete Room</h2>
        <p class="<%= message.contains("success") ? "success" : "error" %>"><%= message %></p>
        <a href="deleteRoom.jsp">Delete Another Room</a>
    </div>
</body>
</html>
