DROP DATABASE IF EXISTS `E107`;
CREATE DATABASE  IF NOT EXISTS `E107` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `E107`;

create table users(
	UserID int primary key,
	Username varchar(30),
	Password varchar(30),
	AccountCreated date,
	DOB date,
	Address varchar(50),
	PhoneNum varchar(15),
	Email varchar(50),
	UserType int
);
/*1 is Admin, 2 is Customer Support, 3 is Customer

/*--------------------------------------------------------------
Login as Customer, Admin, and Customer Support
---------------------------------------------------------------*/

insert into users values
(1,'username','Password','2021-01-01', '2021-01-01', 'Some place in America', '732-111-1111', 'UsernamePassword@gmail.com', 1),
(2,'ethan','12','2021-02-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Ethan12@gmail.com', 1),
(3,'david','23','2021-03-01', '2021-01-01', 'Some place in America', '732-111-1111', 'David23@gmail.com', 2),
(4,'kevin','34','2021-04-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Kevin45@gmail.com', 3),
(5,'rachael','45','2021-05-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Rachael56@gmail.com', 1),
(6,'aj','67','2021-06-01', '2021-01-01', 'Some place in America', '732-111-1111', 'AJ67@gmail.com', 3);




