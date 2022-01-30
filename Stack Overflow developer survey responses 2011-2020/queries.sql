/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Response, ResponseYear, count(*) as TotalRespondents
  FROM [SOStats].[dbo].[Surveys]
  group by Response, ResponseYear
  order by ResponseYear, TotalRespondents desc

  -- drop table dbo.Surveys;

select 
	Response as Country,
	[2011], [2012], [2013], [2014], [2015], [2016], [2017], [2018], [2019], [2020]
from 
(
	select 
		Response, ResponseYear, count(*) as Total
	from dbo.Surveys
	group by Response, ResponseYear
) src
pivot
(
  max(Total)
  for ResponseYear in ([2011], [2012], [2013], [2014], [2015], [2016], [2017], [2018], [2019], [2020])
) piv;