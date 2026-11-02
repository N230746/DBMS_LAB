use playstoredb;
select * from developers;
select * from publishers;
select * from categories;
select * from apps;
create view Application_Details_View1 as 
select * from apps ;
create view Application_Details_View2 as 
select AppId,AppName,Rating,Price from apps;
select * from Application_Details_view1;
select * from Application_Details_view2;
create view High_RatingApps as 
select AppName,Rating from apps where Rating>=4.5;
select * from High_RatingApps;
create view Free_Apps as 
select AppName,Price from apps where Price=0;
select * from Free_Apps;
show full tables
where table_type='VIEW';
create view App_Developer_View as 
select A.AppName,D.DeveloperName,D.Country,A.Rating
from apps as A
join developers as D
on A.DeveloperId=D.DeveloperId;
select * from App_Developer_View;
create view CategoryAppCount as 
select C.CategoryName,count(A.AppId)as TotalApplications
from categories as C
join apps as A
on C.CategoryId=A.CategoryId
group by C.CategoryName;
select * from CategoryAppCount;
create view CategoryAvgRating as 
select C.CategoryName,avg(A.Rating)as AverageRating
from categories as C
join apps as A
on C.CategoryId=A.CategoryId
group by C.CategoryName;
select * from CategoryAvgRating;
create view CategoryRating as 
select C.CategoryName,min(A.Rating)as MinimumRating,max(A.Rating) as MaximumRating
from categories as C
join apps as A
on C.CategoryId=A.CategoryId
group by C.CategoryName;
select * from CategoryRating;
select CategoryName,TotalApplications from  CategoryAppCount where TotalApplications>3;
show create view CategoryAvgRating;
create view DeveloperApplications as 
select D.DeveloperName,count(A.AppId)as TotalApplications
from apps as A
join developers as D
on A.DeveloperId=D.DeveloperId
group by DeveloperName;
select * from DeveloperApplications;
create view publisherApplications as 
select P.PublisherName,count(A.AppId)as TotalApplications,coalesce(sum(A.Downloads),0)as TotalDownloads
from apps as A
join publishers as P
on A.PublisherId=P.PublisherId
group by P.PublisherName;
select * from PublisherApplications;
select * from PublisherApplications where TotalApplications>2
order by TotalDownloads desc;
create view App_Rating as
select AppName,Rating from apps;
update App_Rating
set Rating=4.8
where AppName='Google Classroom';
select * from App_Rating;
select * from apps;
drop view App_Rating;
show full tables
where table_type='VIEW';