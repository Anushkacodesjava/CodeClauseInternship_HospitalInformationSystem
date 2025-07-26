<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Patient</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            padding: 40px;
            margin: 0;
        }
        .message-container {
            max-width: 500px;
            margin: auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .message {
            font-size: 18px;
            color: #333;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%
    String idStr = request.getParameter("id");
    String name = request.getParameter("name");
    String ageStr = request.getParameter("age");
    String gender = request.getParameter("gender");
    String diagnosis = request.getParameter("disease");

    if (idStr != null && name != null && ageStr != null && gender != null && diagnosis != null) {
        int id = Integer.parseInt(idStr);
        int age = Integer.parseInt(ageStr);

        String dbUrl = "jdbc:mysql://localhost:3306/hospital_db";
        String dbUser = "root";
        String dbPass = "@anushri2601";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE patients SET name=?, age=?, gender=?, disease=? WHERE id=?"
            );
            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, diagnosis);
            ps.setInt(5, id);

            int updated = ps.executeUpdate();

            if (updated > 0) {
%>
                <script>alert("Patient updated successfully."); window.location = "index.jsp";</script>
                <noscript>
                    <div class="message-container">
                        <p class="message success">Patient updated successfully. <a href="index.jsp">Return to Home</a></p>
                    </div>
                </noscript>
<%
            } else {
%>
                <script>alert("Update failed. Patient not found."); window.location = "edit.jsp";</script>
                <noscript>
                    <div class="message-container">
                        <p class="message error">Update failed. Patient not found. <a href="edit.jsp">Try Again</a></p>
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
                <a href="edit.jsp">Back</a>
            </div>
<%
        }
    } else {
%>
        <script>alert("Invalid input."); window.location = "edit.jsp";</script>
        <noscript>
            <div class="message-container">
                <p class="message error">Invalid input. <a href="edit.jsp">Go Back</a></p>
            </div>
        </noscript>
<%
    }
%>
</body>
</html>
