<%@ page import="java.sql.*" %> 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Appointment</title>
    <style>
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #dbeafe, #f0f9ff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        form {
            background-color: #ffffff;
            padding: 40px 35px;
            width: 100%;
            max-width: 500px;
            border-radius: 18px;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.15);
            transition: 0.3s ease-in-out;
        }

        form:hover {
            box-shadow: 0 16px 45px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #1f2937;
            font-size: 26px;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: 600;
            color: #374151;
            font-size: 15px;
        }

        input, select {
            width: 100%;
            padding: 12px 14px;
            margin-top: 8px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.25s ease-in-out;
            background-color: #f9fafb;
        }

        input:focus, select:focus {
            border-color: #4CAF50;
            background-color: #ffffff;
            box-shadow: 0 0 6px rgba(76, 175, 80, 0.25);
            outline: none;
        }

        input[type="submit"] {
            margin-top: 30px;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            border: none;
            padding: 12px;
            border-radius: 10px;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #43a047;
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
    <form action="addAppointmentProcess.jsp" method="post">
        <h2>Add Appointment</h2>

        <label for="patient">Select Patient:</label>
        <select name="patient_id" id="patient" required>
            <%
                Connection conn = null;
                Statement st = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                    st = conn.createStatement();
                    rs = st.executeQuery("SELECT id, name FROM patients");
                    while (rs.next()) {
                        int pid = rs.getInt("id");
                        String pname = rs.getString("name");
            %>
                <option value="<%= pid %>"><%= pname %> (ID: <%= pid %>)</option>
            <%
                    }
                } catch (Exception e) {
                    out.println("<option disabled>Error loading patients</option>");
                    e.printStackTrace(); // For debugging only
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (st != null) st.close(); } catch (Exception e) {}
                    try { if (conn != null) conn.close(); } catch (Exception e) {}
                }
            %>
        </select>

        <label for="date">Date:</label>
        <input type="date" name="appointment_date" id="date" required>

        <label for="doctor">Doctor Name:</label>
        <input type="text" name="doctor_name" id="doctor" required>

        <input type="submit" value="Add Appointment">
    </form>
</body>
</html>
