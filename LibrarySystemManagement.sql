
DROP DATABASE IF EXISTS LibraryManagementSystem;
CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;
CREATE TABLE Publishers (
	ID INT auto_increment PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(200) NOT NULL,
	Contact VARCHAR(15) NOT NULL
);

CREATE TABLE Books (
	ID INT auto_increment PRIMARY KEY,
	Title VARCHAR(100) NOT NULL,
	PublisherID VARCHAR(100) REFERENCES Publishers(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Branches (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(100) NOT NULL,
	Address VARCHAR(200) NOT NULL
);

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(100) NOT NULL,
	Address VARCHAR(200) NOT NULL,
	CONTACT VARCHAR(15) NOT NULL
)AUTO_INCREMENT = 100;

CREATE TABLE Loans (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	BookID INT REFERENCES Books(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT REFERENCES Branches(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT REFERENCES tbl_borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(50) NOT NULL,
	DueDate VARCHAR(50) NOT NULL
);
 
CREATE TABLE Copies (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	BookID INT REFERENCES Books(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT REFERENCES Branches(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	TotalNoOfCopies INT NOT NULL
);

CREATE TABLE Authors (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	BookID INT REFERENCES Books(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	Name VARCHAR(50) NOT NULL
);


INSERT INTO Publishers
	(Name, Address, CONTACT)
VALUES
	('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Chilton Books','Not Available','Not Available'),
	('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
	('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
	('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
	('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
	('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
	('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
	('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
	('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
	('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
	('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
	('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')		
;

SELECT * FROM Publishers;

INSERT INTO Books
	(Title, PublisherID)
VALUES 
	('The Name of the Wind', 1),
	('It', 2),
	('The Green Mile', 3),
	('Dune', 4),
	('The Hobbit', 5),
	('Eragon', 6),
	('A Wise Mans Fear', 1),
	('Harry Potter and the Philosophers Stone', 7),
	('Hard Boiled Wonderland and The End of the World', 8),
	('The Giving Tree', 9),
	('The Hitchhikers Guide to the Galaxy', 10),
	('Brave New World', 11),
	('The Princess Bride', 12),
	('Fight Club', 13),
	('Holes', 14),
	('Harry Potter and the Chamber of Secrets', 7),
	('Harry Potter and the Prisoner of Azkaban', 7),
	('The Fellowship of the Ring', 5),
	('A Game of Thrones', 15),
	('The Lost Tribe', 16);

SELECT * FROM Books;

INSERT INTO Branches
	(Name, Address)
VALUES
	('Sharpstown','32 Corner Road, New York, NY 10012'),
	('Central','491 3rd Street, New York, NY 10014'),
	('Saline','40 State Street, Saline, MI 48176'),
	('Ann Arbor','101 South University, Ann Arbor, MI 48104');

SELECT * FROM Branches;

INSERT INTO Borrower
	(Name, Address, Contact)
VALUES
	('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
	('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
	('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
	('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
	('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
	('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
	('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
	('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');

SELECT * FROM Borrower;

INSERT INTO Loans
	(BookID, BranchID, CardNo, DateOut, DueDate)
VALUES
	('1','1','100','1/1/18','2/2/18'),
	('2','1','100','1/1/18','2/2/18'),
	('3','1','100','1/1/18','2/2/18'),
	('4','1','100','1/1/18','2/2/18'),
	('5','1','102','1/3/18','2/3/18'),
	('6','1','102','1/3/18','2/3/18'),
	('7','1','102','1/3/18','2/3/18'),
	('8','1','102','1/3/18','2/3/18'),
	('9','1','102','1/3/18','2/3/18'),
	('11','1','102','1/3/18','2/3/18'),
	('12','2','105','12/12/17','1/12/18'),
	('10','2','105','12/12/17','1/12/17'),
	('20','2','105','2/3/18','3/3/18'),
	('18','2','105','1/5/18','2/5/18'),
	('19','2','105','1/5/18','2/5/18'),
	('19','2','100','1/3/18','2/3/18'),
	('11','2','106','1/7/18','2/7/18'),
	('1','2','106','1/7/18','2/7/18'),
	('2','2','100','1/7/18','2/7/18'),
	('3','2','100','1/7/18','2/7/18'),
	('5','2','105','12/12/17','1/12/18'),
	('4','3','103','1/9/18','2/9/18'),
	('7','3','102','1/3/18','2/3/18'),
	('17','3','102','1/3/18','2/3/18'),
	('16','3','104','1/3/18','2/3/18'),
	('15','3','104','1/3/18','2/3/18'),
	('15','3','107','1/3/18','2/3/18'),
	('14','3','104','1/3/18','2/3/18'),
	('13','3','107','1/3/18','2/3/18'),
	('13','3','102','1/3/18','2/3/18'),
	('19','3','102','12/12/17','1/12/18'),
	('20','4','103','1/3/18','2/3/18'),
	('1','4','102','1/12/18','2/12/18'),
	('3','4','107','1/3/18','2/3/18'),
	('18','4','107','1/3/18','2/3/18'),
	('12','4','102','1/4/18','2/4/18'),
	('11','4','103','1/15/18','2/15/18'),
	('9','4','103','1/15/18','2/15/18'),
	('7','4','107','1/1/18','2/2/18'),
	('4','4','103','1/1/18','2/2/18'),
	('1','4','103','2/2/17','3/2/18'),
	('20','4','103','1/3/18','2/3/18'),
	('1','4','102','1/12/18','2/12/18'),
	('3','4','107','1/13/18','2/13/18'),
	('18','4','107','1/13/18','2/13/18'),
	('12','4','102','1/14/18','2/14/18'),
	('11','4','103','1/15/18','2/15/18'),
	('9','4','103','1/15/18','2/15/18'),
	('7','4','107','1/19/18','2/19/18'),
	('4','4','103','1/19/18','2/19/18'),
	('1','4','103','1/22/18','2/22/18');

	
SELECT * FROM Loans;

INSERT INTO Copies
	(BookID, BranchID, TotalNoOfCopies)
	VALUES
	('1','1','5'),
	('2','1','5'),
	('3','1','5'),
	('4','1','5'),
	('5','1','5'),
	('6','1','5'),
	('7','1','5'),
	('8','1','5'),
	('9','1','5'),
	('10','1','5'),
	('11','1','5'),
	('12','1','5'),
	('13','1','5'),
	('14','1','5'),
	('15','1','5'),
	('16','1','5'),
	('17','1','5'),
	('18','1','5'),
	('19','1','5'),
	('20','1','5'),
	('1','2','5'),
	('2','2','5'),
	('3','2','5'),
	('4','2','5'),
	('5','2','5'),
	('6','2','5'),
	('7','2','5'),
	('8','2','5'),
	('9','2','5'),
	('10','2','5'),
	('11','2','5'),
	('12','2','5'),
	('13','2','5'),
	('14','2','5'),
	('15','2','5'),
	('16','2','5'),
	('17','2','5'),
	('18','2','5'),
	('19','2','5'),
	('20','2','5'),
	('1','3','5'),
	('2','3','5'),
	('3','3','5'),
	('4','3','5'),
	('5','3','5'),
	('6','3','5'),
	('7','3','5'),
	('8','3','5'),
	('9','3','5'),
	('10','3','5'),
	('11','3','5'),
	('12','3','5'),
	('13','3','5'),
	('14','3','5'),
	('15','3','5'),
	('16','3','5'),
	('17','3','5'),
	('18','3','5'),
	('19','3','5'),
	('20','3','5'),
	('1','4','5'),
	('2','4','5'),
	('3','4','5'),
	('4','4','5'),
	('5','4','5'),
	('6','4','5'),
	('7','4','5'),
	('8','4','5'),
	('9','4','5'),
	('10','4','5'),
	('11','4','5'),
	('12','4','5'),
	('13','4','5'),
	('14','4','5'),
	('15','4','5'),
	('16','4','5'),
	('17','4','5'),
	('18','4','5'),
	('19','4','5'),
	('20','4','5');

SELECT * FROM Copies;


INSERT INTO Authors
	(BookID, Name)
	VALUES
	('1','Patrick Rothfuss'),
	('2','Stephen King'),
	('3','Stephen King'),
	('4','Frank Herbert'),
	('5','J.R.R. Tolkien'),
	('6','Christopher Paolini'),
	('6','Patrick Rothfuss'),
	('8','J.K. Rowling'),
	('9','Haruki Murakami'),
	('10','Shel Silverstein'),
	('11','Douglas Adams'),
	('12','Aldous Huxley'),
	('13','William Goldman'),
	('14','Chuck Palahniuk'),
	('15','Louis Sachar'),
	('16','J.K. Rowling'),
	('17','J.K. Rowling'),
	('18','J.R.R. Tolkien'),
	('19','George R.R. Martin'),
	('20','Mark Lee');

SELECT * FROM Authors;
/* ==================================== STORED PROCEDURE QUERY QUESTIONS =================================== */
/* #1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */
SELECT c.BranchID , br.Name `Branch Name`,
c.totalNoOfCopies `Number of Copies`,
b.Title AS `Book Title`
FROM Copies c
INNER JOIN Books b ON c.BookID = b.ID
INNER JOIN Branches br ON c.BranchID = br.ID
WHERE b.Title = 'The Lost Tribe' AND br.Name = 'Sharpstown';



/* #2- How many copies of the book titled "The Lost Tribe" are owned by each library branch? */

SELECT c.BranchID , br.Name `Branch Name`,
c.totalNoOfCopies `Number of Copies`,
b.Title AS `Book Title`
FROM Copies c
INNER JOIN Books b ON c.BookID = b.ID
INNER JOIN Branches br ON c.BranchID = br.ID
WHERE b.Title = 'The Lost Tribe';

/* #3- Retrieve the names of all borrowers who do not have any books checked out. */
SELECT b.Name FROM Borrower b
WHERE NOT EXISTS
(SELECT * FROM Loans l
WHERE l.CardNo = b.CardNo);

/* #4- For each book that is loaned out from the "Sharpstown" branch and whose DueDate is '2/3/18', retrieve the book title, the borrower's name, and the borrower's address.  */

SELECT br.Name AS `Branch Name`,  b.Title `Book Name`,
bw.Name AS `Borrower Name`, bw.Address `Borrower Address`, DateOut , DueDate
FROM Loans l
INNER JOIN Books b ON l.BookID = b.ID
INNER JOIN Borrower bw ON l.CardNo = bw.CardNo
INNER JOIN Branches br ON l.BranchID = br.ID
WHERE DueDate= '2/3/18' AND br.Name = 'Sharpstown';


/* #5- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */

SELECT  b.Name AS 'Branch Name', COUNT(l.BranchID) 'Total Loans'
FROM Loans l
INNER JOIN Branches b ON l.BranchID = b.ID
GROUP BY b.Name;


/* #6- Retrieve the names, addresses, and number of books checked out for all borrowers who have more 
	   than five books checked out. */

SELECT b.Name `Borrower Name`, b.Address `Borrower Address`,
COUNT(b.Name) `Books Checked Out`
FROM Loans l
INNER JOIN Borrower b ON l.CardNo = b.CardNo
GROUP BY b.Name, b.Address
HAVING COUNT(b.Name) >= 5;

/* 7 - For each book authored by "Stephen King", retrieve the title and the number of copies owned by the 
	  library branch whose name is "Central". */

SELECT d.Name AS `Branch Name`, b.Title, c.totalNoOfCopies AS `Number of Copies`
FROM Authors a
INNER JOIN Books b ON a.BookID = b.ID
INNER JOIN Copies c ON a.BookID = c.BookID
INNER JOIN Branches d ON c.BranchID = d.ID
WHERE d.Name = 'Central' AND a.Name = 'Stephen King';