<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Appointment Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 40px;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }
    </style>
</head>
<body>

<%
    String pid = request.getParameter("patient_id");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
        ps = conn.prepareStatement("SELECT * FROM appointments WHERE patient_id = ?");
        ps.setString(1, pid);
        rs = ps.executeQuery();
%>
    <h2>Appointment Details for Patient ID: <%= pid %></h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Appointment Date</th>
            <th>Doctor Name</th>
        </tr>
        <%
            boolean found = false;
            while(rs.next()) {
                found = true;
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getDate("appointment_date") %></td>
            <td><%= rs.getString("doctor_name") %></td>
        </tr>
        <% }
           if (!found) {
        %>
        <tr>
            <td colspan="3">No appointments found.</td>
        </tr>
        <% } %>
    </table>
<%
    } catch(Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(ps != null) ps.close(); } catch(Exception e) {}
        try { if(conn != null) conn.close(); } catch(Exception e) {}
    }
%>

</body>
</html>
