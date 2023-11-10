/*1*/
select customer.CustomerNames,sales.LineTotal from sales
inner join customer on customer.CustomerIndex=sales.CustomerIndex
where LineTotal>(select avg(LineTotal) from sales)
order by LineTotal desc;

/*2*/
select region.population,region.RegionIndex,sales.LineTotal from sales
join region on region.RegionIndex=sales.RegionIndex
where population > (select avg(population) from region)
order by population;

/*3*/
select product.ProductName,sales.OrderQuantity,sales.UnitPrice from sales
join product on product.ProductIndex=sales.ProductIndex
where UnitPrice > (select avg(UnitPrice) from sales)
order by UnitPrice desc;

/*4*/
select chanel.Chanel,sales.TotalUnitCost,sales.UnitPrice from sales
join chanel on chanel.ChanelnIndex=sales.ChanelIndex
where TotalUnitCost> (select avg(TotalUnitCost) from sales where chanel="Wholesale");

 /*5*/
 select customer.CustomerNames,region.population,sales.OrderQuantity from sales
 join customer on customer.CustomerIndex=sales.CustomerIndex
 join region on region.RegionIndex=sales.RegionIndex
 where OrderQuantity > (select avg(OrderQuantity) from sales)
 order by OrderQuantity;
 
 /*6*/
 select regionlookup_type.typecdp,region.households,region.population,reionlookup_county.county from region
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
where households> (select avg(households) from region);

 


