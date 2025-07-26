CREATE DATABASE hospital_db;
USE hospital_db;

-- Table: patients
CREATE TABLE patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    disease VARCHAR(255)
);

-- Table: appointments
CREATE TABLE appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    appointment_date DATE,
    doctor_name VARCHAR(100),
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);

-- Table: medical_history
CREATE TABLE medical_history (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    diagnosis VARCHAR(255),
    treatment TEXT,
    record_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);

-- Table: users
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    password VARCHAR(100),
    role VARCHAR(50),
    name VARCHAR(100)
);

-- Table: feedback
CREATE TABLE feedback (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    rating VARCHAR(10),
    comments TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);

-- Table: billing
CREATE TABLE billing (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    billing_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
);

-- Table: operation_theater
CREATE TABLE operation_theater (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    operation_type VARCHAR(100),
    operation_date DATE,
    start_time TIME,
    end_time TIME,
    status VARCHAR(50),
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

-- Table: pathalogy
CREATE TABLE pathology (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    test_name VARCHAR(100),
    test_date DATE,
    status VARCHAR(50),
    remarks TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);