<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Appointment</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #d9e4f5, #f1f4fa);
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
            width: 420px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #444;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        input[type="submit"] {
            margin-top: 25px;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form action="editAppointmentProcess.jsp" method="post">
        <h2>Edit Appointment</h2>

        <label for="id">Appointment ID:</label>
        <select name="id" id="id" required>
            <option value="">Select Appointment ID</option>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT id FROM appointments");
                    while (rs.next()) {
                        int id = rs.getInt("id");
            %>
                        <option value="<%= id %>"><%= id %></option>
            <%
                    }
                } catch (Exception e) {
                    out.println("<option disabled>Error loading IDs</option>");
                    e.printStackTrace();
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                    try { if (conn != null) conn.close(); } catch (Exception e) {}
                }
            %>
        </select>

        <label for="appointment_date">New Date:</label>
        <input type="date" name="appointment_date" id="appointment_date" required>

        <label for="doctor_name">New Doctor Name:</label>
        <input type="text" name="doctor_name" id="doctor_name" required>

        <input type="submit" value="Update Appointment">
    </form>
</body>
</html>
