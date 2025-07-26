<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Select Patient</title>
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #e3f2fd, #ffffff);
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 600px;
        margin: 60px auto;
        padding: 30px;
        background-color: #ffffff;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #0d47a1;
        margin-bottom: 25px;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    label {
        font-size: 18px;
        margin-bottom: 10px;
        color: #333;
    }

    select {
        width: 80%;
        padding: 12px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 8px;
        background-color: #f8f9fa;
        transition: border-color 0.3s ease;
    }

    select:focus {
        border-color: #2196f3;
        outline: none;
    }

    button {
        margin-top: 20px;
        padding: 12px 30px;
        font-size: 16px;
        background-color: #1976d2;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    button:hover {
        background-color: #1565c0;
        transform: scale(1.05);
    }

    option {
        padding: 10px;
    }
</style>

</head>
<body>
    <h2>View Medical History</h2>

    <form method="GET" action="viewMedicalProcess.jsp">
        <label for="patient_id">Select Patient:</label>
        <select name="patient_id" id="patient_id" required>
            <option value="">--Select--</option>
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_db", "root", "@anushri2601");
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT id, name FROM patients");

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
            %>
                        <option value="<%= id %>"><%= name %> (ID: <%= id %>)</option>
            <%
                    }
                } catch (Exception e) {
                    out.println("<option>Error loading patients</option>");
                    e.printStackTrace(); // Optional for debugging
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                    try { if (conn != null) conn.close(); } catch (Exception e) {}
                }
            %>
        </select>
        <br>
        <button type="submit">View History</button>
    </form>
</body>
</html>
