<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Patient</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            padding: 50px;
            text-align: center;
        }
        .message-container {
            background-color: #ffffff;
            padding: 30px;
            margin: auto;
            max-width: 400px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .message {
            font-size: 18px;
            color: #333;
        }
        .error {
            color: red;
        }
        .success {
            color: green;
        }
    </style>
</head>
<body>
<%
    String idStr = request.getParameter("id");

    if (idStr != null && !idStr.isEmpty()) {
        int id = Integer.parseInt(idStr);

        // DB Connection details
        String dbUrl = "jdbc:mysql://localhost:3306/hospital_db";
        String dbUser = "root";
        String dbPass = "@anushri2601"; 

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            PreparedStatement ps = conn.prepareStatement("DELETE FROM patients WHERE id = ?");
            ps.setInt(1, id);

            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
%>
                <script>alert("Patient deleted successfully."); window.location = "index.jsp";</script>
                <noscript>
                    <div class="message-container">
                        <p class="message success">Patient deleted successfully. <a href="index.jsp">Go to Home</a></p>
                    </div>
                </noscript>
<%
            } else {
%>
                <script>alert("Patient ID not found."); window.location = "delete.jsp";</script>
                <noscript>
                    <div class="message-container">
                        <p class="message error">Patient ID not found. <a href="delete.jsp">Try Again</a></p>
                    </div>
                </noscript>
<%
            }

            ps.close();
            conn.close();
        } catch (Exception e) {
%>
            <div class="message-container">
                <p class="message error">Error: <%= e.getMessage() %></p>
                <a href="delete.jsp">Back</a>
            </div>
<%
        }
    } else {
%>
        <script>alert("Invalid ID."); window.location = "delete.jsp";</script>
        <noscript>
            <div class="message-container">
                <p class="message error">Invalid ID. <a href="delete.jsp">Try Again</a></p>
            </div>
        </noscript>
<%
    }
%>
</body>
</html>
