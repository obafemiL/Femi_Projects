CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    bio TEXT,
    photo_url VARCHAR(200)
);

CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT NOT NULL,
    genre_id INT NOT NULL,
    published_date DATE,
    read_status BOOLEAN DEFAULT FALSE,
    cover_url VARCHAR(200),
    description TEXT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE borrow_history (
    borrow_id INT PRIMARY KEY,
    book_id INT NOT NULL,
    borrower_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id)
        REFERENCES books (book_id),
    FOREIGN KEY (borrower_id)
        REFERENCES borrowers (borrower_id)
);

select * from books