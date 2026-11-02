use playstoredb;
select A.AppName,D.DeveloperName
from apps as A
inner join developers as D
on A.DeveloperID=D.DeveloperID;
select A.AppName,P.PublisherName
from apps as A
inner join publishers as p
on A.PublisherID=P.PublisherID;
select A.AppName,D.DeveloperName
from apps as A
inner join developers as D
on A.DeveloperID=D.DeveloperID;
select A.AppName,D.DeveloperName
from apps as A
inner join developers as D
on A.DeveloperID=D.DeveloperID;
select A.AppName,C.CategoryName
from apps as A
inner join categories as C
on A.CategoryID=C.CategoryID;
select A.AppName,D.DeveloperName,P.PublisherName
from apps as A
inner join developers as D
on A.DeveloperID=D.DeveloperID 
inner join publishers as P
on A.PublisherId=P.PublisherID;
select P.PublisherName,A.AppName
from Publishers as P
left join Apps as A
on P.PublisherID=A.PublisherID;
select C.CategoryName,A.AppName
from categories as C
left join Apps as A
on C.CategoryID=A.CategoryID;
select A.AppName,P.PublisherName
from apps as A
right join publishers as P
on A.PublisherID=P.PublisherID;
select A.AppName,D.DeveloperName,P.PublisherName,C.CategoryName
from Apps as A
inner join developers as D
on A.DeveloperId =D.DeveloperId
inner join categories as C
on A.CategoryID=C.CategoryID
inner join publishers as P
on A.PublisherID=P.PublisherID;
select A.AppName,D.DeveloperName,D.Country
from apps as A 
inner join developers as D
on A.DeveloperId= D.DeveloperID where D.Country='USA';
select A.AppName,C.CategoryName 
from apps as A
join categories as C
on A.CategoryId=C.CategoryID 
where C.CategoryName='Gaming';
select A.AppName,C.CategoryName
from apps as A
left join categories as C
on A.CategoryId=C.CategoryId order by C.CategoryName;
select A.AppName,D.DeveloperName,P.PublisherName
from apps as A
inner join developers as D
on A.DeveloperID=D.DeveloperID 
inner join publishers as P
on A.PublisherId=P.PublisherID where D.Country='USA' and P.PublisherName='Google Play';
select D1.DeveloperName as Developer1,D2.DeveloperName as Developer2,D1.country
from developers as D1
join developers as D2
on D1.Country=D2.Country and D1.DeveloperID<D2.developerID;
select P.PublisherName,C.CategoryName
from publishers as P
cross join categories as C;
select P.PublisherID,P.PublisherName,A.AppName
from publishers as P
left join apps as A
on P.PublisherId=A.PublisherID
union
select P.PublisherID,P.PublisherName,A.AppName
from publishers as P
right join apps as A
on P.PublisherId=A.PublisherID;
select A.AppName,D.DeveloperName,D.Country
from apps as A
inner join developers as D
on A.DeveloperID=D.DeveloperID where D.Country<>'India';