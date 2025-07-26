<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    boolean success = false;
    String message = "";

    try {
        String patientIdStr = request.getParameter("patient_id");
        String appointmentDate = request.getParameter("appointment_date");
        String doctorName = request.getParameter("doctor_name");

        if (patientIdStr == null || appointmentDate == null || doctorName == null ||
            patientIdStr.isEmpty() || appointmentDate.isEmpty() || doctorName.isEmpty()) {
            message = "All fields are required.";
        } else {
            int patient_id = Integer.parseInt(patientIdStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

            // Check if patient exists
            PreparedStatement check = conn.prepareStatement("SELECT id FROM patients WHERE id = ?");
            check.setInt(1, patient_id);
            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO appointments (patient_id, appointment_date, doctor_name) VALUES (?, ?, ?)");
                ps.setInt(1, patient_id);
                ps.setDate(2, java.sql.Date.valueOf(appointmentDate));
                ps.setString(3, doctorName);

                int result = ps.executeUpdate();
                success = (result > 0);
                if (success) {
                    message = "Appointment added successfully!";
                } else {
                    message = "Failed to add appointment.";
                }
            } else {
                message = "Patient ID not found.";
            }
            conn.close();
        }
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Appointment Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            padding: 20px;
            text-align: center;
        }
        .msg {
            font-size: 20px;
            margin-bottom: 20px;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
        a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
    <div class="msg <%= success ? "success" : "error" %>">
        <%= message %>
    </div>
    <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>
</body>
</html>
