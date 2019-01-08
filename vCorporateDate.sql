create view [dbo].[vCorporateDate]
as
select
	DateKey
	,FullDateAlternateKey as [Date]
	,cast(CalendarYear as nchar(4)) + N' ' + left(EnglishMonthName,3) + N', ' + case when DayNumberOfMonth < 10 then N'0' + cast(DayNumberOfMonth as nchar(1)) else cast(DayNumberOfMonth as nchar(2)) end as DateLabel
	,((CalendarYear * 100) + MonthNumberOfYear) as MonthKey
	,cast(CalendarYear as nchar(4)) + N' ' + left(EnglishMonthName,3) as MonthLabel
	,MonthNumberOfYear as MonthOfYearKey
	,left(EnglishMonthName, 3) as MonthOfYearLabel
	,((CalendarYear * 10) + CalendarQuarter) as CalendarQuarterKey
	,N'CY' + cast(CalendarYear as nchar(4)) + N' Q' + cast(CalendarQuarter as nchar(1)) as CalendarQuarterLabel
	,CalendarQuarter as CalendarQuarterOfTheYearKey
	,N'CY Q' + cast(CalendarQuarter as nchar(1)) as CalendarQuarterOfYearLabel
	,CalendarYear as CalendarYearKey
	,N'CY' + cast(CalendarYear as nchar(4)) as CalendarYearLabel
	,((FiscalYear * 10) + FiscalQuarter) as FiscalQuarterKey
	,N'FY' + cast(FiscalYear as nchar(4)) + N' Q' + cast(FiscalQuarter as nchar(1)) as FiscalQuarterLabel
	,FiscalQuarter as FiscalrQuarterOfTheYearKey
	,N'FY Q' + cast(FiscalQuarter as nchar(1)) as FiscalQuarterOfYearLabel
	,FiscalYear as FiscalYearKey
	,N'FY' + cast(FiscalYear as nchar(4)) as FiscalYearLabel
from dbo.DimDate
