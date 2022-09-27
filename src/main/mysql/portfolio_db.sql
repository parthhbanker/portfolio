DROP DATABASE IF EXISTS portfolio;
CREATE DATABASE IF NOT EXISTS portfolio ;
USE portfolio ;

DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS about;
DROP TABLE IF EXISTS contact_info;
DROP TABLE IF EXISTS education;
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

-- INSERT INTO user VALUES 
-- 	(1, "Test User", "admin", "admin@gmail.com");
/*INSERT INTO user VALUES 
	(2, "Het Parekh", "admin", "hetparekh21@gmail.com");*/
    
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

-- select * from user ;

-- INSERT INTO about VALUES (1, "Test User", "INDIA", "I AM Test User", "DEVELOPER",2, 1);
-- INSERT INTO about VALUES (2, "Het Parekh", "INDIA", "I AM Het Parekh", "DEVELOPER",3, 2);


CREATE TABLE IF NOT EXISTS contact_info (
	id INT PRIMARY KEY AUTO_INCREMENT,
    address TEXT,
    phone VARCHAR(255),
    email VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- INSERT INTO contact_info VALUES (1, "Some Address", "1234567890", "admin@gmail.com", 1);

-- select * from contact_info;

CREATE TABLE IF NOT EXISTS education (
	id INT PRIMARY KEY AUTO_INCREMENT,
    school TEXT,
    college TEXT,
    degree TEXT,
    start_date TEXT,
    end_date TEXT,
    user_id INT,
    study bool,
    FOREIGN KEY (user_id) REFERENCES user(id)
);	
-- insert into education(school,college,degree,start_date,end_date,user_id,study) values("mehta","gu","bsc","2022-09-04","2022-12-02",1,1);
-- select * from education;

CREATE TABLE IF NOT EXISTS categories(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	category_name VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- INSERT INTO categories VALUES(1, 'Language skills',1);
-- INSERT INTO categories VALUES(2, 'Work skills',1);

-- SELECT * from about where user_id = 2 ;

-- SELECT c.category_name  from categories c where id = 1 ;

CREATE TABLE IF NOT EXISTS skills (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    skill TEXT,
    user_id INT,
    category INT,
    level int ,
    FOREIGN KEY (category) REFERENCES categories(id) ,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- INSERT INTO skills VALUES (1, "JSP SERVLET", 1, 2,75);

CREATE TABLE IF NOT EXISTS messages (
	id int primary key auto_increment,
    name_ VARCHAR(255),
    email VARCHAR(255),
    message TEXT,
    date_ VARCHAR(20),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- INSERT INTO messages VALUES (1, "user1", "user1@gmail.com", "Hi i am user 1", "01/04/2022", 1);
-- INSERT INTO messages VALUES (2, "user2", "user2@gmail.com", "Hi i am user 2", "01/09/2022", 1);
-- INSERT INTO messages VALUES (3, "user3", "user3@gmail.com", "Hi i am user 3", "04/05/2022", 1);
-- INSERT INTO messages VALUES (4, "user4", "user4@gmail.com", "Hi i am user 4", "01/01/2022", 1);

CREATE TABLE IF NOT EXISTS security_questions(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    hobby VARCHAR(255),
    nickname VARCHAR(255),
    DOB VARCHAR(20),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);
-- INSERT INTO security_questions VALUES(1, "IND", "admin", "1999-01-01", 1);



-- Dummy data for table 
/*INSERT INTO user(username, pass, email) VALUES 
	("Test User1", "admin", "admin1@gmail.com"),
    ("Test User2", "admin", "admin2@gmail.com"),
    ("Test User3", "admin", "admin3@gmail.com"),
    ("Test User4", "admin", "admin4@gmail.com");*/
    
/*INSERT INTO about(name_, nationality, about_me, positions, projects, user_id) VALUES 
	("Test User1", "USA", "I AM Test User2", "UI/UX",3, 2),
    ("Test User2", "CANADA", "I AM Test User3", "System Admin",0, 3),
    ("Test User3", "UAE", "I AM Test User4", "HR",4, 4),
    ("Test User4", "UK", "I AM Test User5", "CEO",7, 5);*/
    
/*INSERT INTO contact_info(address, phone, email, user_id) VALUES 
	("Some Address1", "1234567890", "admin1@gmail.com", 2),
    ("Some Address2", "9999999999", "admin2@gmail.com", 3),
    ("Some Address3", "0987654321", "admin3@gmail.com", 4),
    ("Some Address4", "1212121212", "admin4@gmail.com", 5); */
    
    -- select * from user where id = 7;
