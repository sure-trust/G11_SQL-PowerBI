select chanel.Chanel,product.ProductName,sales.LineTotal from chanel
join sales on chanel.ChannelIndex=sales.ChanelIndex
join product on product.ProductIndex=sales.ProductIndex
order by sales.LineTotal desc;

select chanel.chanel,product.ProductName,sales.OrderQuantity from sales
join chanel on chanel.ChannelIndex=sales.ChanelIndex
join region on region.RegionIndex=sales.RegionIndex
join product on product.ProductIndex=sales.ProductIndex
order by  chanel.chanel desc; 

select chanel.chanel,sales.OrderQuantity,sales.TotalUnitCost from sales
join chanel on chanel.ChannelIndex=sales.ChanelIndex
join region on region.RegionIndex=sales.RegionIndex
join customer on customer.CustomerIndex= sales.CustomerIndex
order by OrderQuantity
limit 10;

select regionlookup_type.typecdp,chanel.chanel,round(avg(sales.LineTotal),2) as AvgLineTotal,round(avg(sales.UnitPrice),3) as AvgUnitPrice from sales
join chanel on chanel.ChannelIndex =sales.ChanelIndex
join region on region.RegionIndex =sales.RegionIndex
join regionlookup_type on regionlookup_type.Type_Id =region.CDPindex
group by chanel.chanel,regionlookup_type.typecdp; 


select regionlookup_area.Area as Area,avg(sales.OrderQuantity) as AvgSalesQuantity from sales
join region on sales.RegionIndex = region.RegionIndex
join regionlookup_area on regionlookup_area.Area_Id = region.AreaIndex
group by Area
order by AvgSalesQuantity desc
limit 10;

select customer.CustomerNames,sales.LineTotal from sales
join customer on customer.CustomerIndex=sales.CustomerIndex
where LineTotal >(select avg(LineTotal) from sales);

select sales.LineTotal,region.population from sales
join region on region.RegionIndex=sales.RegionIndex
where population >(select avg(population) from region);


select regionlookup_area.Area,sales.LineTotal,region.population from sales
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_area on regionlookup_area.Area_Id=region.Areaindex
where population >(select avg(population) from region);

select regionlookup_type.typecdp, regionlookup_area.Area,sales.LineTotal,region.population from sales
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_area on regionlookup_area.Area_Id=region.Areaindex
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
where population >(select avg(population) from region) and LineTotal >(select avg(LineTotal) from sales);

select regionlookup_area.Area,region.population,sales.LineTotal  from sales
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_area on regionlookup_area.Area_Id =region.Areaindex
where sales.LineTotal< 25000
order by region.population desc;


select regionlookup_area.Area,max(sales.UnitPrice) as Max_Price  from sales
join region on region.RegionIndex=sales.RegionIndex
join regionlookup_area on regionlookup_area.Area_Id =region.Areaindex
group by regionlookup_area.Area
order by  Max_Price;