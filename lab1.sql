CREATE DATABASE PlaysStoreDB;
USE PlayStoreDB;
CREATE TABLE Developers(
DeveloperID int primary key,
DeveloperName varchar(40),
Country varchar(20),
FoundedYear int 
);
insert into Developers
(DeveloperID,DeveloperName,Country,Foundedyear)
values
 (101,"GoogleLLC","USA",1998),
 (102, "Meta Platforms","USA",2004),
 (103,"Spotify AB","Sweden",2006),
(104,"Canva Pty Ltd","Asutralia",2012),
(105,"BYJU's","India",2011);
 select * from Developers;
 create table Publishers(
 PublisherId int primary key,
 PublisherName varchar(50),
 HeadOffice varchar(30),
 SupportEmail varchar(50)
 );
 insert into Publishers
 (PublisherID,PublisherName,HeadOffice,SupportEmail)
 values
 (201,"Google Play","California","support@google.com"),
 (202,"Samsung Galaxy Store","Seoul","support@samsung.com"),
 (203,"Huawel AppGallery","Shenzhen","support@huawei.com"),
 (204,"Amazon AppStore","Seattle","support@amazon.com");
 select * from Publishers;
 create table Categories(
 CategoryID int primary key,
 CategoryName varchar(40),
 MinimumAge int
 );
 insert into Categories
 (CategoryID,CategoryName,MinimumAge)
 values
 (301,"Education",3),
 (302,"productivity",3),
 (303,"Music",12),
 (304,"Social",13),
 (305,"Gaming",16);
select * from Categories;
create table Apps(
AppID int primary key,
AppName varchar(60),
DevelopeID int,
PublisherID int,
CategoryID int,
Rating decimal(2,1),
Downloads int,
Price decimal(6,2)
);
insert into Apps
(AppID,AppName,DevelopeID,PublisherId,CategoryId,Rating,Downloads,Price)
values
(1001,"Googlr Classroom",101,201,301,4.6,500000000,0),
(1002,"Googke keep",101,201,302,4.5,1000000000,0),
(1003,"Instagram",102,201,304,4.4,500000000,0),
(1004,"Spotify",103,201,303,4.5,1000000000,0),
(1005,"Canva",104,201,302,4.7,500000000,0),
(1006,"BYJU'S Learning",106,201,301,4.3,100000000,299),
(1007,"Candy Crush",102,204,305,4.6,1000000000,0),
(1008,"Temple Run",104,203,305,4.2,500000000,0);
select * from Apps;
desc Apps;
insert into Developers (DeveloperID,DeveloperName,Country,FoundedYear) values (106,"OpenAI","USA",2015);
insert into Categories(CategoryID,CategoryName,MinimumAge) values(306,"Artificial Intellegence",12);
insert into Apps values(1009,"Chatgpt",105,204,306,4.7,100000000,0);
update Apps
set Rating=4.5
where AppID=1008;
delete from Apps
where DevelopeID=105;
update Publishers
set SupportEmail="support@samsungGalaxy.com"
where PublisherID=202;
insert into Apps values(1010,"UnicornDash",107,205,308,4.0,20000000,0);
insert into Apps values(1011,"SortBall",103,204,307,4.5,100000000,0);
update Apps
set Price=199
where AppID=1006;
delete from Categories
where CategoryName="Music";
select * from Developers;
select * from Publishers;
select * from Categories;
select * from Apps;