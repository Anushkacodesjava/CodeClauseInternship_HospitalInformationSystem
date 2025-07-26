<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %>
<%
    String id = request.getParameter("id");
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    int patient_id = 0;
    String billing_date = "";
    double amount = 0;
    String payment_method = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");

        pst = con.prepareStatement("SELECT * FROM billing WHERE id = ?");
        pst.setString(1, id);
        rs = pst.executeQuery();

        if(rs.next()) {
            patient_id = rs.getInt("patient_id");
            billing_date = rs.getString("billing_date");
            amount = rs.getDouble("amount");
            payment_method = rs.getString("payment_method");
        }
    } catch(Exception e) {
        out.println("<p style='color: red;'>Error loading billing record: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Billing</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            align-items: center;
            justify-content: center;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            background-color: #f9f9f9;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #1f4e79;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #163b5c;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Billing</h2>
        <form action="editBillingProcess.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">

            <label for="patient_id">Patient ID:</label>
            <input type="number" id="patient_id" name="patient_id" value="<%= patient_id %>" required>

            <label for="billing_date">Billing Date:</label>
            <input type="date" id="billing_date" name="billing_date" value="<%= billing_date %>" required>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" step="0.01" value="<%= amount %>" required>

            <label for="payment_method">Payment Method:</label>
            <select id="payment_method" name="payment_method" required>
                <option value="Cash" <%= "Cash".equals(payment_method) ? "selected" : "" %>>Cash</option>
                <option value="Card" <%= "Card".equals(payment_method) ? "selected" : "" %>>Card</option>
                <option value="UPI" <%= "UPI".equals(payment_method) ? "selected" : "" %>>UPI</option>
            </select>

            <input type="submit" value="Update Billing">
        </form>
    </div>
</body>
</html>
