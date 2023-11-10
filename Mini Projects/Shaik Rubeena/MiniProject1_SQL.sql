use project1;

select ProductCategoryName,count(ProductSubcategoryName) as count_productSubcategoryname From sales2
group by ProductCategoryName;

select ProductCategoryName,sum(SalesQuantity) as sum_salesquantity from sales2
group by ProductCategoryName
order by sum_salesquantity DESC;

select ProductCategoryName,sum(SalesQuantity) as sum_salesquantity from sales2
where ProductCategoryName = "Computers" or ProductCategoryName = "Cell phones"
group by ProductCategoryName;

select ContinentName,RegionCountryName,Weight,UnitCost,UnitPrice,SalesQuantity,ReturnQuantity from sales2
where ContinentName = "Asia" and RegionCountryName = "China";


select ProductCategoryName,CityName,avg(SalesAmount) as AVG_SALES from sales2
where CityName = "Beijing"
group by ProductCategoryName
order by AVG_SALES DESC;

select Manufacturer,count(ProductName) as Count_Productname from sales2
group by Manufacturer
having Manufacturer <> "Contoso, Ltd"
order by Count_Productname desc;

select BrandName,sum(SalesQuantity) as Sales_Quantity from sales2
group by BrandName
having Sales_Quantity between 100 and 500
order by Sales_Quantity desc;

select count(distinct CityName) as City_Count,RegionCountryName from sales2
group by RegionCountryName;


select Manufacturer,ProductSubcategoryName from sales2
where ProductSubcategoryName = "Lamps"
group by Manufacturer;

select BrandName,avg(UnitPrice) as AVG_UNITPRICE from sales2
where UnitPrice > 50
group by BrandName
 
