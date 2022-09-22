DROP DATABASE IF EXISTS portfolio;
CREATE DATABASE IF NOT EXISTS portfolio ;
USE portfolio ;

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS about;
DROP TABLE IF EXISTS contact_info;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS security_questions;

CREATE TABLE IF NOT EXISTS user (
	id INT AUTO_INCREMENT , 
    username VARCHAR(255) NOT NULL, 
    pass varchar(255) NOT NULL, 
    email varchar(255) NOT NULL UNIQUE, 
    PRIMARY KEY(id) 
);

INSERT INTO user VALUES 
	(1, "Test User", "admin", "admin@gmail.com");
    
CREATE TABLE IF NOT EXISTS about (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    name_ VARCHAR(255),
    nationality VARCHAR(255), 
    about_me TEXT,
    positions TEXT, 
    projects INT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

select * from about;

INSERT INTO about VALUES (1, "Test User", "INDIA", "I AM Test User", "DEVELOPER",2, 1);

CREATE TABLE IF NOT EXISTS contact_info (
	id INT PRIMARY KEY AUTO_INCREMENT,
    address TEXT,
    phone VARCHAR(255),
    email VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO contact_info VALUES (1, "Some Address", "1234567890", "admin@gmail.com", 1);
 
CREATE TABLE IF NOT EXISTS categories(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	category_name VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO categories VALUES(1, 'Language Siklls',1);

CREATE TABLE IF NOT EXISTS skills (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    skill TEXT,
    user_id INT,
    category INT,
    level int ,
    FOREIGN KEY (category) REFERENCES categories(id) ,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO skills VALUES (1, "JSP SERVLET", 1, 2,75);

select * from categories ;
SELECT s.* , c.category_name from skills s , categories c where s.user_id = 1 and s.user_id = c.user_id and s.category = c.id ;
CREATE TABLE IF NOT EXISTS messages (
	id int primary key auto_increment,
    name_ VARCHAR(255),
    email VARCHAR(255),
    message TEXT,
    date_ VARCHAR(20),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO messages VALUES (1, "user1", "user1@gmail.com", "Hi i am user 1", "01/04/2022", 1);
INSERT INTO messages VALUES (2, "user2", "user2@gmail.com", "Hi i am user 2", "01/09/2022", 1);
INSERT INTO messages VALUES (3, "user3", "user3@gmail.com", "Hi i am user 3", "04/05/2022", 1);
INSERT INTO messages VALUES (4, "user4", "user4@gmail.com", "Hi i am user 4", "01/01/2022", 1);

CREATE TABLE IF NOT EXISTS security_questions(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    city VARCHAR(255),
    nickname VARCHAR(255),
    DOB VARCHAR(20),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO security_questions VALUES(1, "IND", "admin", "1999-01-01", 1);