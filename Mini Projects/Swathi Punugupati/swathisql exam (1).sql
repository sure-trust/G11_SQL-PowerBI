 select * from sales2;
select ProductCategoryName,count(ProductSubcategoryName) as ProductSubcategoryName1 from sales2
group by ProductCategoryName;
select ProductCategoryName,sum(SalesQuantity) as sum_salesquantity from sales2
group by ProductCategoryName
order by sum_salesquantity desc;
select ProductCategoryName,sum(SalesQuantity) as sum_salesquantity from sales2
where ProductCategoryName="Cell phones" or ProductCategoryName="Computers"
group by ProductCategoryName
order by sum_salesquantity desc;
select ContinentName,RegionCountryName,Weight,UnitCost,UnitPrice,SalesQuantity,ReturnQuantity from sales2
where ContinentName="Asia" and RegionCountryName="China"
limit 10;
select ProductCategoryName,CityName,avg(SalesAmount) as avg_sales from sales2
where CityName="Beijing"
group by ProductCategoryName
order by avg_sales desc
limit 4;
select count(ProductName) as count_proname,Manufacturer from sales2 
where not Manufacturer="Contoso, Ltd"
group by Manufacturer 
order by count_proname desc;
select sum(SalesQuantity) as sum_salesquantity,BrandName from sales2
where SalesQuantity between 100 and 500
group by BrandName
order by sum_salesquantity desc;
select count(CityName),RegionCountryName from sales2
group by RegionCountryName
order by count(CityName) desc;
select ProductSubcategoryName,Manufacturer from sales2
where ProductSubcategoryName="Lamps";
select BrandName,avg(UnitPrice) as avg_unitprice from sales2
where UnitPrice>50
group by BrandName
order by avg_unitprice desc;





