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
select upper(DeveloperName) from Developers;
select lower(DeveloperName) from Developers;
select length(AppName) from apps;
select CategoryName,length(CategoryName) from categories;
select current_date(), current_time();
select round(Rating,0) from apps;
select AppName,substring(AppName,0,5) from apps;
select concat(DeveloperName," ",Country)from Developers;
select round(Rating,2) from apps;
select ceil(Price) from apps;
select FoundedYear from Developers;
select convert(Downloads,char) as Downloads_char from apps;
select upper(AppName),Rating from apps;
select substring(CategoryName,0,3) from categories;
select ABS(Price-200) from apps;
select DeveloperName,length(DeveloperName) from Developers;
select current_date(),current_timestamp();
select cast(Downloads as char) from apps;
select convert(Downloads,char) from apps;