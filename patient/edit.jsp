<%@ page import="java.sql.*" %> 
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Patient</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            margin: 0;
            padding: 40px 20px;
        }

        .form-container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            max-width: 550px;
            margin: auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 8px;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            transition: border 0.3s ease;
            font-size: 15px;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #3498db;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background: #3498db;
            color: #fff;
            padding: 14px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #2980b9;
        }

        @media (max-width: 600px) {
            .form-container {
                padding: 25px 20px;
            }
        }
    </style>
</head>
<body>
<div class="form-container">
<%
    String idStr = request.getParameter("id");

    if (idStr == null) {
%>
        <h2>Enter Patient ID to Edit</h2>
        <form method="get" action="editprocess.jsp">
            <label for="id">Patient ID:</label>
            <input type="number" name="id" id="id" placeholder="Enter Patient ID" required>
            <input type="submit" value="Fetch Patient">
        </form>
<%
    } else {
        int id = Integer.parseInt(idStr);
        String dbUrl = "jdbc:mysql://localhost:3306/hospital_db";
        String dbUser = "root";
        String dbPass = "@anushri2601"; 

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM patients WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
%>
                <h2>Edit Patient Details</h2>
                <form method="post" action="editprocess.jsp">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                    
                    <label for="name">Name:</label>
                    <input type="text" name="name" id="name" value="<%= rs.getString("name") %>" required>
                    
                    <label for="age">Age:</label>
                    <input type="number" name="age" id="age" value="<%= rs.getInt("age") %>" required>
                    
                    <label for="gender">Gender:</label>
                    <select name="gender" id="gender" required>
                        <option <%= rs.getString("gender").equals("Male") ? "selected" : "" %>>Male</option>
                        <option <%= rs.getString("gender").equals("Female") ? "selected" : "" %>>Female</option>
                        <option <%= rs.getString("gender").equals("Other") ? "selected" : "" %>>Other</option>
                    </select>
                    
                    <label for="disease">Disease:</label>
                    <input type="text" name="disease" id="disease" value="<%= rs.getString("disease") %>" required>
                    
                    <input type="submit" value="Update Patient">
                </form>
<%
            } else {
%>
                <script>alert("Patient not found."); window.location = "edit.jsp";</script>
<%
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
%>
            <p style="color:red;">Error: <%= e.getMessage() %></p>
<%
        }
    }
%>
</div>
</body>
</html>
