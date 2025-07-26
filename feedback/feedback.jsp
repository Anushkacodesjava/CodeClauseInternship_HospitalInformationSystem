<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            margin: 50px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-top: 15px;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            margin-top: 20px;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        .back-link {
            margin-top: 20px;
            display: block;
            text-align: center;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Submit Feedback</h2>
    <form action="feedbackProcess.jsp" method="post">
        <label for="patient_id">Patient ID:</label>
        <input type="text" name="patient_id" id="patient_id" required>

        <label for="rating">Rating:</label>
        <select name="rating" id="rating" required>
            <option value="">--Select Rating--</option>
            <option value="Excellent">Excellent</option>
            <option value="Very Good">Very Good</option>
            <option value="Good">Good</option>
            <option value="Fair">Fair</option>
            <option value="Poor">Poor</option>
        </select>

        <label for="comments">Comments:</label>
        <textarea name="comments" id="comments" rows="4"></textarea>

        <input type="submit" value="Submit Feedback">
    </form>
    <a class="back-link href="<%= request.getContextPath() %>/dashboard.jsp"" >← Back to Dashboard</a>
</div>
</body>
</html>
