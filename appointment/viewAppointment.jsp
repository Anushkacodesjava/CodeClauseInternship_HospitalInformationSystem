<%@ page import="java.sql.*" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f7;
            padding: 50px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #007bff;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>View Appointment</h2>
    <form action="viewAppointmentProcess.jsp" method="get">
        <label for="patient_id">Select Patient ID:</label>
        <select name="patient_id" id="patient_id" required>
            <option value="" disabled selected>-- Select Patient ID --</option>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT id FROM patients");

                    while(rs.next()) {
                        String pid = rs.getString("id");
            %>
                        <option value="<%= pid %>"><%= pid %></option>
            <%
                    }
                    conn.close();
                } catch(Exception e) {
                    out.println("<option disabled>Error fetching patient IDs: " + e.getMessage() + "</option>");
                }
            %>
        </select>
        <input type="submit" value="View Appointment">
    </form>
</div>
</body>
</html>
