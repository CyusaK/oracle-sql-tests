# oracle-sql-tests
## Description of SQL Commands
Creating Tables:

Authors Table:

### sql

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100)
);
Purpose: This command creates a table named Authors with two columns: AuthorID, which is the primary key, and Name, which stores the author's name.
Books Table:

### sql

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
Purpose: This command creates the Books table. It has three columns: BookID (primary key), Title, and AuthorID. The AuthorID is a foreign key that establishes a relationship with the Authors table, allowing each book to be associated with an author.
Members Table:

### sql

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100)
);
Purpose: This command creates the Members table, which contains member information. It includes MemberID (primary key) and Name.
Loans Table:

### sql

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
Purpose: This command creates the Loans table, which tracks book loans. It has LoanID (primary key), BookID, MemberID, and LoanDate. Both BookID and MemberID are foreign keys that link to their respective tables, establishing relationships for tracking which member has loaned which book.
Inserting Data:

Insert Author:

### sql

INSERT INTO Authors (AuthorID, Name) VALUES (1, 'George Orwell');
Purpose: This command adds a new author, George Orwell, with an AuthorID of 1 to the Authors table.
Insert Book:

### sql

INSERT INTO Books (BookID, Title, AuthorID) VALUES (1, '1984', 1);
Purpose: This command inserts a book titled "1984" into the Books table, linking it to the author with AuthorID 1.
Insert Member:

### sql

INSERT INTO Members (MemberID, Name) VALUES (1, 'John Doe');
Purpose: This command adds a new member, John Doe, with a MemberID of 1 to the Members table.
Insert Loan:

### sql

INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate) VALUES (1, 1, 1, SYSDATE);
Purpose: This command creates a loan record for the book with BookID 1 (1984) loaned to member with MemberID 1 (John Doe) on the current date.
Updating Data:

Update Member Name:
sql
Copy code
UPDATE Members SET Name = 'Jane Doe' WHERE MemberID = 1;
Purpose: This command changes the name of the member with MemberID 1 from John Doe to Jane Doe.
Deleting Data:

Delete Loan Record:

### sql

DELETE FROM Loans WHERE LoanID = 1;
Purpose: This command removes the loan record with LoanID 1 from the Loans table, indicating that the loan is no longer active.
Performing Joins:

Join Query to Retrieve Loan Information:
### sql

SELECT Members.Name, Books.Title, Loans.LoanDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID;
Purpose: This query retrieves the names of members along with the titles of the books they have loaned and the loan dates. It uses inner joins to connect the Loans, Members, and Books tables based on their respective IDs.
Data Definition Language (DDL), Data Manipulation Language (DML), Data Control Language (DCL), Transaction Control Language (TCL):

DDL: The commands to create tables (e.g., CREATE TABLE) define the structure of the database./n
DML: Commands like INSERT, UPDATE, and DELETE are used to manipulate data in the tables./n
DCL: Commands like GRANT control permissions for users to access or modify data./n
TCL: Commands like COMMIT ensure that transactions are saved permanently to the database./n

## Summary

The SQL commands outlined above establish a basic library management system, allowing for the creation of related tables, the manipulation of data (adding, updating, deleting), and the ability to query related information through joins. Each command is designed to fulfill specific functions within the database, ensuring the system can efficiently manage books, authors, members, and loans.



