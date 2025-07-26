<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String patient_id = request.getParameter("patient_id");
    String room_number = request.getParameter("room_number");
    String room_type = request.getParameter("room_type");
    String admission_date = request.getParameter("admission_date");
    String discharge_date = request.getParameter("discharge_date");

    Connection con = null;
    PreparedStatement pst = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

        String sql = "UPDATE rooms SET patient_id = ?, room_number = ?, room_type = ?, admission_date = ?, discharge_date = ? WHERE id = ?";
        pst = con.prepareStatement(sql);
        pst.setInt(1, Integer.parseInt(patient_id));
        pst.setString(2, room_number);
        pst.setString(3, room_type);
        pst.setString(4, admission_date);
        pst.setString(5, discharge_date);
        pst.setInt(6, Integer.parseInt(id));

        int rows = pst.executeUpdate();

        if (rows > 0) {
            out.println("<script>alert('Room updated successfully!'); window.location='viewRoom.jsp';</script>");
        } else {
            out.println("<script>alert('Update failed!'); window.history.back();</script>");
        }
    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    } finally {
        try { if (pst != null) pst.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
