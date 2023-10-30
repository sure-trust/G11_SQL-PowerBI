
select regionlookup_type.Typecdp, sales.Line_Total from  regionlookup_type
join regions on regions.Typeindex=regionlookup_type.Typeindex
join sales on sales.RegionIndex=regions.RegionIndex;



select channels.chanel,product.ProductName,regions.population from channels
join sales on channels.channelIndex=sales.ChanelIndex
join product on product.productIndex=sales.ProductIndex
join regions on regions.RegionIndex=sales.RegionIndex
where chanel="distribitor";


select regionlookup_type.Typecdp, sales.Line_Total from  regionlookup_type
join regions on regions.Typeindex=regionlookup_type.Typeindex
join sales on sales.RegionIndex=regions.RegionIndex;



select channels.chanel,regionlookup_type.Typecdp,regionlookup_county.County,max(sales.TotalUnitCost) from sales
join channels on channels.channelIndex=sales.ChanelIndex
join regions on regions.RegionIndex=sales.RegionIndex
join regionlookup_county on regionlookup_county.Countyindex=regions.Countyindex
join regionlookup_type on regionlookup_type.Typeindex=regions.Typeindex
group by chanel,Typecdp,County;




select regionlookup_area.Area,regionlookup_county.County,customer.CustomerNames from sales
join customer on customer.CustomerIndex=sales.CustomerIndex
join regions on regions.RegionIndex=sales.RegionIndex
join regionlookup_area on regionlookup_area.Areaindex=regions.Areaindex
join regionlookup_county on regionlookup_county.Countyindex=regions.Countyindex;



select channels.chanel,regions.households,sales.OrderQuantity from sales
join channels on channels.channelIndex=sales.ChanelIndex
join regions on regions.RegionIndex=sales.RegionIndex;



select channels.chanel,product.ProductName,sum(sales.TotalUnitCost) from sales
 join channels on channels.channelIndex=sales.ChanelIndex
join product on product.productIndex=sales.ProductIndex
group by chanel,ProductName
order by ProductName;




 select channels.chanel,avg(sales.Line_Total),avg(sales.UnitPrice), regionlookup_type.Typecdp from sales
 join channels on channels.channelIndex=sales.ChanelIndex
 join regions on regions.RegionIndex=sales.RegionIndex
 join regionlookup_type on regionlookup_type.Typeindex=regions.Typeindex
 group by chanel,Typecdp
 order by chanel;
 
 
 
select channels.chanel,customer.CustomerNames,regionlookup_type.Typecdp,regionlookup_area.Area,regionlookup_county.County from sales
join channels on channels.channelIndex=sales.channelIndex
join customer on customer.CustomerIndex=sales.CustomerIndex
join product on product.productIndex=sales.ProductIndex
join regions on regions.RegionIndex=sales.RegionIndex
join regionlookup_type on regionlookup_type.Typeindex=regions.Typeindex
join regionlookup_area on regionlookup_area.Areaindex=regions.Areaindex
join regionlookup_county on regionlookup_county.Countyindex=regions.Countyindex;


select channels.chanel,customer.CustomerNames from sales
join channels on channels.channelIndex=sales.channelIndex
join customer on customer.CustomerIndex=sales.CustomerIndex
where chanel ="export";

select channels.chanel,product.ProductName ,sales.Line_Total from channels
join sales on sales.channelIndex=channels.channelIndex
join product on product.productIndex=sales.ProductIndex;


select sales.Line_Total,regions.population from sales
join regions on regions.RegionIndex=sales.RegionIndex
where population>(select avg(population) from regions);
