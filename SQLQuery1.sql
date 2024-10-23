create database SocialNetworkDB


CREATE TABLE [User] (
    id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);


CREATE TABLE Posts (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES [User](id) ON DELETE CASCADE
);


CREATE TABLE Favourites (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES [User](id) ON DELETE NO ACTION,
    FOREIGN KEY (post_id) REFERENCES Posts(id) ON DELETE CASCADE
);


CREATE TABLE Reposts (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    quoted BIT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES [User](id) ON DELETE NO ACTION,
    FOREIGN KEY (post_id) REFERENCES Posts(id) ON DELETE NO ACTION
);


CREATE TABLE Followers (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    follower_id INT NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES [User](id) ON DELETE NO ACTION,
    FOREIGN KEY (follower_id) REFERENCES [User](id) ON DELETE NO ACTION
);


INSERT INTO [User] (username, email, password, name) VALUES
('Pepe.don', 'ppedon@hotmail.com', '123##', 'Pepe'),
('Leo_mendez', 'Leom@gmail.com', 'colorojo123!', 'Leo');


INSERT INTO Posts (user_id, content) VALUES
(1, 'Hola'),
(2, 'Mi primer posteo');

INSERT INTO Favourites (user_id, post_id) VALUES
(1, 2),
(2, 1);


INSERT INTO Reposts (user_id, post_id, quoted) VALUES
(1, 2, 0),
(2, 1, 1);

INSERT INTO Followers (user_id, follower_id) VALUES
(1, 2),
(2, 1);


