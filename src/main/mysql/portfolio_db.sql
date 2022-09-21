create database portfolio ;

use portfolio ;

create table user (id int auto_increment , username varchar(255) not null, pass varchar(255) not null, email varchar(255) not null unique, primary key(id,email) );

create table about ( id int primary key auto_increment, name_ varchar(255) , natonality varchar(255) , about_me text ,positoions text , user_id int ,foreign key (user_id) references user(id) );

create table contact_info ( id int primary key auto_increment , address text , phone varchar(10) , email varchar(255) , user_id int , foreign key (user_id) references user(id) );
 
create table categories(id int auto_increment primary key , category_name varchar(255));

create table skills (id int primary key auto_increment , skill text , user_id int , category int , foreign key (category) references categories(id) ,foreign key (user_id) references user(id) );

create table messages (id int primary key auto_increment , name varchar(255) , email varchar(255) , query text , date_ timestamp , user_id int , foreign key (user_id) references user(id) );

create table security_questions(id int auto_increment primary key , city varchar(255) , nickname varchar(255) , DOB varchar(20) ,  user_id int ,foreign key (user_id) references user(id) );