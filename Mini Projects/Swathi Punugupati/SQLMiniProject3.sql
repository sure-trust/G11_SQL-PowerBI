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
/*7*/
select customer.CustomerNames,sales.LineTotal from sales
inner join customer on customer.CustomerIndex=sales.CustomerIndex
where LineTotal>(select avg(LineTotal) from sales)
order by LineTotal desc;

/*8*/
select region.population,region.RegionIndex,sales.LineTotal from sales
join region on region.RegionIndex=sales.RegionIndex
where population > (select avg(population) from region)
order by population;

/*9*/
select product.ProductName,sales.OrderQuantity,sales.UnitPrice from sales
join product on product.ProductIndex=sales.ProductIndex
where UnitPrice > (select avg(UnitPrice) from sales)
order by UnitPrice desc;

/*10*/
select chanel.Chanel,sales.TotalUnitCost,sales.UnitPrice from sales
join chanel on chanel.ChanelnIndex=sales.ChanelIndex
where TotalUnitCost> (select avg(TotalUnitCost) from sales where chanel="Wholesale");

 /*11*/
 select customer.CustomerNames,region.population,sales.OrderQuantity from sales
 join customer on customer.CustomerIndex=sales.CustomerIndex
 join region on region.RegionIndex=sales.RegionIndex
 where OrderQuantity > (select avg(OrderQuantity) from sales)
 order by OrderQuantity;
 
 /*12*/
 select regionlookup_type.typecdp,region.households,region.population,reionlookup_county.county from region
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
where households> (select avg(households) from region);
/*13*/
select regionlookup_area.Area,regionlookup_type.typecdp,reionlookup_county.county,region.median_income from region
join regionlookup_area on regionlookup_area.Area_Id=region.Areaindex
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
group by Area,typecdp,county,median_income;

/*14*/
select chanel.Chanel,product.ProductName,region.households,region.population,sales.UnitPrice from sales
join chanel on  chanel.ChanelnIndex=sales.ChanelIndex
join product on product.ProductIndex=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex;

 /*15*/
 select regionlookup_type.typecdp,region.households,region.population,reionlookup_county.county from region
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
where households>1000;
 /*16*/
 select regionlookup_type.typecdp,region.households,region.population,reionlookup_county.county from region
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
where households> (select avg(households) from region);

/*17*/
select regionlookup_area.Area,region.median_income,region.population,regionlookup_type.typecdp from region
join regionlookup_area on regionlookup_area.Area_Id=region.Areaindex
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
where median_income>40000 and population>2000;

/*18*/
select product.ProductName,product.ProductCategory,sales.UnitPrice+sales.TotalUnitCost as Total from product
inner join sales on product.ProductIndex=sales.ProductIndex
where ProductCategory="Category 10"
having Total>500;

/*19*/
select chanel.Chanel,count(customer.CustomerNames) as no_of_customer from chanel
join sales on chanel.ChanelnIndex=sales.ChanelIndex
join customer on customer.CustomerIndex=sales.ChanelIndex
group by chanel.Chanel;

/*20*/
select chanel.Chanel,product.ProductIndex from product
join sales on product.ProductIndex=sales.ProductIndex
join chanel on chanel.ChanelnIndex=sales.ChanelIndex;

/*21*/
select chanel.Chanel,sales.LineTotal,region.population from chanel
join sales on sales.ChanelIndex=chanel.ChanelnIndex
join region on sales.RegionIndex=region.RegionIndex
order by population desc;

/*22*/
select chanel.Chanel,sales.OrderQuantity,region.households,product.ProductName from chanel
join sales on sales.ChanelIndex=chanel.ChanelnIndex
join region on region.RegionIndex=sales.RegionIndex
join product on product.ProductIndex=sales.ProductIndex;

/*23*/
select chanel.chanel,avg(sales.UnitPrice) as avg_Unitprice from chanel
right join sales on chanel.ChanelnIndex=sales.ChanelIndex
group by chanel;

/*24*/
select chanel.Chanel,avg(sales.UnitPrice) as avg_unitprice,avg(sales.TotalUnitCost)  as avg_totalcost from chanel
right join sales on chanel.ChanelnIndex=sales.ChanelIndex
where UnitPrice>10 and TotalUnitCost>10
group by chanel;








 


 



 






 
 






 