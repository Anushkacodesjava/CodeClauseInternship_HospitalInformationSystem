# 🏥 Hospital Management System - JSP Based

A comprehensive **Hospital Information System** built using **JSP (Java Server Pages)**, designed for efficient hospital operations and record management. 
This project simulates real-time modules like patient handling, billing, appointments, operation records, and much more.

---

## 🚀 Features & Modules

This system includes multiple modules with **CRUD operations**. Here's a breakdown:

- **Patient Rooms**: Add, update, delete, and view room details
- **Medical History**: Manage patient medical records
- **Feedback**: Submit feedback
- **Billing**: Patient billing system
- **Online Appointments** : Appointment scheduling and management
- **Pathology Reports**: Add and view test reports
- **Operation Details**: Record and view surgical operations

### 🧾 Additional Functionalities
- **Dashboard**: Centralized visual control panel
- **Login System**: `login.jsp` for authentication and `logout.jsp` for secure logout
- **Hospital SQL**: `hospital.sql` file included for full database setup

---

## 🛠️ Technologies Used

| Technology | Description |
|------------|-------------|
| **JSP** | Java Server Pages for server-side logic |
| **MySQL** | Backend database |
| **HTML/CSS** | Frontend UI design |
| **JavaScript** | Interactive frontend elements |

---

## 🗄️ Database

- **File Included**: `hospital.sql`
- Import into your MySQL server to get started with the full schema and data.
- Contains tables for patients, appointments, rooms, billing, operations, etc.

---

## 🔐 Authentication

- Simple login system
- Secure logout functionality
- Session-based authentication

---

## 📁 Project Folder Structure

HospitalManagement/
│
├── appointments/         # Appointment system (CRUD)
├── billing/              # Billing module (CRUD)
├── feedback/             # Feedback system (CRUD)
├── medical_history/      # Medical record management (CRUD)
├── patient/              # Patient information management (CRUD)
├── rooms/                # Patient room data (CRUD)
├── pathology/            # Add and view pathology reports
├── operation/            # Add and view surgical operation info
├── dashboard.jsp         # Main dashboard for navigation
├── login.jsp             # Login form
├── logout.jsp            # Logout functionality
├── loginProcess.jsp      # Login backend logic
├── hospital.sql          # MySQL database schema and sample data
└── README.md             # Project description

