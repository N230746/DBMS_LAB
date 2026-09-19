use PlayStoreDB;
select count(*) from apps;
select avg(Rating) from apps;
select max(Rating) from apps;
select min(Rating) from apps;
select sum(Downloads) from apps;
select * from apps order by Rating desc;
select CategoryID,count(*) from apps group by CategoryID;
select CategoryID,avg(Rating) from apps group by CategoryID;
select max(Price),min(Price) from apps;
select * from apps order by downloads desc;
select DeveloperID,count(*) from apps group by DeveloperID;
select CategoryID ,count(*) from apps group by CategoryID having count(*)>1;
select DeveloperID,sum(Downloads) from apps group by DeveloperID;
select PublisherID,avg(Rating) from apps group by PublisherID;
select d.DeveloperName,a.DeveloperID,count(*) from apps as a 
join developers as d 
on a.DeveloperID=d.DeveloperID group by DeveloperID having count(*) >1; 
select CategoryID,avg(Rating) from apps group by CategoryID having avg(Rating)>4.3;
select CategoryID,count(*)  from apps group by CategoryID order by count(*) desc;
select * from apps  where Rating=(select max(Rating) from apps);
select DeveloperID,sum(Price) from apps group by DeveloperId;