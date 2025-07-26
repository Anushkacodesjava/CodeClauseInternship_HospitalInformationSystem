<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Medical Record - Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .status-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
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
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="status-box">
        <h2>Update Status</h2>
        <%
            String id = request.getParameter("id");
            String diagnosis = request.getParameter("diagnosis");
            String treatment = request.getParameter("treatment");
            String date = request.getParameter("date");

            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                String sql = "UPDATE medical_history SET diagnosis=?, treatment=?, record_date=? WHERE id=?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, diagnosis);
                stmt.setString(2, treatment);
                stmt.setString(3, date);
                stmt.setInt(4, Integer.parseInt(id));

                int rows = stmt.executeUpdate();
                if (rows > 0) {
        %>
                    <p class="success">Record updated successfully.</p>
        <%
                } else {
        %>
                    <p class="error">Record not found.</p>
        <%
                }
            } catch (Exception e) {
        %>
                <p class="error">Error: <%= e.getMessage() %></p>
        <%
            } finally {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
        <a href="editMedicalHistory.jsp">Go Back</a>
    </div>
</body>
</html>
