<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String gender = request.getParameter("gender");
    String disease = request.getParameter("disease");

    Connection conn = null;
    boolean success = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

        PreparedStatement ps = conn.prepareStatement(
            "INSERT INTO patients (name, age, gender, disease) VALUES (?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setInt(2, age);
        ps.setString(3, gender);
        ps.setString(4, disease);

        int result = ps.executeUpdate();
        if (result > 0) {
            success = true;
        }
    } catch (Exception e) {
%>
        <div class="container error">
            <h2>Error Occurred</h2>
            <p><%= e.getMessage() %></p>
            <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>

        </div>
<%
    } finally {
        if (conn != null) conn.close();
    }
%>

<% if (success) { %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Added</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f9f5;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 100px auto;
            padding: 30px;
            background-color: #e8fff2;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            text-align: center;
        }
        h2 {
            color: #2e7d32;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #4CAF50;
            color: white;
            padding: 10px 25px;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Patient Added Successfully!</h2>
        <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>
    </div>
</body>
</html>
<% } %>
