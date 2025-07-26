<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Room</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            padding: 30px;
        }
        .form-container {
            background: white;
            padding: 25px;
            max-width: 600px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    String id = request.getParameter("id");
    if (id == null || id.isEmpty()) {
        out.println("<h3 style='color:red; text-align:center;'>Room ID is missing in URL!</h3>");
        return;
    }

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    int patient_id = 0;
    String room_number = "";
    String room_type = "";
    String admission_date = "";
    String discharge_date = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
        pst = con.prepareStatement("SELECT * FROM rooms WHERE id = ?");
        pst.setInt(1, Integer.parseInt(id));
        rs = pst.executeQuery();

        if (rs.next()) {
            patient_id = rs.getInt("patient_id");
            room_number = rs.getString("room_number");
            room_type = rs.getString("room_type");
            admission_date = rs.getString("admission_date");
            discharge_date = rs.getString("discharge_date");
        } else {
            out.println("<h3 style='color:red; text-align:center;'>No room found with ID " + id + "!</h3>");
            return;
        }
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>" + e.getMessage() + "</h3>");
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (pst != null) pst.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>

<div class="form-container">
    <h2>Edit Room</h2>
    <form action="editRoomProcess.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">

        <label>Patient ID</label>
        <input type="number" name="patient_id" value="<%= patient_id %>" required>

        <label>Room Number</label>
        <input type="text" name="room_number" value="<%= room_number %>" required>

        <label>Room Type</label>
        <input type="text" name="room_type" value="<%= room_type %>" required>

        <label>Admission Date</label>
        <input type="date" name="admission_date" value="<%= admission_date %>">

        <label>Discharge Date</label>
        <input type="date" name="discharge_date" value="<%= discharge_date %>">

        <button type="submit">Update Room</button>
    </form>
</div>

</body>
</html>
