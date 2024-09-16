-- Create a Circulation_Management Database
CREATE DATABASE Circulation_Management;

-- To access the DB
USE Circulation_Management;

-- Create Checkouts Table in Circulation_Management Database
CREATE TABLE Checkouts (
    id INT PRIMARY KEY,
    book_id INT,
    patron_id INT,
    checkout_date DATE,
    due_date DATE,
    FOREIGN KEY (book_id) REFERENCES book_management.books(id),
    FOREIGN KEY (patron_id) REFERENCES patron_management.Patrons(id)
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
    FOREIGN KEY (book_id) REFERENCES book_management.Books(id),
    FOREIGN KEY (patron_id) REFERENCES patron_management.Patrons(id)
);

-- Create Waitlists Table in Circulation_Management Database
CREATE TABLE Waitlists (
    id INT PRIMARY KEY,
    book_id INT,
    patron_id INT,
    waitlist_date DATE,
    FOREIGN KEY (book_id) REFERENCES book_management.Books(id),
    FOREIGN KEY (patron_id) REFERENCES patron_management.Patrons(id)
);

-- Create Checkout_History Table in Circulation_Management Database
CREATE TABLE Checkout_History (
    id INT PRIMARY KEY,
    book_id INT,
    patron_id INT,
    checkout_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES book_management.Books(id),
    FOREIGN KEY (patron_id) REFERENCES patron_management.Patrons(id)
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
