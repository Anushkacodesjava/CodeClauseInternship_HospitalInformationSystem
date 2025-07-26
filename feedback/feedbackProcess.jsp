<%@ page import="java.sql.*" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Feedback Submission</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #d3cce3, #e9e4f0);
            margin: 0;
            padding: 50px 0;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            color: #4b0082;
            margin-bottom: 20px;
        }
        .message {
            font-size: 17px;
            margin: 20px 0;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
        a {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 20px;
            color: #fff;
            background-color: #4b0082;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }
        a:hover {
            background-color: #3a006e;
        }
    </style>
</head>
<body>
<div class="container">
<%
    String patientId = request.getParameter("patient_id");
    String rating = request.getParameter("rating");
    String comments = request.getParameter("comments");

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

        String sql = "INSERT INTO feedback (patient_id, rating, comments) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(patientId));
        pstmt.setString(2, rating);
        pstmt.setString(3, comments);

        int rows = pstmt.executeUpdate();
        if (rows > 0) {
%>
            <h2>Thank You!</h2>
            <div class="message success">Your feedback has been submitted successfully.</div>
<%
        } else {
%>
            <h2>Oops!</h2>
            <div class="message error">Failed to submit feedback. Please try again.</div>
<%
        }
    } catch (Exception e) {
%>
        <h2>Error</h2>
        <div class="message error"><%= e.getMessage() %></div>
<%
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
<a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>
    
</div>
</body>
</html>
