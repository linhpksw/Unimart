CREATE TABLE users
(
    id         VARCHAR(255) PRIMARY KEY,
    about      TEXT,
    email      VARCHAR(255) UNIQUE NOT NULL,
    phone      VARCHAR(10) UNIQUE,
    password   VARCHAR(255)        NOT NULL,
    role       VARCHAR(10),
    name       VARCHAR(100),
    gender     VARCHAR(10),
    dob        DATE,
    address    TEXT,
    is_banned  BOOLEAN   DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE remembers
(
    id              INT AUTO_INCREMENT PRIMARY KEY,
    user_id         VARCHAR(255),
    token           VARCHAR(255) UNIQUE NOT NULL,
    expiration_date DATETIME            NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
