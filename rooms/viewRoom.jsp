<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Room Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            padding: 30px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 95%;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .action-links a {
            margin: 0 5px;
            text-decoration: none;
            padding: 6px 10px;
            color: white;
            border-radius: 4px;
        }
        .edit-btn {
            background-color: #2196F3;
        }
        .delete-btn {
            background-color: #f44336;
        }
        .back-link {
            display: block;
            margin: 20px auto;
            text-align: center;
            color: #4CAF50;
            text-decoration: none;
        }
    </style>
</head>
<body>

<h2>Room Details</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Patient ID</th>
        <th>Room Number</th>
        <th>Room Type</th>
        <th>Admission Date</th>
        <th>Discharge Date</th>
        <th>Actions</th>
        
    </tr>

<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM rooms");

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getInt("patient_id") %></td>
        <td><%= rs.getString("room_number") %></td>
        <td><%= rs.getString("room_type") %></td>
        <td><%= rs.getDate("admission_date") %></td>
        <td><%= rs.getDate("discharge_date") %></td>
        <td class="action-links">
            <a class="edit-btn" href="editRoom.jsp?id=<%= rs.getInt("id") %>">Edit</a>
            <a class="delete-btn" href="deleteRoom.jsp?id=<%= rs.getInt("id") %>" 
               onclick="return confirm('Are you sure you want to delete this room?');">
               Delete
            </a>
        </td>
    </tr>
<%
        }
    } catch (Exception e) {
        out.println("<tr><td colspan='7' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
</table>



</body>
</html>
