<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Pathology Tests</title>
    <style>
        body { font-family: Arial; background: #eef2f3; padding: 30px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
        tr:nth-child(even) { background-color: #f9f9f9; }
    </style>
</head>
<body>
    <h2>Pathology Test Records</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Patient ID</th>
            <th>Test Name</th>
            <th>Test Date</th>
            <th>Status</th>
            <th>Remarks</th>
        </tr>
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM pathology_tests");
                while(rs.next()){
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("patient_id") %></td>
            <td><%= rs.getString("test_name") %></td>
            <td><%= rs.getDate("test_date") %></td>
            <td><%= rs.getString("status") %></td>
            <td><%= rs.getString("remarks") %></td>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.println("Error: " + e);
            } finally {
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(con != null) con.close();
            }
        %>
    </table>
</body>
</html>
