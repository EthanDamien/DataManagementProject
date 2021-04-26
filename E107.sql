DROP DATABASE IF EXISTS `E107`;
CREATE DATABASE  IF NOT EXISTS `E107` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `E107`;

create table users(
	UserID int not null auto_increment primary key,
	Username varchar(30) DEFAULT '' not null,
	Password varchar(30) DEFAULT '' not null,
	AccountCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
	Address varchar(50) DEFAULT '' null,
	PhoneNum varchar(15) DEFAULT '' not null,
	Email varchar(50) DEFAULT '' not null,
	UserType int DEFAULT '3' not null
);


create table auction(
	AuctionID int not null auto_increment primary key,
	UserID int not null,
	AuctionEnd datetime not null,
	AuctionPrice double not null,
	ReservePrice double not null,
	BidIncrement double not null, 
	ItemName varchar(30) not null,
	ProductDesc varchar(500) not null,
	Category varchar(100) not null,
	Subcategory varchar(100) not null,
	WinnerID int not null,
	AuctionCreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
	foreign key (UserID) REFERENCES users(UserID) ON DELETE CASCADE
);

create table bid(
	BidID int not null auto_increment primary key,
	AuctionID int,
	UserID int not null,
    BidAmount double not null,
	BidCreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
	foreign key (UserID) REFERENCES users(UserID) ON DELETE CASCADE, 
	foreign key (AuctionID) REFERENCES auction(AuctionID) ON DELETE CASCADE
);

create table questions(
	QuestionID int not null auto_increment primary key,
	UserID int not null,
	Question varchar(100) not null, 
	Description varchar(500) not null,
	QuestionCreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
	Answered int not null,
	Response varchar(500) not null DEFAULT '', 
	foreign key (UserID) REFERENCES users(UserID) ON DELETE CASCADE
);


create table participating(
	UserID int not null,
    AuctionID int not null,
    NotificationStatus tinyint,
	autoAmount double,
	increment double,
    foreign key (UserID) references users(UserID) ON DELETE CASCADE,
    foreign key (AuctionID) references auction(AuctionID) ON DELETE CASCADE
);

create table interested(
	UserID int not null,
	interestName varchar(100) not null, 
	lastChecked DATETIME not null,
	foreign key (UserID) references users(UserID) ON DELETE CASCADE
);

insert into users values
(UserID,'Username','Password','2021-01-01', 'Some place in America', '732-111-1111', 'UsernamePassword@gmail.com', 1),
(UserID,'Ethan','12','2021-02-01',  'Some place in America', '732-111-1111', 'Ethan12@gmail.com', 1),
(UserID,'Rachael','56','2021-05-01',  'Some place in America', '732-111-1111', 'Rachael56@gmail.com', 1),
(UserID,'David','23','2021-03-01', 'Some place in America', '732-111-1111', 'David23@gmail.com', 2),
(UserID,'Cust1','1','2021-03-01', 'Some place in America', '732-111-1111', 'cust1@gmail.com', 2),
(UserID,'Cust2','2','2021-03-01', 'Some place in America', '732-111-1111', 'cust2@gmail.com', 2),
(UserID,'Kevin','34','2021-04-01',  'Some place in America', '732-111-1111', 'Kevin45@gmail.com', 3),
(UserID,'AJ','11','2021-06-01',  'Some place in America', '732-111-1111', 'AJ67@gmail.com', 3),
(UserID,'James','11','2021-06-01',  'Some place in America', '732-111-1111', 'James@gmail.com', 3),
(UserID,'Monkey','11','2021-06-01',  'Some place in America', '732-111-1111', 'Monkey@gmail.com', 3),
(UserID,'Will','11','2021-06-01',  'Some place in America', '732-111-1111', 'Will@gmail.com', 3),
(UserID,'Mark','11','2021-06-01',  'Some place in America', '732-111-1111', 'Mark@gmail.com', 3);


insert into auction values
(AuctionID, 4, '2021-05-25 11:55:00', 250, 300, 10, "Dior Pants", "High Quality Dior Pants", "clothes", "pants" , -1, '2021-01-13' ),
(AuctionID, 6, '2021-06-25 11:55:00', 350, 400, 10, "Gucci Pants", "Best in class Gucci Pants", "clothes", "pants" , -1, '2021-02-13' ),
(AuctionID, 6, '2021-04-25 11:55:00', 40, 50, 3, "Nike shoes", "Nike Shoes Fly Knit", "shoes", "running" , -1, '2021-01-13' ),
(AuctionID, 7, '2021-04-20 4:25:00', 350, 300, 10, "Ipad 10", "Iphone 10 maxed out", "electronics", "tablet" , 4, '2021-01-29' ),
(AuctionID, 7, '2021-03-20 4:25:00', 500, 300, 10, "Ipad 20", "Iphone 10 maxed out", "electronics", "tablet" , 4, '2021-01-29' ),
(AuctionID, 7, '2021-02-20 4:25:00', 600, 300, 10, "Ipad 30", "Iphone 10 maxed out", "electronics", "tablet" , 4, '2021-01-29' ),
(AuctionID, 7, '2021-05-14 4:50:00', 350, 400, 10, "Fossil Watch", "Fossil G710", "jewelery", "watch" , -1, '2021-05-13' ),
(AuctionID, 5, '2021-05-15 5:50:00', 40, 50, 3, "Diamond Ring", "Top Notch Real Diamong Ring Made By Gucci", "jewelery", "ring" , -1, '2021-03-09' ),
(AuctionID, 6, '2021-05-17 6:50:00', 30, 40, 2, "Dell Optiplex", "Dell Optiplex with Intel 1000", "electronics", "computer" , -1, '2021-01-03' ),
(AuctionID, 4, '2021-05-19 7:50:00', 50, 50, 4, "Dell XPS", "Dell XPS with Core i7", "electronics", "laptop" , -1, '2021-03-13' ),
(AuctionID, 10, '2021-05-30 8:50:00', 45, 45, 3, "Cuban Link Chain", "Iced out Cuban Link Chain made in Cuba", "jewelry", "necklace" , -1, '2021-04-01' ),
(AuctionID, 10, '2021-05-30 8:50:00', 45, 45, 3, "Adidas Hiking Shoes", "Adidas NMD", "shoes", "hiking" , -1, '2021-04-01' ),
(AuctionID, 10, '2021-05-30 8:50:00', 45, 45, 3, "Puma Workout Shoes", "Puma Shoe", "shoes", "workout" , -1, '2021-04-01' ),
(AuctionID, 10, '2021-05-30 8:50:00', 45, 45, 3, "Sketchers Casual Shoes", "Foam Sketchers", "shoes", "casual" , -1, '2021-04-01' ),
(AuctionID, 10, '2021-05-30 8:50:00', 45, 45, 3, "Nike Casual Tee", "Nike Casual Tee", "clothes", "tees" , -1, '2021-04-01' ),
(AuctionID, 10, '2021-05-30 8:50:00', 45, 45, 3, "Fear of God Essential Shorts", "Fear of God Essential Shorts", "clothes", "shorts" , -1, '2021-04-01' ),
(AuctionID, 4, '2021-04-25 11:55:00', 250, 300, 10, "Louis Vuitton x Supreme Hoodie", "High Quality Louis Vuitton x Supreme Hoodie", "clothes", "hoodies" , -1, '2021-01-13' );

insert into bid values
(BidID, 1, 10, 350, '2021-01-13 11:55:00'),
(BidID, 1, 9, 400, '2021-02-14 11:55:00'),
(BidID, 1, 8, 500, '2021-03-15 11:55:00'),
(BidID, 2, 10, 360, '2021-01-16 11:55:00'),
(BidID, 2, 9, 460, '2021-02-17 11:55:00'),
(BidID, 2, 8, 560, '2021-03-18 11:55:00');

insert into questions values
(QuestionID, 4, 'How do I use this website?', 'I am having trouble navigating.', '2021-01-13', 0, ''),
(QuestionID, 4, 'How do I log out?', 'I am having trouble loggig out.', '2021-01-13', 0, ''),
(QuestionID, 4, 'How do I sign in?', 'I am having trouble signing in?', '2021-01-13', 0, ''),
(QuestionID, 4, 'How do I know I Won?', 'I am having trouble with win.', '2021-01-13', 0, ''),
(QuestionID, 6, 'Where is the create auction button?', 'Descript1', '2021-01-13', 1, 'The create auction button is allowed for only users that created an account.'),
(QuestionID, 9, 'What do I have to do to win a bid?', 'Descript2', '2021-01-13', 1, 'Be the max bidder and bid higher than the hidden reserve price'),
(QuestionID, 8, 'Can this website sell more items?', 'Descript3', '2021-01-13', 1, 'We are currently Working on create more items'),
(QuestionID, 7, 'What does it mean to auto increment a bid?', 'Descript4', '2021-01-13', 1, 'Auto Incrementing is adding a incrementer to your bid incase you are out bidded.'),
(QuestionID, 9, 'How can I set my interest?', 'Descript5' , '2021-01-13', 1, 'Go to My Profile and add interest in the side bar.'),
(QuestionID, 10, 'Do I need to make an account to bid?', 'Descript6', '2021-01-13', 1, 'The create auction button is allowed for only users that created an account.');






insert into participating values (4,1,0,0,1) on duplicate key update UserID = 4, AuctionID = 1;


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

-- Order and get auctions that are not expired
-- SELECT * FROM auction WHERE CURRENT_TIMESTAMP < AuctionEnd order by AuctionEnd ASC;