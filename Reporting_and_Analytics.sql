-- Create a Reporting_and_Analytics Database
CREATE DATABASE Reporting_and_Analytics;

-- To access the DB
USE Reporting_and_Analytics;

-- Create Circulation_Stats Table in Reporting_and_Analytics Database
CREATE TABLE Circulation_Stats (
    id INT PRIMARY KEY,
    date DATE,
    total_checkouts INT,
    total_returns INT
);

-- Create Collection_Stats Table in Reporting_and_Analytics Database
CREATE TABLE Collection_Stats (
    id INT PRIMARY KEY,
    date DATE,
    total_books INT,
    total_authors INT
);

-- Create Patron_Stats Table in Reporting_and_Analytics Database
CREATE TABLE Patron_Stats (
    id INT PRIMARY KEY,
    date DATE,
    total_patrons INT,
    total_membership INT
);

-- Create Fine_Stats Table in Reporting_and_Analytics Database
CREATE TABLE Fine_Stats (
    id INT PRIMARY KEY,
    date DATE,
    total_fines DECIMAL(10, 2),
    total_payments DECIMAL(10, 2)
);

-- Create Survey_Responses Table in Reporting_and_Analytics Database
CREATE TABLE Survey_Responses (
    id INT PRIMARY KEY,
    date DATE,
    question_id INT,
    response_text TEXT
);

-- Insert into Circulation_Stats
INSERT INTO Circulation_Stats (id, date, total_checkouts, total_returns) VALUES
(1, '2023-09-01', 50, 45),
(2, '2023-09-02', 60, 55);

-- Insert into Collection_Stats
INSERT INTO Collection_Stats (id, date, total_books, total_authors) VALUES
(1, '2023-09-01', 1000, 200),
(2, '2023-09-02', 1010, 205);

-- Insert into Patron_Stats
INSERT INTO Patron_Stats (id, date, total_patrons, total_membership) VALUES
(1, '2023-09-01', 300, 150),
(2, '2023-09-02', 310, 155);

-- Insert into Fine_Stats
INSERT INTO Fine_Stats (id, date, total_fines, total_payments) VALUES
(1, '2023-09-01', 100.00, 80.00),
(2, '2023-09-02', 120.00, 90.00);

-- Insert into Survey_Responses
INSERT INTO Survey_Responses (id, date, question_id, response_text) VALUES
(1, '2023-09-01', 1, 'Great service!'),
(2, '2023-09-02', 2, 'More books, please.');
