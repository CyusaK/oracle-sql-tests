

# README
## Problem Statement
This database system is designed to manage an e-commerce platform that handles clients, products, and orders. The primary goal is to facilitate transactions between clients and products while maintaining a structured record of orders, clients, and product inventory. The database supports operations such as adding clients, products, and orders, updating client details, and deleting products from inventory.

## SQL Commands Executed
1. Table Creation
Create the example table (initially for demonstration purposes):

### sql 

CREATE TABLE example (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100)
);

### Create the Products table:

### sql

CREATE TABLE Products (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(100),
    Price NUMBER,
    StockQuantity NUMBER
);
Create the Clients table:

### sql

CREATE TABLE Clients (
    ClientID NUMBER PRIMARY KEY,
    ClientName VARCHAR2(100),
    Email VARCHAR2(100),
    PhoneNumber VARCHAR2(15)
);
Create the Orders table with foreign keys:

### sql

CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    OrderDate DATE,
    ClientID NUMBER,
    ProductID NUMBER,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

### 2. Data Insertion

Insert data into Products:

### sql

INSERT INTO Products (ProductID, ProductName, Price, StockQuantity) VALUES (1, 'Laptop', 1000, 50);
INSERT INTO Products (ProductID, ProductName, Price, StockQuantity) VALUES (2, 'Smartphone', 500, 100);
INSERT INTO Products (ProductID, ProductName, Price, StockQuantity) VALUES (3, 'Tablet', 300, 75);

Insert data into Clients:

### sql

INSERT INTO Clients (ClientID, ClientName, Email, PhoneNumber) VALUES (1, 'Alice', 'alice@example.com', '1234567890');
INSERT INTO Clients (ClientID, ClientName, Email, PhoneNumber) VALUES (2, 'Bob', 'bob@example.com', '0987654321');

Insert data into Orders:

### sql

INSERT INTO Orders (OrderID, OrderDate, ClientID, ProductID) VALUES (1, SYSDATE, 1, 1);
INSERT INTO Orders (OrderID, OrderDate, ClientID, ProductID) VALUES (2, SYSDATE, 2, 2);
INSERT INTO Orders (OrderID, OrderDate, ClientID, ProductID) VALUES (3, SYSDATE, 1, 3);
3. Data Manipulation
Update a client's email:

### sql

UPDATE Clients SET Email = 'alice.new@example.com' WHERE ClientID = 1;
Delete a product:

### sql

DELETE FROM Products WHERE ProductID = 3; -- Remove Tablet
4. Data Retrieval
Get Orders with Client and Product details:

### sql

SELECT O.OrderID, O.OrderDate, C.ClientName, P.ProductName
FROM Orders O
JOIN Clients C ON O.ClientID = C.ClientID
JOIN Products P ON O.ProductID = P.ProductID;
Get all Clients with their total Orders:

### sql

SELECT C.ClientName, COUNT(O.OrderID) AS TotalOrders
FROM Clients C
LEFT JOIN Orders O ON C.ClientID = O.ClientID
GROUP BY C.ClientName;
Find all Orders placed by a specific client (e.g., Alice):

### sql

SELECT O.OrderID, O.OrderDate
FROM Orders O
WHERE O.ClientID = (
    SELECT C.ClientID
    FROM Clients C
    WHERE C.ClientName = 'Alice'
);
5. Transactions
Commit Changes:

### sql

COMMIT;
Rollback Example (if needed):


ROLLBACK;
Screenshots
Insert screenshots of your SQL queries, results, and your conceptual diagram here.

Explanations of Results and Transactions
Table Creation: The creation of tables sets up the necessary structure for storing clients, products, and orders, with appropriate relationships through foreign keys.

Data Insertion: Inserting records into the Products and Clients tables allows the platform to start tracking inventory and clients.

### Data Manipulation:

The UPDATE command modified the email of a client, reflecting changes in client information.
The DELETE command removed the 'Tablet' product from the inventory, reflecting a change in available products.
Data Retrieval: Queries were executed to fetch relevant data:

Orders alongside client and product details provide a comprehensive view of transactions.
Aggregating total orders per client helps in analyzing customer engagement.
Transactions: COMMIT finalizes the changes made to the database, while ROLLBACK serves as a safety measure to revert changes if necessary.
