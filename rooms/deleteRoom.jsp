<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Room</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-box {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 350px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-size: 14px;
            color: #555;
        }
        select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background-color: #fff;
            font-size: 14px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background-color: #b52a37;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Delete Room</h2>
        <form action="deleteRoomProcess.jsp" method="post">
            <label for="id">Select Room ID to Delete:</label>
            <select name="id" id="id" required>
                <option value="">-- Select Room ID --</option>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery("SELECT id FROM rooms");

                        while (rs.next()) {
                            int roomId = rs.getInt("id");
                %>
                            <option value="<%=roomId%>"><%=roomId%></option>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<option disabled>Error loading rooms</option>");
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </select>
            <button type="submit">Delete</button>
        </form>
    </div>
</body>
</html>
