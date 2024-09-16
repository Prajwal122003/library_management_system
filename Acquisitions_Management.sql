-- Create a Acquisitions_Management Database
CREATE DATABASE Acquisitions_Management;

-- To access the DB
USE Acquisitions_Management;

-- Create Books Table in Acquisitions_Management Database
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    order_date DATE,
    total_cost DECIMAL(10, 2),
    FOREIGN KEY (book_id) REFERENCES book_management.Books(id)
);

-- Create Vendors Table in Acquisitions_Management Database
CREATE TABLE Vendors (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    address TEXT,
    contact_info TEXT
);

-- Create Order_Items Table in Acquisitions_Management Database
CREATE TABLE Order_Items (
    id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    cost DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (book_id) REFERENCES book_management.Books(id)
);

-- Create Receipts Table in Acquisitions_Management Database
CREATE TABLE Receipts (
    id INT PRIMARY KEY,
    order_id INT,
    receipt_date DATE,
    total_cost DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);

-- Create Invoices Table in Acquisitions_Management Database
CREATE TABLE Invoices (
    id INT PRIMARY KEY,
    order_id INT,
    invoice_date DATE,
    total_cost DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);

-- Insert into Orders
INSERT INTO Orders (id, book_id, quantity, order_date, total_cost) VALUES
(1, 1, 10, '2023-08-01', 150.00),
(2, 2, 5, '2023-08-05', 75.00);

-- Insert into Vendors
INSERT INTO Vendors (id, name, address, contact_info) VALUES
(1, 'Book Vendor A', '123 Vendor St, City, Country', 'vendorA@example.com'),
(2, 'Book Vendor B', '456 Vendor Ave, City, Country', 'vendorB@example.com');

-- Insert into Order_Items
INSERT INTO Order_Items (id, order_id, book_id, quantity, cost) VALUES
(1, 1, 1, 10, 150.00),
(2, 2, 2, 5, 75.00);

-- Insert into Receipts
INSERT INTO Receipts (id, order_id, receipt_date, total_cost) VALUES
(1, 1, '2023-08-10', 150.00),
(2, 2, '2023-08-15', 75.00);

-- Insert into Invoices
INSERT INTO Invoices (id, order_id, invoice_date, total_cost) VALUES
(1, 1, '2023-08-11', 150.00),
(2, 2, '2023-08-16', 75.00);
