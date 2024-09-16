-- Create a Book_Management Database
CREATE DATABASE Book_Management;

-- To access the DB
USE Book_Management;

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
