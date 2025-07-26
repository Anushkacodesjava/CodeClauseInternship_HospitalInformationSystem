<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert Medical History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            text-align: center;
            padding: 40px;
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
    int patient_id = Integer.parseInt(request.getParameter("patient_id"));
    String diagnosis = request.getParameter("diagnosis");
    String treatment = request.getParameter("treatment");
    String record_date = request.getParameter("record_date");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO medical_history (patient_id, diagnosis, treatment, record_date) VALUES (?, ?, ?, ?)");
        ps.setInt(1, patient_id);
        ps.setString(2, diagnosis);
        ps.setString(3, treatment);
        ps.setString(4, record_date);

        int i = ps.executeUpdate();
        if(i > 0){
            out.println("<h2>✅ Medical History Added Successfully!</h2>");
        } else {
            out.println("<h2>❌ Failed to Add Medical History.</h2>");
        }

        conn.close();
    } catch (Exception e) {
        out.println("<h2>⚠️ Error: " + e.getMessage() + "</h2>");
    }
%>
    <a href="addMedicalHistory.jsp">➕ Add Another</a>
    <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>

</div>
</body>
</html>
