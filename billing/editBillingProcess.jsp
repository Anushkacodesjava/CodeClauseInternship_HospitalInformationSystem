<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Billing</title>
    <style>
        body {
            background: #f7f9fc;
            font-family: 'Segoe UI', sans-serif;
            text-align: center;
            padding-top: 100px;
        }

        .message {
            display: inline-block;
            padding: 20px 40px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            animation: fadeIn 0.8s ease-in-out;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String patientId = request.getParameter("patient_id");
    String date = request.getParameter("billing_date");
    String amount = request.getParameter("amount");
    String method = request.getParameter("payment_method");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601"
        );
        PreparedStatement ps = con.prepareStatement(
            "UPDATE billing SET patient_id=?, billing_date=?, amount=?, payment_method=? WHERE id=?"
        );
        ps.setString(1, patientId);
        ps.setString(2, date);
        ps.setString(3, amount);
        ps.setString(4, method);
        ps.setInt(5, id);

        int i = ps.executeUpdate();
        con.close();
        if(i > 0) {
%>
            <div class="message success">
                Billing updated successfully! <br><br>
                <a href="viewBilling.jsp" style="color: #155724; text-decoration: underline;">Go Back</a>
            </div>
<%
        } else {
%>
            <div class="message error">
                Failed to update billing. Please try again.
            </div>
<%
        }
    } catch(Exception e) {
%>
    <div class="message error">
        Error: <%= e.getMessage() %>
    </div>
<%
    }
%>
</body>
</html>
