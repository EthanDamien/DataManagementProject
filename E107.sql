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
	Type int
);
/*1 is Admin, 2 is Customer, 3 is CustomerSupport

/*--------------------------------------------------------------
Login as Customer, Admin, and Customer Support
---------------------------------------------------------------*/

insert into users values
(1,'Chicken','poop1','2021-01-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Chickenpoop@gmail.com', 3),
(2,'Ethan','poop2','2021-02-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Chickenpoop@gmail.com', 1),
(3,'David','poop3','2021-03-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Chickenpoop@gmail.com', 2),
(4,'Kevin','poop4','2021-04-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Chickenpoop@gmail.com', 2),
(5,'Rachael','poop5','2021-05-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Chickenpoop@gmail.com', 1),
(6,'AJ','poop6','2021-06-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Chickenpoop@gmail.com', 3);




