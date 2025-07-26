<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%@ page session="true" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    boolean isValidUser = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            isValidUser = true;
            session.setAttribute("username", username);
        }
        con.close();
    } catch(Exception e) {
        out.println("<div class='error'>Error: " + e.getMessage() + "</div>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login Result</title>
    <style>
        body {
            background: linear-gradient(135deg, #4b79a1, #283e51);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
        }
        .box {
            background-color: rgba(0,0,0,0.6);
            padding: 40px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 0 20px rgba(255,255,255,0.2);
        }
        h2 {
            color: #f9d342;
            margin-bottom: 20px;
        }
        .success {
            color: #90ee90;
            font-size: 20px;
        }
        .error {
            color: #ff6666;
            font-size: 20px;
        }
        a {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #f9d342;
            font-weight: bold;
            padding: 10px 20px;
            border: 2px solid #f9d342;
            border-radius: 10px;
            transition: 0.3s;
        }
        a:hover {
            background-color: #f9d342;
            color: #000;
        }
    </style>
</head>
<body>
    <div class="box">
        <% if(isValidUser) { %>
            <h2>Login Successful!</h2>
            <div class="success">Welcome, <%= username %> </div>
            <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>

        <% } else { %>
            <h2>Login Failed</h2>
            <div class="error">Invalid username or password. Please try again.</div>
            <a href="login.jsp">Back to Login</a>
        <% } %>
    </div>
</body>
</html>
