CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
-- Insert Data
INSERT INTO Authors (AuthorID, Name) VALUES (1, 'George Orwell');
INSERT INTO Books (BookID, Title, AuthorID) VALUES (1, '1984', 1);
INSERT INTO Members (MemberID, Name) VALUES (1, 'John Doe');
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate) VALUES (1, 1, 1, SYSDATE);

-- Update Data
UPDATE Members SET Name = 'Jane Doe' WHERE MemberID = 1;

-- Delete Data
DELETE FROM Loans WHERE LoanID = 1;
-- Inner Join to retrieve loans with member names
SELECT Members.Name, Books.Title, Loans.LoanDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID;
