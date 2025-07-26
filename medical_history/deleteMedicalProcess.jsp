<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            text-align: center;
            padding-top: 80px;
        }
        .message {
            background: white;
            padding: 30px;
            margin: auto;
            width: 500px;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="message">
<%
    String idParam = request.getParameter("id");
    try {
        if(idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
            PreparedStatement ps = conn.prepareStatement("DELETE FROM medical_history WHERE id = ?");
            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<h2>✅ Medical History Record Deleted Successfully!</h2>");
            } else {
                out.println("<h2>⚠️ No record found with the given ID.</h2>");
            }

            conn.close();
        } else {
            out.println("<h2>❌ Invalid ID provided.</h2>");
        }
    } catch (Exception e) {
        out.println("<h2>❌ Error: " + e.getMessage() + "</h2>");
    }
%>
    <a href="deleteMedicalHistory.jsp">🗑️ Delete Another</a>
    <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>

</div>
</body>
</html>
