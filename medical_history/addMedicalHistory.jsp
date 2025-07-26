<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
    <title>Add Medical History</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #dfe9f3, #ffffff);
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease-in-out;
        }

        .form-container:hover {
            transform: translateY(-3px);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #34495e;
            font-weight: 500;
        }

        input[type="text"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 12px 14px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        input:focus,
        textarea:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            background: linear-gradient(135deg, #28a745, #218838);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #218838, #1e7e34);
        }

        @media (max-width: 576px) {
            .form-container {
                padding: 20px;
                margin: 40px 15px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Add Medical History</h2>
    <form action="addMedicalHistoryprocess.jsp" method="post">
        <label for="patient_id">Patient:</label>
        <select name="patient_id" required>
            <option value="">Select Patient</option>
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
                        int pid = rs.getInt("id");
                        String name = rs.getString("name");
            %>
                        <option value="<%= pid %>"><%= name %> (ID: <%= pid %>)</option>
            <%
                    }
                } catch (Exception e) {
                    out.println("<option>Error loading patients</option>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </select>

        <label for="diagnosis">Diagnosis:</label>
        <input type="text" name="diagnosis" required>

        <label for="treatment">Treatment:</label>
        <textarea name="treatment" rows="4" required></textarea>

        <label for="date">Date:</label>
        <input type="date" name="date" required>

        <input type="submit" value="Add Record">
    </form>
</div>

</body>
</html>
