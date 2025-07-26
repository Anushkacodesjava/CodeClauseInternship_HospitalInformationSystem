<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Operation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 40px;
        }
        .form-container {
            background: #fff;
            padding: 30px;
            max-width: 500px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type=submit] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Schedule Operation</h2>
    <form action="addOperationProcess.jsp" method="post">
        Patient ID: <input type="text" name="patient_id" required/><br/>
        Operation Type: <input type="text" name="operation_type" required/><br/>
        Operation Date: <input type="date" name="operation_date" required/><br/>
        Start Time: <input type="time" name="start_time" required/><br/>
        End Time: <input type="time" name="end_time" required/><br/>
        Status: <input type="text" name="status" required/><br/>
        Notes: <textarea name="notes" rows="4"></textarea><br/>
        <input type="submit" value="Schedule Operation"/>
    </form>
</div>
</body>
</html>
