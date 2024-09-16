-- Create a Patron_Management Database
CREATE DATABASE Patron_Management;

-- To access the DB
USE Patron_Management;

-- Create Patrons Table in Patron_Management Database
CREATE TABLE Patrons (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(15),
    address TEXT
);

-- Create Membership_Types Table in Patron_Management Database
CREATE TABLE Membership_Types (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    duration INT
);

-- Create Patron_Membership Table in Patron_Management Database
CREATE TABLE Patron_Membership (
    id INT PRIMARY KEY,
    patron_id INT,
    membership_type_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (patron_id) REFERENCES Patrons(id),
    FOREIGN KEY (membership_type_id) REFERENCES Membership_Types(id)
);

-- Create Patron_Fines Table in Patron_Management Database
CREATE TABLE Patron_Fines (
    id INT PRIMARY KEY,
    patron_id INT,
    fine_amount DECIMAL(10, 2),
    fine_date DATE,
    FOREIGN KEY (patron_id) REFERENCES Patrons(id)
);

-- Create Patron_Payments Table in Patron_Management Database
CREATE TABLE Patron_Payments (
    id INT PRIMARY KEY,
    patron_id INT,
    payment_amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (patron_id) REFERENCES Patrons(id)
);

-- Insert into Patrons
INSERT INTO Patrons (id, name, email, phone_number, address) VALUES
(1, 'John Doe', 'john.doe@example.com', '1234567890', '789 Patron Rd, City, Country'),
(2, 'Jane Smith', 'jane.smith@example.com', '0987654321', '456 Patron Ln, City, Country');

-- Insert into Membership_Types
INSERT INTO Membership_Types (id, name, description, duration) VALUES
(1, 'Standard', 'Standard membership with basic privileges.', 12),
(2, 'Premium', 'Premium membership with additional privileges.', 24);

-- Insert into Patron_Membership
INSERT INTO Patron_Membership (id, patron_id, membership_type_id, start_date, end_date) VALUES
(1, 1, 1, '2023-01-01', '2024-01-01'),
(2, 2, 2, '2023-01-01', '2025-01-01');

-- Insert into Patron_Fines
INSERT INTO Patron_Fines (id, patron_id, fine_amount, fine_date) VALUES
(1, 1, 5.00, '2023-06-15'),
(2, 2, 10.00, '2023-07-20');

-- Insert into Patron_Payments
INSERT INTO Patron_Payments (id, patron_id, payment_amount, payment_date) VALUES
(1, 1, 5.00, '2023-06-16'),
(2, 2, 10.00, '2023-07-21');
