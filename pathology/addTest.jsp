<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Pathology Test</title>
    <style>
        body { font-family: Arial; background: #f2f2f2; padding: 30px; }
        .form-container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); max-width: 500px; margin: auto; }
        input, textarea, select { width: 100%; padding: 10px; margin: 10px 0; }
        input[type=submit] { background-color: #4CAF50; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add Pathology Test</h2>
        <form action="addTestProcess.jsp" method="post">
            <label>Patient ID:</label>
            <input type="number" name="patient_id" required>

            <label>Test Name:</label>
            <input type="text" name="test_name" required>

            <label>Test Date:</label>
            <input type="date" name="test_date" required>

            <label>Status:</label>
            <select name="status">
                <option value="Pending">Pending</option>
                <option value="Completed">Completed</option>
            </select>

            <label>Remarks:</label>
            <textarea name="remarks"></textarea>

            <input type="submit" value="Add Test">
        </form>
    </div>
</body>
</html>
