<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assign Room</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef6f7;
            padding: 30px;
        }
        h2 {
            color: #2c3e50;
            text-align: center;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #2ecc71;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <h2>Assign Room to Patient</h2>
    <form action="addRoomProcess.jsp" method="post">
        <label>Select Patient:</label>
        <select name="patient_id" required>
            <option value="">-- Select Patient --</option>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT id, name FROM patients");
                    while(rs.next()) {
            %>
                        <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %> (ID: <%= rs.getInt("id") %>)</option>
            <%
                    }
                } catch(Exception e) {
            %>
                    <option disabled>Error loading patients</option>
            <%
                } finally {
                    if(rs != null) try { rs.close(); } catch(Exception e) {}
                    if(stmt != null) try { stmt.close(); } catch(Exception e) {}
                    if(conn != null) try { conn.close(); } catch(Exception e) {}
                }
            %>
        </select>

        <label>Room Number:</label>
        <input type="text" name="room_number" required>

        <label>Room Type:</label>
        <select name="room_type" required>
            <option value="Emergency ward">Emergency ward</option>
            <option value="General">General</option>
            <option value="Private">Private</option>
            <option value="ICU">ICU</option>
            <option value="gynecology and maternity">gynecology and maternity</option>
            <option value="Specialist ward">Specialist ward</option>
            

        
            
        </select>

        <label>Admission Date:</label>
        <input type="date" name="admission_date" required>

        <label>Discharge Date:</label>
        <input type="date" name="discharge_date">

        <input type="submit" value="Assign Room">
    </form>
</body>
</html>
