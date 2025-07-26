<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM patients");
%>
<html>
<head>
    <title>Patient List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f4f8;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .top-bar {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .top-bar a {
            text-decoration: none;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
        }
        .top-bar a:hover {
            background-color: #218838;
        }
        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        a.action {
            text-decoration: none;
            padding: 6px 12px;
            color: white;
            border-radius: 4px;
            font-size: 14px;
            margin: 0 2px;
        }
        .edit-btn {
            background-color: #ffc107;
        }
        .edit-btn:hover {
            background-color: #e0a800;
        }
        .delete-btn {
            background-color: #dc3545;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <h2>All Patient Records</h2>

    <div class="top-bar">
        <a href="add.jsp">➕ Add New Patient</a>
    </div>

    <table>
        <tr>
            <th>ID</th><th>Name</th><th>Age</th><th>Gender</th><th>Diagnosis</th><th>Actions</th>
        </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getInt("age") %></td>
            <td><%= rs.getString("gender") %></td>
            <td><%= rs.getString("disease") %></td>
            <td>
                <a class="action edit-btn" href="edit.jsp?id=<%=rs.getInt("id")%>">Edit</a>
                <a class="action delete-btn" href="delete.jsp?id=<%=rs.getInt("id")%>">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>

</body>
</html>
<%
    } catch(Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
