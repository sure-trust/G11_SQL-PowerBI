use project3;
select channels.Channel,count(customers.CustomerNames) from channels
join  sales on channels.ChannelIndex = sales.ChannelIndex
join customers on customers.CustomerIndex=sales.CustomerIndex
group by channels.channel;

select customers.CustomerNames,sum(sales.LineTotal) from sales
join customers on customers.CustomerIndex=sales.CustomerIndex
join region on region.RegionIndex=sales.RegionIndex
group by CustomerNames;

select customers.CustomerNames,region_county.County,sales.LineTotal from sales
join customers on customers.CustomerIndex=sales.CustomerIndex
join region on region.RegionIndex=sales.RegionIndex
join region_county on region_county.Countyindex=region.Countyindex
where County='Lee County' ;

select customers.CustomerNames,region_type.Typecdp,sales.TotalUnitCost from sales
join customers on customers.CustomerIndex=sales.CustomerIndex
join region on region.RegionIndex=sales.RegionIndex
join region_type on region_type.Typeindex=region.CDPindex
having Typecdp='city';

select channels.Channel,customers.CustomerNames,avg(sales.UnitPrice) from channels
join  sales on channels.ChannelIndex = sales.ChannelIndex
join customers on customers.CustomerIndex=sales.CustomerIndex
group by channel,CustomerNames
order by avg(sales.UnitPrice) desc;

select channels.channel,product.ProductCategory ,sales.UnitPrice from sales
join channels on channels.ChannelIndex = sales.ChannelIndex
join product on product.ProductIndex=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex
having ProductCategory= 'Category 9';

select region_type.TypeCDP,count(sales.LineTotal) from sales
join region on region.RegionIndex=sales.RegionIndex
join region_type on region.CDPindex=region_type.Typeindex
group by TypeCDP;

select region_area.AreaNames,max(sales.OrderQuantity) from sales
join region on region.RegionIndex=sales.RegionIndex
join region_area on region.Areaindex=region_area.Areaindex
group by AreaNames
having max(sales.OrderQuantity)>10
order by max(sales.OrderQuantity) desc; 

select region_type.TypeCDP,min(customers.CustomerIndex) from sales
join customers on customers.CustomerIndex=sales.CustomerIndex
join region on region.RegionIndex=sales.RegionIndex
join region_type on region.CDPindex=region_type.Typeindex
group by TypeCDP
order by min(customers.CustomerIndex) desc;

select channels.Channel,product.productName,sum(sales.TotalUnitCost) from sales
join channels on channels.ChannelIndex=sales.ChannelIndex
join product on product.ProductIndex=sales.ProductIndex
group by Channel,productName 
order by sum(sales.TotalUnitCost) desc limit 10 ;

select channels.channel,region_type.Typecdp,avg(sales.LineTotal) from sales
join channels on channels.ChannelIndex =sales.ChannelIndex 
join region on region.RegionIndex=sales.RegionIndex
join region_type on region_type.TypeIndex=region.CDPindex
group by channels.channel,region_type.Typecdp;


select channels.channel,region_area.AreaNames,region.population,Avg(sales.TotalUnitCost) from sales
join channels on channels.ChannelIndex = sales.ChannelIndex
join region on region.RegionIndex = sales.RegionIndex
join region_area on region_area.Areaindex=region.Areaindex
group by channel,TotalUnitCost,population,AreaNames;

select region_area.AreaNames,max(product.ProductIndex) from sales
join product on product.ProductIndex=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex
join region_area on region.Areaindex=region_area.Areaindex
group by AreaNames
having max(product.ProductIndex) > 350
order by max(product.ProductIndex) desc  ;

select channels.Channel,region.households,count(sales.OrderQuantity) from sales
join channels on channels.ChannelIndex = sales.ChannelIndex
join region on region.RegionIndex = sales.RegionIndex
group by channel,households
order by  count(sales.OrderQuantity) desc limit 10 ;

select channels.channel, region_type.Typecdp,region_county.County,max(sales.TotalUnitCost) from sales
join channels on channels.ChannelIndex =sales.ChannelIndex 
join region on region.RegionIndex=sales.RegionIndex
join region_type on region_type.TypeIndex=region.CDPindex
join region_county on region_county.Countyindex=region.Countyindex
group by channels.channel,region_type.Typecdp,region_county.County
order by max(sales.TotalUnitCost) desc limit 5; 

select region_county.County,sales.UnitPrice,region.households from sales
join region on region.RegionIndex=sales.RegionIndex
join region_county on region_county.Countyindex=region.Countyindex
where sales.UnitPrice > (select count(UnitPrice) from sales);

select region_type.TypeCDP,region.population from sales
join region on sales.RegionIndex=region.RegionIndex
join region_type on region_type.Typeindex=region.CDPindex
where population > (select min(region.population) from region)
order by population desc limit 15;

select region_area.AreaNames,region.median_income,sales.OrderQuantity from sales
join region on sales.RegionIndex=region.RegionIndex
join region_area on region_area.Areaindex=region.Areaindex
where median_income > ( select count(OrderQuantity) from region)
having OrderQuantity > 10;

select region_county.County,product.ProductCategory,region.households,sales.UnitPrice from sales
join product on product.ProductIndex=sales.ProductIndex
join region on sales.RegionIndex=region.RegionIndex
join region_county on region_county.Countyindex=region.CDPindex
where UnitPrice > ( select Avg(UnitPrice) from sales);

select region_type.TypeCDP,avg(customers.CustomerIndex) from sales
join customers on customers.CustomerIndex=sales.CustomerIndex
join region on region.RegionIndex=sales.RegionIndex
join region_type on region.CDPindex=region_type.Typeindex
group by TypeCDP;
















