use playstoredb;
set autocommit=0;
update apps
set Rating=4.5
where AppName='Google Keep';
commit;
savepoint app_rating;
update apps
set Price=599
where AppName='BYJU"s Learning';
select * from apps;
rollback;
insert into apps
(AppID,AppName,DeveloperID,PublisherID,CategoryID,Rating,Downloads,Price)
values
(1010,'Game',103,203,301,5.0,50000000,199);
commit;
insert into developers
(DeveloperID,DeveloperName,Country,FoundedYear)
values
(107,'GPT-6','USA',2026);
select * from developers;
rollback;
update apps 
set Rating=5.0
where AppName='Google Classroom';
update apps
set Rating=4.8
where AppName='Canva';
savepoint rating_savepoint;
update apps
set Rating=4.8
where AppName='Instagram';
rollback to rating_savepoint;
insert into apps
(AppID,AppName,DeveloperID,PublisherID,CategoryID,Rating,Downloads,Price)
values
(1011,'Game2',102,202,302,4.0,50000000,299);
savepoint newapp;
update apps
set Price=100
where AppName='Game2';
rollback to newapp;
select user();
grant select on apps to root@localhost;
grant select,insert on apps to root@localhost;
revoke insert on apps from root@localhost;
start transaction;
update apps
set Rating=4.5
where AppName='Google Keep';
savepoint sp1;
update apps
set Price=199
where AppName='Canva';
savepoint sp2;
update apps
set Downloads=Downloads+1000
where Appname='Spotify';
rollback to sp2;
update apps
set Rating=4.8
where AppName='Google Keep';
rollback to sp1;
commit;
insert into Categories
(CategoryID,CategoryName,MinimumAge)
values
(307,'Health',25),
(308,'Movies',18);
savepoint sp3;
select * from Categories;
rollback to sp3;
grant select,insert,update on apps to root@localhost;
revoke update on apps from root@localhost;
grant select on Developers to root@localhost;
revoke select on Developers from root@localhost;
select Appname,Rating,Price
from apps
where Appname in('Google Keep','Canva');
select * from Categories where CategoryID=307;
start transaction;
update apps
set Price=299
where Appname='Canva';
select AppName,Price from apps where AppName='Canva';
rollback;
select Appname,Price from apps where Appname='Canva';