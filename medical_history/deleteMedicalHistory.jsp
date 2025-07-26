<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Medical History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            text-align: center;
            padding-top: 80px;
        }
        form {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            display: inline-block;
        }
        input[type="number"] {
            padding: 10px;
            width: 250px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }
        input[type="submit"] {
            padding: 10px 25px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        a {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
    <form action="deleteMedicalProcess.jsp" method="post">
        <h2>🗑️ Delete Medical History</h2>
        <label for="id">Enter Medical History ID:</label><br>
        <input type="number" name="id" id="id" required><br>
        <input type="submit" value="Delete">
        <a href="<%= request.getContextPath() %>/dashboard.jsp">Go to Dashboard</a>
        
    </form>
</body>
</html>
