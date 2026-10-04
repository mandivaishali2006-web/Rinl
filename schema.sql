CREATE DATABASE IF NOT EXISTS rinl_factory_system;
USE rinl_factory_system;

CREATE TABLE Users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL,
    department VARCHAR(100)
);

CREATE TABLE Issues (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(100) NOT NULL,
    priority VARCHAR(50) NOT NULL,
    location VARCHAR(200) NOT NULL,
    image VARCHAR(255),
    status VARCHAR(50) DEFAULT 'PENDING',
    reported_by BIGINT,
    assigned_to BIGINT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reported_by) REFERENCES Users(id) ON DELETE SET NULL,
    FOREIGN KEY (assigned_to) REFERENCES Users(id) ON DELETE SET NULL
);

CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    issue_id INT NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    schedule_date DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'SCHEDULED',
    FOREIGN KEY (issue_id) REFERENCES Issues(issue_id) ON DELETE CASCADE
);

CREATE TABLE Audit_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT,
    action VARCHAR(255) NOT NULL,
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Default test users. Password is '123456' for all.
INSERT INTO Users (name, email, password, role, department) VALUES 
('Test Worker', 'worker@test.com', '$2a$10$o.cTz2r00d5jUuDmg4.j5.Csp5K9jK2T/hC5kP8U1oB9kQW3uG.QW', 'WORKER', 'Production'),
('Test Manager', 'manager@test.com', '$2a$10$o.cTz2r00d5jUuDmg4.j5.Csp5K9jK2T/hC5kP8U1oB9kQW3uG.QW', 'MANAGER', 'Maintenance'),
('Test Admin', 'admin@test.com', '$2a$10$o.cTz2r00d5jUuDmg4.j5.Csp5K9jK2T/hC5kP8U1oB9kQW3uG.QW', 'ADMIN', 'Administration');
