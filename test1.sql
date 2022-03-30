CREATE DATABASE test;
USE test;
CREATE TABLE addresses (
    id INT,
    house_number INT,
    city VARCHAR(20),
    postcode VARCHAR(7)
);
CREATE TABLE people (
    id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id INT
);
CREATE TABLE pets (
    id INT,
    name VARCHAR(20),
    species VARCHAR(20),
    owner_id INT
); 
SHOW TABLES;

-- Adding and removing Primary Key from a table
USE test;
-- Describe command will describe the table with field, datatype, key, null, default and extra
DESCRIBE addresses; 
DESCRIBE people;
-- Adding 
ALTER TABLE addresses
ADD PRIMARY KEY(id);
-- Deleting
ALTER TABLE addresses
DROP PRIMARY KEY;
-- even after dropping a primary key, we can not give null value to a column that was earlier PK
ALTER TABLE people
ADD PRIMARY KEY(id);

-- How to add a foreign key to a table and then remove it
USE test;
DESCRIBE addresses;
DESCRIBE people;

ALTER TABLE people
ADD CONSTRAINT FK_PeopleAddress
FOREIGN KEY (address_id) REFERENCES addresses(id);

ALTER TABLE people
DROP FOREIGN KEY FK_PeopleAddress;

-- Add a unique constraint to a column and remove it

ALTER TABLE pets
ADD CONSTRAINT u_species UNIQUE (species);

ALTER TABLE pets
DROP INDEX u_species;

-- Change a column name(renaming)
SELECT 
    *
FROM
    pets;
ALTER TABLE  pets CHANGE `species` `animal_type` VARCHAR(20); 
ALTER TABLE pets CHANGE `animal_type` `species` VARCHAR(20);

-- Change columns datatype
DESCRIBE addresses;
ALTER TABLE addresses MODIFY city VARCHAR(20);

-- Exercise 1
DESCRIBE addresses;
DESCRIBE pets;
DESCRIBE people;
ALTER TABLE pets
ADD PRIMARY KEY (id);

ALTER TABLE pets
ADD FOREIGN KEY (owner_id) REFERENCES people(id);

ALTER TABLE people
ADD COLUMN email VARCHAR(25);

ALTER TABLE people
ADD CONSTRAINT u_email UNIQUE (email);

ALTER TABLE pets
CHANGE `species` `first_name` VARCHAR(20);

ALTER TABLE addresses
MODIFY postcode CHAR(7);

CREATE TABLE trainer_info (
    trainer_id VARCHAR(20),
    salutation varchar(7),
    trainer_name VARCHAR(30),
    trainer_location VARCHAR(20),
    trainer_track varchar(15),
    trainer_qualification varchar(100),
    trainer_experience int(11),
    trainer_email varchar(100),
    trainer_password varchar(20)
);

create table batch_info (
	batch_id varchar(20),
    batch_owner varchar(30),
    batch_bu_name varchar(30)
);

create table module_info(
	module_id varchar(20),
    module_name varchar(40),
    module_duration int
);

create table associate_info(
	associate_id varchar(20),
    salutation varchar(7),
    associate_name varchar(30),
    associate_location varchar(30),
    associate_track varchar(15),
    associate_qualification varchar(200),
    associate_email varchar(100),
    associate_password varchar(20)
);

create table question(
	question_id varchar(20),
	module_id varchar(20),
	question_text varchar(900)
);

create table associate_status(
	associate_id varchar(20),
    module_id varchar(20),
    start_date varchar(20),
    end_date varchar(20),
    AFeedbackGiven varchar(20),
    TFeedbackGiven varchar(20)
);

create table trainer_feedback (
	trainer_id varchar(20),
    question_id varchar(20),
    batch_id varchar(20),
    module_id varchar(20),
    trainer_rating int
);

create table associate_feedback(
	associate_id varchar(20),
    question_id varchar(20),
    module_id varchar(20),
    associate_rating int
);

create table login_details(
	user_id varchar(20),
    user_password varchar(20)
);