CREATE DATABASE TaskAplication;

USE TaskAplication;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    shared_user_id INT,
    FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (shared_user_id) REFERENCES users(id) ON DELETE CASCADE
)

-- Insert two users

INSERT INTO users (name, email, password) VALUES ('John Doe', 'john@gmail.com', '123456');
INSERT INTO users (name, email, password) VALUES ('Alex Do', 'alex@gmail.com', '1111111');

--Insert todos into todos TABLE
INSERT INTO todos (title, user_id) 
VALUES
('Go for a morning run', 1),
('Work on projecto presentacion', 1),
('Go grocery shopping', 1),
('Read 30 pages of book', 1),
('Ride bike to the park', 1),
('Cook dinner for family', 1),
('Practice yoga', 1),
('Listen to podcast', 1),
('Clean theu house', 1),
('Get 8 hours to sleep', 1);

INSERT INTO shared_todos (todo_id, user_id, shared_with_id) 
VALUES (1, 1, 2);

SELECT todos.*, shared_todos.shared_with_id 
FROM todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = [user_id] OR shared_todos.shared_with_id = [user_id];
```
 