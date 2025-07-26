<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%
    
    String patientId = request.getParameter("patient_id");
    String billingDate = request.getParameter("billing_date");
    String amount = request.getParameter("amount");
    String paymentMethod = request.getParameter("payment_method");

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

        String sql = "INSERT INTO billing (patient_id, billing_date, amount, payment_method) VALUES (?, ?, ?, ?)";
        ps = con.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(patientId));
        ps.setString(2, billingDate);
        ps.setDouble(3, Double.parseDouble(amount));
        ps.setString(4, paymentMethod);

        int result = ps.executeUpdate();

        if(result > 0){
%>
            <script>
                alert("Billing added successfully!");
                <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to add billing. Try again.");
                history.back();
            </script>
<%
        }
    } catch(Exception e) {
%>
        <script>
            alert("Error: <%=e.getMessage()%>");
            history.back();
        </script>
<%
    } finally {
        try { if(ps != null) ps.close(); } catch(Exception e) {}
        try { if(con != null) con.close(); } catch(Exception e) {}
    }
%>
