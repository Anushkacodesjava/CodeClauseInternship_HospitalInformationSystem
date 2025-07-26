<%@ page import="java.sql.*" %> 
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Pathology Test</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7f8;
            padding: 30px;
            text-align: center;
        }

        .container {
            background: white;
            padding: 30px;
            margin: auto;
            max-width: 500px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        p {
            font-size: 18px;
            color: #333;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background: #0066cc;
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            transition: background 0.3s ease;
        }

        a:hover {
            background: #004999;
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
<div class="container">
<%
    String patientId = request.getParameter("patient_id");
    String testName = request.getParameter("test_name");
    String testDate = request.getParameter("test_date");
    String status = request.getParameter("status");
    String remarks = request.getParameter("remarks");

    Connection con = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
        
        String query = "INSERT INTO pathology_tests (patient_id, test_name, test_date, status, remarks) VALUES (?, ?, ?, ?, ?)";
        pst = con.prepareStatement(query);
        pst.setInt(1, Integer.parseInt(patientId));
        pst.setString(2, testName);
        pst.setDate(3, Date.valueOf(testDate));
        pst.setString(4, status);
        pst.setString(5, remarks);
        
        int rowsInserted = pst.executeUpdate();

        if (rowsInserted > 0) {
%>
            <p class="success">✅ Test added successfully.</p>
<%
        } else {
%>
            <p class="error">❌ Failed to add test.</p>
<%
        }

    } catch (Exception e) {
%>
        <p class="error">⚠️ Error: <%= e.getMessage() %></p>
<%
    } finally {
        if (pst != null) pst.close();
        if (con != null) con.close();
    }
%>
    <a href="viewTests.jsp">🔙 Back to Tests</a>
</div>
</body>
</html>
