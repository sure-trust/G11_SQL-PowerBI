use  practice;

select ProductCategoryName,count(ProductSubcategoryName) as No_of_Subcategory from prodcategory
inner join prodsubcategory on prodcategory.ProductCategoryKey = prodsubcategory.ProductCategoryKey
group by ProductCategoryName ;

select StateProvinceName,max(SalesQuantity) as SalesQuantity from geography
inner join saleswithkey on saleswithkey.GeographyKey = geography.GeographyKey
group by StateProvinceName 
having SalesQuantity between  100 and 270 ;


select ProductSubcategoryName,ClassName from product
inner join prodsubcategory on prodsubcategory.ProductSubcategoryKey = product.ProductSubcategoryKey
where ProductSubcategoryName='MP4&MP3' and ClassName<> "Deluxe";

select ProductSubcategoryName,avg(UnitPrice) as Avg_unit_price,avg(UnitCost) as Avg_Unit_cost from product
inner join prodsubcategory on prodsubcategory.ProductSubcategoryKey = product.ProductSubcategoryKey
group by ProductSubcategoryName
having Avg_unit_price> 200 and Avg_Unit_cost >100;

select ContinentName,CityName,SalesAmount from geography
inner join saleswithkey on saleswithkey.GeographyKey = geography.GeographyKey
