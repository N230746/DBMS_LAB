use PlayStoreDB;
alter table apps
rename column DevelopeID to DeveloperID;
select a.AppID,a.DeveloperID from apps a
left join developers d on
a.DeveloperID=d.DeveloperID
where a.DeveloperID is not NULL
and d.DeveloperID is NULL;
select a.AppID,a.CategoryID from apps a
left join categories c on
a.CategoryID=c.CategoryID
where a.CategoryID is not NULL
and c.CategoryID is NULL;

delete from apps where AppID=1010;
alter table apps
add constraint fk_Apps_Developers
foreign key(DeveloperID)
references developers(DeveloperID);
alter table apps
add constraint Apps_Publishers
foreign key (PublisherID)
references publishers(PublisherID);
update apps set CategoryId=306 where AppID=1008;
update apps set CategoryID=302 where AppId=1004;
alter table apps
add constraint Apps_Categories
foreign key(CategoryID)
references categories(CategoryID);
select * from apps where Rating>4.5;
select * from apps where Price=0;
select * from apps where CategoryID=305;
select * from apps where Downloads>500000000;
select * from apps where Rating between 4.3 and 4.7;
select * from apps where Price in(0,299);
update apps set AppName='Google Classroom' where AppID=1001;
update apps set AppName='Google Keep' where AppID=1002;
select * from apps where Appname like '%Google%';
select * from apps where Rating >4.0 and Downloads>500000000;
select * from apps where CategoryID=301 or CategoryID=305;
select * from apps where AppName not like 'G%';
select * from apps where Rating<4.5  or Downloads> 1000000000;
select * from apps where AppName like '%a%';
select * from apps where Price between 0 and 300;
select * from apps where PublisherID=201 or PublisherID=204;
insert into apps
(AppID,AppName,DeveloperID,PublisherID,CategoryID,Rating,Downloads,Price)
values
(1009,'Unicorn Dash',999,201,301,4.0,10000,0);
select * from apps where not CategoryID=305;