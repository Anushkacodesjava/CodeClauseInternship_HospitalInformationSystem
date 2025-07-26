<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Billing</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f9ff;
            padding: 30px;
        }
        h2 {
            color: #2c3e50;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 0 10px #ccc;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        a {
            color: #2980b9;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Billing Records</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Patient Name</th>
            <th>Date</th>
            <th>Amount</th>
            <th>Payment</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                Statement st = con.createStatement();
                String query = "SELECT b.id, p.name, b.billing_date, b.amount, b.payment_method FROM billing b JOIN patients p ON b.patient_id = p.id";
                ResultSet rs = st.executeQuery(query);
                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getDate("billing_date") %></td>
            <td><%= rs.getDouble("amount") %></td>
            <td><%= rs.getString("payment_method") %></td>
            <td>
                <a href="editBilling.jsp?id=<%= rs.getInt("id") %>">Edit</a>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch(Exception e) {
                out.println("Error loading billing data.");
            }
        %>
    </table>
</body>
</html>
