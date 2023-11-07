
/* Q1 */
select ProductCategoryName, count(ProductSubcategoryName) as count_ProductSubcategoryName from sales2
group by ProductCategoryName
order by ProductCategoryName;

/* Q2 */
select ProductCategoryName, sum(SalesQuantity) as sum_SalesQuantity from sales2
group by ProductCategoryName
order by sum_SalesQuantity desc;

/* Q3 */
select ProductCategoryName, sum(SalesQuantity) as sum_SalesQuantity from sales2
where ProductCategoryName= 'Cell phones' or ProductCategoryName='Computers'
group by ProductCategoryName
order by ProductCategoryName;

/* Q4 */ 
select ContinentName,RegionCountryName,Weight,UnitCost,UnitPrice,SalesQuantity,ReturnQuantity from sales2
where RegionCountryName ='China' and ContinentName = 'Asia';

/* Q5 */
select ProductCategoryName,CityName, avg(SalesAmount) as AVG_SALES from sales2
where CityName ='Beijing'
group by ProductCategoryName
having AVG_SALES > 3000;

/* Q6 */
select count(ProductName) as count, Manufacturer from sales2
group by Manufacturer
having count <> 169;


/* Q7 */
select sum(SalesQuantity), BrandName from sales2
where SalesQuantity between 100 and 500
group by BrandName;

/* Q8*/
select RegionCountryName,count(CityName) as Count_City from sales2
group by RegionCountryName
order by RegionCountryName;

/* Q9*/
select ProductSubcategoryName , Manufacturer from sales2
where ProductSubcategoryName='Lamps'
order by Manufacturer;

/* Q10*/
select avg(UnitPrice) as AVG_UNITPRICE,  BrandName from sales2
group by BrandName
having AVG_UNITPRICE >50












