<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medical History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f6f9fc;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .message {
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
    <h2>Medical History</h2>

<%
    String patientIdStr = request.getParameter("patient_id");
    int patientId = Integer.parseInt(patientIdStr);

    String url = "jdbc:mysql://localhost:3306/hospital_db";
    String username = "root";
    String password = "@anushri2601";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM medical_history WHERE patient_id = ?");
        ps.setInt(1, patientId);
        ResultSet rs = ps.executeQuery();

        boolean recordsFound = false;
%>
        <table>
            <tr>
                <th>ID</th>
                <th>Diagnosis</th>
                <th>Treatment</th>
                <th>Record Date</th>
            </tr>
<%
        while (rs.next()) {
            recordsFound = true;
%>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("diagnosis") %></td>
                <td><%= rs.getString("treatment") %></td>
                <td><%= rs.getDate("record_date") %></td>
            </tr>
<%
        }

        if (!recordsFound) {
%>
            <tr><td colspan="4" class="message">No records found for Patient ID: <%= patientId %></td></tr>
<%
        }

        rs.close();
        ps.close();
        conn.close();

    } catch(Exception e) {
%>
        <p class="message">Error: <%= e.getMessage() %></p>
<%
    }
%>
    </table>
</body>
</html>
