-- Create a Library_System Database
CREATE DATABASE Library_System;

-- To access the DB
USE Library_System;


-- Create Books Table in Book_Management Database
CREATE TABLE Books (
    id INT PRIMARY KEY,
	title VARCHAR(255),
    author VARCHAR(255),
    publication_date DATE,
    ISBN VARCHAR(13)
);

-- Create Authors Table in Book_Management Database
CREATE TABLE Authors (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    biography TEXT
);

-- Create Publishers Table in Book_Management Database
CREATE TABLE Publishers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    address TEXT
);

-- Create Genres Table in Book_Management Database
CREATE TABLE Genres (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT
);

-- Create Book_Genres Table in Book_Management Database
CREATE TABLE Book_Genres (
    id INT PRIMARY KEY,
    book_id INT,
    genre_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);

-- Insert into Books
INSERT INTO Books (id, title, author, publication_date, ISBN) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', '1925-04-10', '9780743273565'),
(2, '1984', 'George Orwell', '1949-06-08', '9780451524935');

-- Insert into Authors
INSERT INTO Authors (id, name, biography) VALUES
(1, 'F. Scott Fitzgerald', 'American novelist and short story writer.'),
(2, 'George Orwell', 'English novelist, essayist, journalist and critic.');

-- Insert into Publishers
INSERT INTO Publishers (id, name, address) VALUES
(1, 'Scribner', '123 Publisher St, New York, NY'),
(2, 'Secker & Warburg', '456 Publisher Ave, London, UK');

-- Insert into Genres
INSERT INTO Genres (id, name, description) VALUES
(1, 'Fiction', 'Literary works invented by the imagination.'),
(2, 'Dystopian', 'Depicts an imagined state or society.');

-- Insert into Book_Genres
INSERT INTO Book_Genres (id, book_id, genre_id) VALUES
(1, 1, 1),
(2, 2, 2);


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


-- Create Checkouts Table in Circulation_Management Database
CREATE TABLE Checkouts (
    id INT PRIMARY KEY,
    book_id INT,
    patron_id INT,
    checkout_date DATE,
    due_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (patron_id) REFERENCES Patrons(id)
);

-- Create Returns Table in Circulation_Management Database
CREATE TABLE Returns (
    id INT PRIMARY KEY,
    checkout_id INT,
    return_date DATE,
    FOREIGN KEY (checkout_id) REFERENCES Checkouts(id)
);

-- Create Holds Table in Circulation_Management Database
CREATE TABLE Holds (
    id INT PRIMARY KEY,
    book_id INT,
    patron_id INT,
    hold_date DATE,
    expiration_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (patron_id) REFERENCES Patrons(id)
);

-- Create Waitlists Table in Circulation_Management Database
CREATE TABLE Waitlists (
    id INT PRIMARY KEY,
    book_id INT,
    patron_id INT,
    waitlist_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (patron_id) REFERENCES Patrons(id)
);

-- Create Checkout_History Table in Circulation_Management Database
CREATE TABLE Checkout_History (
    id INT PRIMARY KEY,
    book_id INT,
    patron_id INT,
    checkout_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (patron_id) REFERENCES Patrons(id)
);

-- Insert into Checkouts
INSERT INTO Checkouts (id, book_id, patron_id, checkout_date, due_date) VALUES
(1, 1, 1, '2023-09-01', '2023-09-15'),
(2, 2, 2, '2023-09-05', '2023-09-19');

-- Insert into Returns
INSERT INTO Returns (id, checkout_id, return_date) VALUES
(1, 1, '2023-09-10'),
(2, 2, '2023-09-18');

-- Insert into Holds
INSERT INTO Holds (id, book_id, patron_id, hold_date, expiration_date) VALUES
(1, 1, 2, '2023-09-01', '2023-09-15'),
(2, 2, 1, '2023-09-05', '2023-09-19');

-- Insert into Waitlists
INSERT INTO Waitlists (id, book_id, patron_id, waitlist_date) VALUES
(1, 1, 2, '2023-09-01'),
(2, 2, 1, '2023-09-05');

-- Insert into Checkout_History
INSERT INTO Checkout_History (id, book_id, patron_id, checkout_date, return_date) VALUES
(1, 1, 1, '2023-09-01', '2023-09-10'),
(2, 2, 2, '2023-09-05', '2023-09-18');


-- Create Books Table in Acquisitions_Management Database
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    order_date DATE,
    total_cost DECIMAL(10, 2),
    FOREIGN KEY (book_id) REFERENCES Books(id)
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
    FOREIGN KEY (book_id) REFERENCES Books(id)
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
