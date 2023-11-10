select regionlookup_type.typecdp, products.ProductName,max(sales.UnitPrice) from sales
join products on products.product_Index=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_type on regionlookup_type.Type_id=region.CDPindex
where typecdp='CDP'
group by typecdp,ProductName;  /*1*/

select regionlookup_county.county, avg(region.median_income),avg(sales.LineTotal),regionlookup_area.Area from sales
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_county on regionlookup_county.Countyindex=region.Countyindex
join regionlookup_area on regionlookup_area.Areaindex=region.Areaindex
group by county,Area; /*2*/


select customer.CustomerNames,regionlookup_area.Area, regionlookup_type.typecdp, sales.LineTotal, region.population 
from sales
join customer on customer.CustomerIndex=sales.CustomerIndex
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_area on regionlookup_area.Areaindex=region.Areaindex
join regionlookup_type on regionlookup_type.Type_id=region.CDPindex
where LineTotal > (select avg(LineTotal) from sales); 	/*3*/


select regionlookup_type.typecdp,products.ProductName, sales.LineTotal,sales.UnitPrice,sales.TotalUnitCost from sales
join products on products.product_Index=sales.ProductIndex
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_type on region.CDPindex = regionlookup_type.Type_id
where typecdp='Town' or typecdp='Village'; /* 4 */

select sales.OrderDate,regionlookup_area.Area, customer.CustomerNames,min(sales.OrderQuantity) from sales
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_area on region.Areaindex = regionlookup_area.Areaindex
join customer on customer.CustomerIndex=sales.CustomerIndex
group by Area,CustomerNames,OrderDate
order by OrderDate asc;   /*5*/


select chanel.Channel_Name,products.ProductName,sales.OrderQuantity,region.households from sales
join products on products.product_Index=sales.ProductIndex
join chanel on chanel.ID=sales.ChanelIndex
join region on region.RegionIndex=sales.RegionIndex
where OrderQuantity>9; /*6*/

select chanel.Channel_Name,customer.CustomerNames,products.ProductName,region.population,sales.LineTotal from sales
join chanel on chanel.ID=sales.ChanelIndex
join customer on customer.CustomerIndex=sales.CustomerIndex
join products on products.product_Index=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex
where population>80000; /*7*/

select chanel.Channel_Name,regionlookup_type.typecdp,avg(sales.LineTotal),avg(sales.UnitPrice) from sales
join chanel on chanel.ID=sales.ChanelIndex
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_type on regionlookup_type.Type_id=region.CDPindex
group by chanel.Channel_Name,regionlookup_type.typecdp; /*8*/

select chanel.Channel_Name, regionlookup_type.typecdp,regionlookup_county.county,max(sales.TotalUnitCost) from sales
join chanel on chanel.ID=sales.ChanelIndex
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_type on regionlookup_type.Type_id=region.CDPindex
join regionlookup_county on regionlookup_county.Countyindex=regionlookup_county.Countyindex
group by Channel_Name,typecdp,county
order by county; /*9*/

select customer.CustomerNames,sales.LineTotal,region.households
from sales
join customer on customer.CustomerIndex=sales.CustomerIndex
join region on region.RegionIndex=sales.RegionIndex
where CustomerNames like 'a%' or CustomerNames like 'c%'
order by CustomerNames asc; /*10*/

select  customer.CustomerIndex,customer.CustomerNames,products.product_Index ,products.ProductCategory, region.median_income
from sales
join customer on customer.CustomerIndex=sales.CustomerIndex
join products on products.product_Index=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex
where CustomerNames like 'K%' or CustomerNames like 'S%' and median_income > 50000
order by CustomerNames;  /*11*/

select  customer.CustomerIndex,customer.CustomerNames,products.product_Index ,products.ProductCategory, region.median_income,max(sales.LineTotal),max(sales.TotalUnitCost)
from sales
join customer on customer.CustomerIndex=sales.CustomerIndex
join products on products.product_Index=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex
where CustomerNames in ('Kevin Rose','Jason Bowman','Frank Long') 
group by CustomerNames,ProductCategory,median_income,CustomerIndex,product_Index; /*12*/

select sales.OrderDate,customer.CustomerNames,avg(sales.LineTotal) as AVG_SALES,sales.LineTotal AS SALES,AVG(sales.TotalUnitCost) AS AVG_TOTALUNITCOST,sales.TotalUnitCost AS TOTAL_UNIT_COST
from sales
join customer on customer.CustomerIndex=sales.CustomerIndex
group by CustomerNames,OrderDate,LineTotal,TotalUnitCost
order by OrderDate; /*13*/

SELECT sales.ShipDate,products.ProductName,regionlookup_area.Area,sales.UnitPrice
from sales
join products on products.product_Index=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_area on regionlookup_area.Areaindex=region.Areaindex
where Area not in ('Boca Raton','Cape Coral','Deltona') and ProductName not in ('Product 144','Product 380')
order by ShipDate;  /*14*/

select chanel.Channel_Name,regionlookup_county.county,region.households,region.population from sales
join chanel on chanel.ID=sales.ChanelIndex
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_county on regionlookup_county.Countyindex=region.Countyindex
where population> (select avg(population) from region) and households > (select avg(households) from region)
order by county; /*15*/









