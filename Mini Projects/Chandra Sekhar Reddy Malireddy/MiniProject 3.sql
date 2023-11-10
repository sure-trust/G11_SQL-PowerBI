use project3;

select  ProductCategoryName, count(ProductSubcategoryName)as Count_ProductSubcategoryName  from sales
group by ProductCategoryName;

select  ProductCategoryName, sum(SalesQuantity) as sum_SalesQuantity from sales
group by ProductCategoryName
order by sum_SalesQuantity desc;

select  ProductCategoryName, sum(SalesQuantity) as sum_SalesQuantity from sales
where  ProductCategoryName="Cell phones" or ProductCategoryName="Computers"
group by ProductCategoryName
order by sum_SalesQuantity desc;

select ContinentName,RegionCountryName,Weight, UnitCost,SalesQuantity,ReturnQuantity from sales
where  ContinentName="Asia" and RegionCountryName="China";

select  ProductCategoryName, CityName, avg(SalesAmount) as AVG_SALES from sales
where  CityName="Beijing" 
group by ProductCategoryName
having AVG_SALES between 4000 and 10000
order by AVG_SALES desc;

select  Manufacturer,count(ProductName) as Count_ProductName   from sales
where Manufacturer<>'Contoso, Ltd'
group by Manufacturer
order by Count_ProductName desc;


select  BrandName, sum(SalesQuantity) as sum_SalesQuantity from sales
group by BrandName
having sum_SalesQuantity between 100 and 500
order by sum_SalesQuantity desc;


select  RegionCountryName, count(CityName) as No_of_Cities from sales
group by RegionCountryName;


select Manufacturer, ProductSubcategoryName from sales
where ProductSubcategoryName ="lamps" ;

select BrandName,avg(UnitPrice) as AVg_Price from sales
where UnitPrice>50
group by BrandName 
order by AVg_Price asc ;


