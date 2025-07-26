<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Medical History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }
        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            margin-top: 5px;
            border-radius: 5px;
        }
        button {
            margin-top: 20px;
            padding: 10px;
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="form-box">
    <h2>Edit Medical History</h2>
    <form action="editMedicalProcess.jsp" method="post">
        <label for="id">Select Medical History ID:</label>
        <select name="id" required>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db", "your_user", "your_password");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT id FROM medical_history");
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        out.println("<option value='" + id + "'>" + id + "</option>");
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<option disabled>Error loading IDs</option>");
                }
            %>
        </select>

        <label for="diagnosis">New Diagnosis:</label>
        <input type="text" name="diagnosis" required>

        <label for="treatment">New Treatment:</label>
        <input type="text" name="treatment" required>

        <label for="date">New Date:</label>
        <input type="date" name="date" required>

        <button type="submit">Update Record</button>
    </form>
</div>
</body>
</html>
