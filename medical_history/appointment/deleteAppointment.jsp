<%@ page import="java.sql.*, java.util.*" %> 
<!DOCTYPE html> 
<html>
<head>
    <title>Delete Appointment</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #ffe5e5, #fff6f6);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        h2 {
            margin-bottom: 20px;
            color: #d9534f;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #444;
        }

        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        input[type="submit"] {
            margin-top: 25px;
            background-color: #dc3545;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #b02a37;
        }
    </style>
</head>
<body>
    <form action="deleteAppointmentProcess.jsp" method="post">
        <h2>Delete Appointment</h2>

        <!-- Appointment ID dropdown -->
        <label for="id">Select Appointment ID:</label>
        <select name="id" id="id" required>
            <option value="" disabled selected>Choose appointment ID</option>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT id FROM appointments");

                    while(rs.next()) {
                        String aid = rs.getString("id");
            %>
                        <option value="<%= aid %>"><%= aid %></option>
            <%
                    }
                    rs.close();
                    stmt.close();
            %>
        </select>

        <!-- Patient ID dropdown -->
        <label for="patient_id">Select Patient ID:</label>
        <select name="patient_id" id="patient_id" required>
            <option value="" disabled selected>Choose patient ID</option>
            <%
                    Statement stmt2 = con.createStatement();
                    ResultSet rs2 = stmt2.executeQuery("SELECT id FROM patients");

                    while(rs2.next()) {
                        String pid = rs2.getString("id");
            %>
                        <option value="<%= pid %>"><%= pid %></option>
            <%
                    }
                    rs2.close();
                    stmt2.close();
                    con.close();
                } catch(Exception e) {
                    out.println("<option disabled>Error loading data</option>");
                }
            %>
        </select>

        <input type="submit" value="Delete Appointment">
    </form>
</body>
</html>
