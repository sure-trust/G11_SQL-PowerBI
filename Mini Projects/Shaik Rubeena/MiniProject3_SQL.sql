
select channel.ChannelName,customer.CustomerNames,product.ProductName,sum(sales.LineTotal * sales.OrderQuantity) as Total_Revenue from sales
join channel on channel.ChannelIndex = sales.ChanelIndex
join customer on customer.CustomerIndex = sales.CustomerIndex
join product on product.ProductIndex = sales.ProductIndex
group by ChannelName,CustomerNames,ProductName 
order by Total_Revenue desc;



select customer.CustomerNames,avg(sales.LineTotal) as Avg_Linetotal,avg(sales.UnitPrice) as Avg_UnitPrice from sales
join customer on customer.CustomerIndex = sales.CustomerIndex
group by CustomerNames
order by Avg_Linetotal desc ,Avg_UnitPrice desc
limit 10;



select channel.ChannelName, product.ProductName, avg(sales.LineTotal) as Average_PurchaseAmount from sales
join channel on channel.ChannelIndex = sales.ChanelIndex
join product on product.productIndex = sales.ProductIndex
where ChannelName = "Wholesale"
group by ChannelName,ProductName
order by Average_PurchaseAmount desc;



select channel.ChannelName, product.ProductName, sales.LineTotal from sales
join channel on channel.ChannelIndex = sales.ChanelIndex
join product on product.productIndex = sales.ProductIndex
where ChannelName = "Distributor" or LineTotal >= 5000
order by LineTotal  desc
limit 5;



select customer.customerNames, product.ProductName, region.median_income, sales.TotalUnitCost from sales
join product on product.productIndex = sales.ProductIndex
join region on region.RegionIndex= sales.RegionIndex
join customer on customer.CustomerIndex = sales.CustomerIndex
where TotalUnitCost > 500 or (select avg(median_income) from sales)
order by TotalUnitCost;



select customer.CustomerNames,regionlookup_area.Area,sales.OrderQuantity from sales
join customer on customer.CustomerIndex = sales.CustomerIndex
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_area on region.AreaIndex = regionlookup_area.AreaIndex
where OrderQuantity >= (select avg(OrderQuantity) from sales) 
order by OrderQuantity desc;


select channel.ChannelName,product.ProductName,sales.LineTotal from sales
join channel on channel.ChannelIndex = sales.ChanelIndex
join product on product.ProductIndex = sales.ProductIndex
order by LineTotal desc
limit 10;


select channel.channelName, product.ProductName, product.ProductCategory, regionlookup_area.Area, sales.OrderQuantity from sales
join channel on channel.ChannelIndex = sales.ChanelIndex
join product on product.productIndex = sales.productIndex
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_area on regionlookup_area.AreaIndex = region.AreaIndex
having channelName = "Wholesale" and OrderQuantity > 5
order by OrderQuantity desc;


select channel.ChannelName, customer.CustomerNames, regionlookup_type.Regiontype, sales.TotalUnitCost from sales
join channel on channel.ChannelIndex = sales.ChanelIndex
join customer on customer.CustomerIndex = sales.CustomerIndex
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_type on region.CDPIndex = regionlookup_type.TypeIndex
having Regiontype = "City" or Regiontype = "CDP" 
order by TotalUnitCost desc
limit 10;


select regionlookup_county.county, max(sales.OrderDate) as Recent_OrderPurchaseDate,product.ProductName,sales.OrderQuantity from sales
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_county on region.CountyIndex = regionlookup_county.CountyIndex
join product on product.ProductIndex = sales.ProductIndex
group by county,ProductName,OrderQuantity
order by OrderQuantity desc;


select channel.ChannelName, customer.CustomerNames, product.ProductName, product.ProductCategory, max(sales.LineTotal) as max_purchase_amount from sales
join customer on customer.CustomerIndex = sales.CustomerIndex
join product on product.ProductIndex = sales.ProductIndex
join channel on channel.ChannelIndex = sales.ChanelIndex
group by ChannelName,CustomerNames,ProductName,ProductCategory
order by max_purchase_amount desc
limit 10;


select customer.CustomerNames,regionlookup_type.Regiontype,product.ProductName,min(sales.LineTotal) as Min_Purchase_Amount from sales
join customer on customer.CustomerIndex = sales.CustomerIndex
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_type on region.CDPIndex = regionlookup_type.TypeIndex
join product on product.ProductIndex = sales.ProductIndex
group by CustomerNames,Regiontype,ProductName
order by Min_Purchase_Amount
limit 10;


select regionlookup_type.Regiontype,count(customer.CustomerNames) as Total_Customers,sum(sales.LineTotal) as Total_Purchases from sales
join customer on customer.CustomerIndex = sales.CustomerIndex
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_type on region.CDPIndex = regionlookup_type.TypeIndex
group by Regiontype;


select customer.CustomerNames,regionlookup_county.county,sales.UnitPrice from sales
join customer on customer.CustomerIndex = sales.CustomerIndex
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_county on region.CountyIndex = regionlookup_county.CountyIndex
where TotalUnitCost >= (select avg(TotalUnitCost) from sales);


select regionlookup_area.Area,product.ProductName,region.population,sales.LineTotal from sales
join product on product.productIndex = sales.productIndex
join region on region.RegionIndex = sales.RegionIndex
join regionlookup_area on region.AreaIndex = regionlookup_area.AreaIndex
where population > (select avg(population) from region);





