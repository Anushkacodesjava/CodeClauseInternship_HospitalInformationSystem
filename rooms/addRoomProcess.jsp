<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Room Assignment Result</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e3efff, #c0d9ec);
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .message-box {
            background-color: white;
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        h3 {
            color: #1f4e79;
            font-size: 22px;
            margin-bottom: 10px;
        }

        .success {
            color: #28a745;
        }

        .error {
            color: #dc3545;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #1f4e79;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
            background-color: #163a5a;
        }
    </style>
</head>
<body>
    <div class="message-box">
<%
    String patientId = request.getParameter("patient_id");
    String roomNumber = request.getParameter("room_number");
    String roomType = request.getParameter("room_type");
    String admissionDate = request.getParameter("admission_date");
    String dischargeDate = request.getParameter("discharge_date");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

        String query = "INSERT INTO rooms (patient_id, room_number, room_type, admission_date, discharge_date) VALUES (?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(query);
        ps.setInt(1, Integer.parseInt(patientId));
        ps.setString(2, roomNumber);
        ps.setString(3, roomType);
        ps.setDate(4, Date.valueOf(admissionDate));

        if (dischargeDate != null && !dischargeDate.equals("")) {
            ps.setDate(5, Date.valueOf(dischargeDate));
        } else {
            ps.setNull(5, java.sql.Types.DATE);
        }

        int result = ps.executeUpdate();

        if(result > 0){
%>
        <h3 class="success">✅ Room assigned successfully!</h3>
<%
        } else {
%>
        <h3 class="error">❌ Room assignment failed.</h3>
<%
        }

    } catch(Exception e){
%>
        <h3 class="error">⚠️ Error: <%= e.getMessage() %></h3>
<%
    } finally {
        if(ps != null) try { ps.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
        <a class="back-link" href="viewRoom.jsp">⬅ Back to Rooms</a>
    </div>
</body>
</html>
