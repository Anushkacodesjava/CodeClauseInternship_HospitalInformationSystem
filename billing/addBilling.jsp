<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Billing</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #dbeafe, #f0f9ff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 30px 35px;
            border-radius: 12px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #1e3a8a;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin: 12px 0 5px;
            font-weight: 500;
            color: #1e293b;
        }
        input, select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            background-color: #f8fafc;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }
        input:focus, select:focus {
            border-color: #3b82f6;
            outline: none;
            background-color: #ffffff;
        }
        input[type=submit] {
            background-color: #1e40af;
            color: white;
            border: none;
            margin-top: 20px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type=submit]:hover {
            background-color: #1d4ed8;
        }
        @media (max-width: 480px) {
            .container {
                padding: 20px;
                margin: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Billing</h2>
        <form action="addBillingProcess.jsp" method="post">
            <label for="patient_id">Select Patient:</label>
            <select name="patient_id" id="patient_id" required>
                <option value="">-- Select Patient --</option>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT id, name FROM patients");
                        while(rs.next()) {
                %>
                    <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
                <%
                        }
                        con.close();
                    } catch(Exception e) {
                        out.println("Error loading patient list");
                    }
                %>
            </select>

            <label for="billing_date">Billing Date:</label>
            <input type="date" name="billing_date" id="billing_date" required>

            <label for="amount">Amount:</label>
            <input type="number" step="0.01" name="amount" id="amount" required>

            <label for="payment_method">Payment Method:</label>
            <select name="payment_method" id="payment_method" required>
                <option value="Cash">Cash</option>
                <option value="Card">Card</option>
                <option value="UPI">UPI</option>
            </select>

            <input type="submit" value="Add Billing">
        </form>
    </div>
</body>
</html>
