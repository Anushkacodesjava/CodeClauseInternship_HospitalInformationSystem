<%@ page contentType="text/html;charset=UTF-8" language="java" %>    
<html>
<head>
    <title>Dashboard - Hospital Management System</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e3efff, #c0d9ec);
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 240px;
            background-color: #1f4e79;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 30px;
            box-shadow: 3px 0 10px rgba(0,0,0,0.2);
        }

        .sidebar h2 {
            margin-bottom: 30px;
            font-size: 22px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            margin: 8px 0;
            border-radius: 8px;
            width: 80%;
            text-align: center;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #163a5a;
        }

        .logout-btn {
            margin-top: auto;
            margin-bottom: 30px;
            background-color: #dc3545;
        }

        .main {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
            margin-top: 20px;
        }

        .card {
            width: 280px;
            background: #ffffff;
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.12);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
            animation: fadeIn 0.8s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }

        .card h2 {
            font-size: 20px;
            color: #1f4e79;
            margin-bottom: 15px;
        }

        .icon {
            font-size: 40px;
            margin-bottom: 15px;
        }

        .button {
            display: block;
            margin: 8px auto;
            padding: 10px 16px;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            transition: background-color 0.3s ease;
            width: 85%;
        }

        /* Section-specific colors */
        .card.patient .icon { color: #28a745; }
        .card.patient .button { background-color: #28a745; }
        .card.patient .button:hover { background-color: #218838; }

        .card.appointment .icon { color: #17a2b8; }
        .card.appointment .button { background-color: #17a2b8; }
        .card.appointment .button:hover { background-color: #138496; }

        .card.history .icon { color: #ffc107; }
        .card.history .button { background-color: #ffc107; color: #000; }
        .card.history .button:hover { background-color: #e0a800; }

        .card.billing .icon { color: #dc3545; }
        .card.billing .button { background-color: #dc3545; }
        .card.billing .button:hover { background-color: #c82333; }

        .card.room .icon { color: #6f42c1; }
        .card.room .button { background-color: #6f42c1; }
        .card.room .button:hover { background-color: #5936a4; }

        .card.operation .icon { color: #fd7e14; }
        .card.operation .button { background-color: #fd7e14; }
        .card.operation .button:hover { background-color: #e36b06; }

        footer {
            text-align: center;
            padding: 20px;
            margin-top: 40px;
            background-color: #eaeaea;
            color: #555;
            font-size: 14px;
            border-radius: 12px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>🏥 HMS</h2>
    <a href="#">Dashboard</a>
    <a href="patient/index.jsp">Patients</a>
    <a href="appointment/viewAppointment.jsp">Appointments</a>
    <a href="billing/viewBilling.jsp">Billing</a>
    <a href="rooms/viewRoom.jsp">Rooms</a>
    <a href="operation/viewOperation.jsp">Operations</a>
    <a href="feedback/feedback.jsp">Feedback</a>
    <a href="logout.jsp" class="logout-btn">🚪 Logout</a>
</div>

<!-- Main Content -->
<div class="main">
    <h1 style="text-align:center; color:#1f4e79;">Welcome to Hospital Management Dashboard</h1>
    <div class="container">

        <!-- Patient -->
        <div class="card patient">
            <div class="icon">👤</div>
            <h2>Patient Management</h2>
            <a href="patient/add.jsp" class="button">Add Patient</a>
            <a href="patient/index.jsp" class="button">View Patients</a>
            <a href="patient/edit.jsp" class="button">Edit Patient</a>
            <a href="patient/delete.jsp" class="button">Delete Patient</a>
        </div>

        <!-- Appointment -->
        <div class="card appointment">
            <div class="icon">📅</div>
            <h2>Appointment Management</h2>
            <a href="appointment/addAppointment.jsp" class="button">Add Appointment</a>
            <a href="appointment/viewAppointment.jsp" class="button">View Appointments</a>
            <a href="appointment/editAppointment.jsp" class="button">Edit Appointment</a>
            <a href="appointment/deleteAppointment.jsp" class="button">Delete Appointment</a>
        </div>

        <!-- Medical History -->
        <div class="card history">
            <div class="icon">📝</div>
            <h2>Medical History</h2>
            <a href="medical_history/addMedicalHistory.jsp" class="button">Add Record</a>
            <a href="medical_history/viewMedicalHistory.jsp" class="button">View Records</a>
            <a href="medical_history/editMedicalHistory.jsp" class="button">Edit Record</a>
            <a href="medical_history/deleteMedicalHistory.jsp" class="button">Delete Record</a>
        </div>

        <!-- Billing -->
        <div class="card billing">
            <div class="icon">💳</div>
            <h2>Billing</h2>
            <a href="billing/addBilling.jsp" class="button">Add Bill</a>
            <a href="billing/viewBilling.jsp" class="button">View Bills</a>
            <a href="billing/editBilling.jsp" class="button">Edit Bill</a>
        </div>

        <!-- Room -->
        <div class="card room">
            <div class="icon">🏥</div>
            <h2>Room Management</h2>
            <a href="rooms/addRoom.jsp" class="button">Add Room</a>
            <a href="rooms/viewRoom.jsp" class="button">View Rooms</a>
            <a href="rooms/deleteRoom.jsp" class="button">Delete Room</a>
        </div>

        <!-- Operation Theater -->
        <div class="card operation">
            <div class="icon">🛏️</div>
            <h2>Operation Theater</h2>
            <a href="operation/addOperation.jsp" class="button">Add Operation</a>
            <a href="operation/viewOperation.jsp" class="button">View Operations</a>
            
            
        </div>
        <!-- Pathology Lab -->
<div class="card history">
    <div class="icon">🧪</div>
    <h2>Pathology Lab</h2>
    <a href="pathology/addTest.jsp" class="button">Add Test</a>
    <a href="pathology/viewTests.jsp" class="button">View Tests</a>
    
</div>


    </div>

    <footer>
        &copy; 2025 Hospital Management System | Designed by Anushka 💙
    </footer>
</div>

</body>
</html>
