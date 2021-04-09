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

create table auction(
	AuctionID int primary key,
	UserID int,
	AuctionStart date not null,
	AuctionEnd datetime not null,
	PrivateReservePrice int not null,
	SecretMaxBid int not null,
	BidIncrement int not null, 
	Name varchar(30) not null,
	ProductDesc varchar(500) not null,
	Category varchar(100) not null,
	foreign key (UserID) REFERENCES users(UserID)
);


-- I got rid of the Auctioning and product relationships because I don't think we need it. Since it's a bid thing, theres no need to create individual products since the user is going to set them. But Imma leave it here just in case.

-- create table product(
-- 	ProductID int primary key,
-- 	Name varchar(30) not null,
-- 	ProductDesc varchar(500) not null,
-- 	Category varchar(100) not null,
-- );
-- create table auction(
-- 	AuctionID int primary key,
-- 	AuctionStart datetime not null,
-- 	AuctionEnd datetime not null,
-- 	PrivateReservePrice int not null,
-- 	SecretMaxBid int not null,
-- 	BidIncrement int not null,  
-- );

-- create table auctions(
-- 	AuctionID int primary key,
-- 	ProductID int primary key, 
-- 	foreign key ProductID REFERENCES product(ProductID),
-- 	foreign key AuctionID REFERENCES auction(AuctionID)
-- )

-- -- Holding auction is the right way to say it I think -Ethan
-- create table holding(
-- 	AuctionID int primary key,
-- 	UserID int primary key, 
-- 	foreign key UserID REFERENCES users(User),
-- 	foreign key AuctionID REFERENCES auction(AuctionID)
-- )
/*1 is Admin, 2 is Customer Support, 3 is Customer

/*--------------------------------------------------------------
Login as Customer, Admin, and Customer Support
---------------------------------------------------------------*/

insert into users values
(1,'Username','Password','2021-01-01', '2021-01-01', 'Some place in America', '732-111-1111', 'UsernamePassword@gmail.com', 1),
(2,'Ethan','12','2021-02-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Ethan12@gmail.com', 1),
(3,'David','23','2021-03-01', '2021-01-01', 'Some place in America', '732-111-1111', 'David23@gmail.com', 2),
(4,'Kevin','34','2021-04-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Kevin45@gmail.com', 3),
(5,'Rachael','45','2021-05-01', '2021-01-01', 'Some place in America', '732-111-1111', 'Rachael56@gmail.com', 1),
(6,'AJ','67','2021-06-01', '2021-01-01', 'Some place in America', '732-111-1111', 'AJ67@gmail.com', 3);

-- (AUCTION REFERENCE) 
-- AuctionID int primary key,
-- UserID int,
-- AuctionStart date not null,
-- AuctionEnd datetime not null,
-- PrivateReservePrice int not null,
-- SecretMaxBid int not null,
-- BidIncrement int not null, 
-- Name varchar(30) not null,
-- ProductDesc varchar(500) not null,
-- Category varchar(100) not null,
-- foreign key UserID REFERENCES users(User),

insert into auction values
(1, 2, '2020-01-01', '2020-07-01 05:00:00', 15.00, 0, 1, "Chicken Wing Burger", "Chicken Wing burger is the best burger in the world, fuck you bitch", "food/meat");


select *
from auction a 
join users u 
on u.UserID = a.UserID
group by a.AuctionID;

