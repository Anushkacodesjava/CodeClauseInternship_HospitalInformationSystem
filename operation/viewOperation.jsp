<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Scheduled Operations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f9f9f9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
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
        }
    </style>
</head>
<body>
<h2>Scheduled Operations</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Patient ID</th>
        <th>Operation Type</th>
        <th>Date</th>
        <th>Time</th>
        <th>Status</th>
        <th>Notes</th>
    </tr>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM operation_theater");
        while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getInt("patient_id") %></td>
        <td><%= rs.getString("operation_type") %></td>
        <td><%= rs.getDate("operation_date") %></td>
        <td><%= rs.getTime("start_time") %> - <%= rs.getTime("end_time") %></td>
        <td><%= rs.getString("status") %></td>
        <td><%= rs.getString("notes") %></td>
    </tr>
<%
        }
        con.close();
    } catch(Exception e){
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
</table>
</body>
</html>
