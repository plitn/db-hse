CREATE DATABASE library;

CREATE TABLE Reader
(
    id         BIGSERIAL PRIMARY KEY,
    lastname   VARCHAR(200),
    firstname  VARCHAR(200),
    address    VARCHAR(200),
    birth_date DATE
);

CREATE TABLE Publisher
(
    pub_name    VARCHAR(200) PRIMARY KEY,
    pub_address VARCHAR(200)
);

CREATE TABLE Book
(
    ISBN      BIGINT PRIMARY KEY,
    title     VARCHAR(200),
    author    VARCHAR(200),
    pages_num INTEGER,
    pub_year  INTEGER,
    pub_name  VARCHAR(200) REFERENCES Publisher (pub_name)
);

CREATE TABLE Category
(
    category_name VARCHAR(200) PRIMARY KEY,
    parent_cat    VARCHAR(200) REFERENCES Category (category_name)
);

CREATE TABLE Copy
(
    ISBN           BIGINT REFERENCES Book (ISBN),
    copy_number    BIGSERIAL PRIMARY KEY,
    shelf_position VARCHAR(200)
);

CREATE TABLE Borrowing
(
    reader_nr   BIGINT REFERENCES Reader (id),
    ISBN        BIGINT REFERENCES Book (ISBN),
    copy_number BIGINT REFERENCES Copy (copy_number),
    return_date DATE
);

CREATE TABLE BookCat
(
    ISBN          BIGINT REFERENCES Book (ISBN),
    category_name VARCHAR(200) REFERENCES Category (category_name)
);