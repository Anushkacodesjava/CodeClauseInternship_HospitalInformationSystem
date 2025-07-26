<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Patient</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f1f1;
            padding: 30px;
        }
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            max-width: 400px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background: #e74c3c;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Delete Patient Record</h2>
        <form action="deleteprocess.jsp" method="post">
            <label for="id">Select Patient ID to Delete:</label>
            <select name="id" id="id" required>
                <option value="">-- Select Patient ID --</option>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT id FROM patients");

                        while (rs.next()) {
                            int pid = rs.getInt("id");
                %>
                            <option value="<%= pid %>"><%= pid %></option>
                <%
                        }
                        conn.close();
                    } catch(Exception e) {
                        out.println("<option disabled>Error fetching IDs</option>");
                        e.printStackTrace();
                    }
                %>
            </select>
            <input type="submit" value="Delete">
        </form>
    </div>
</body>
</html>
