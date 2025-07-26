<%@ page import="java.sql.*" %>
<%
    String patient_id = request.getParameter("patient_id");
    String operation_type = request.getParameter("operation_type");
    String operation_date = request.getParameter("operation_date");
    String start_time = request.getParameter("start_time");
    String end_time = request.getParameter("end_time");
    String status = request.getParameter("status");
    String notes = request.getParameter("notes");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

        String query = "INSERT INTO operation_theater (patient_id, operation_type, operation_date, start_time, end_time, status, notes) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setInt(1, Integer.parseInt(patient_id));
        pst.setString(2, operation_type);
        pst.setDate(3, Date.valueOf(operation_date));
        pst.setTime(4, Time.valueOf(start_time + ":00"));
        pst.setTime(5, Time.valueOf(end_time + ":00"));
        pst.setString(6, status);
        pst.setString(7, notes);

        int result = pst.executeUpdate();
        if(result > 0){
            out.println("<p style='color:green;'>Operation scheduled successfully.</p>");
        } else {
            out.println("<p style='color:red;'>Failed to schedule operation.</p>");
        }
        con.close();
    } catch(Exception e){
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
