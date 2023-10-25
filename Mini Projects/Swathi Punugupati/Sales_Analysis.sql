/*1*/
select chanel.Chanel,avg(sales.LineTotal) as avg_sales,min(region.households) as MIn_households,sum(region.population) as Tot_population,sum(sales.UnitPrice) as Tot_Unitpeice from sales
join chanel on chanel.ChanelnIndex=sales.ChanelIndex
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
group by chanel.Chanel,regionlookup_type.typecdp;

/*2*/
select chanel.Chanel,region.median_income,reionlookup_county.county from sales
join chanel on chanel.ChanelnIndex=sales.ChanelIndex
join region on region.RegionIndex=sales.RegionIndex
join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
where median_income>30000
order by county;

/*3*/
select chanel.chanel, regionlookup_type.typecdp,reionlookup_county.county,max(sales.UnitPrice) as max_unitprice from sales
 join chanel on chanel.ChanelnIndex=sales.ChanelIndex
 join region on region.RegionIndex=sales.RegionIndex
 join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
 join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
 group by chanel,typecdp,county
 having typecdp="City" ;
 
 /*4*/
 select region.population,regionlookup_area.Area,regionlookup_type.typecdp,reionlookup_county.county,sales.TotalUnitCost from sales
 join region on region.RegionIndex=sales.RegionIndex
 join regionlookup_area on regionlookup_area.Area_Id=region.Areaindex
 join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
 join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
 order by county;
 
 /*5*/
 select product.ProductName,customer.CustomerNames,region.households,sales.OrderQuantity from sales
 join product on product.ProductIndex=sales.ProductIndex
 join customer on customer.CustomerIndex=sales.CustomerIndex
 join region on region.RegionIndex=sales.RegionIndex
 where households>2500
 order by CustomerNames;
 
 /*6*/
 select chanel.Chanel,sales.LineTotal,customer.CustomerNames,product.ProductName,region.population from sales
join chanel on chanel.ChanelnIndex=sales.ChanelIndex
join customer on customer.CustomerIndex=sales.CustomerIndex
join product on product.ProductIndex=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex
where population>60000 and chanel="Distributor"
order by CustomerNames;


 






 