select geography.ContinentName,geography.CityName,saleswithkey.SalesAmount from geography
join saleswithkey on geography.ï»¿GeographyKey = saleswithkey.GeographyKey
where ContinentName="North America" or ContinentName="Europe";


select prodcategory.ProductCategoryName,count(prodsubcategory.ProductCategoryKey) as NO_of_Subcategory from prodcategory
join prodsubcategory on prodcategory.ï»¿ProductCategoryKey = prodsubcategory.ProductCategoryKey
group by ProductCategoryName;



select prodsubcategory.ProductSubcategoryName,avg(product.UnitPrice) as Avg_unit_price,avg(product.UnitCost) as Avg_unit_cost from prodsubcategory
join product on prodsubcategory.ï»¿ProductSubcategoryKey = product.ProductSubcategoryKey
group by ProductSubcategoryName
having Avg_unit_price > 200;



select geography.StateProvinceName,saleswithkey.SalesQuantity from geography
join saleswithkey on geography.ï»¿GeographyKey = saleswithkey.GeographyKey
having SalesQuantity > 100;



select prodsubcategory.ProductSubcategoryName,product.ClassName from prodsubcategory
join product on prodsubcategory.ï»¿ProductSubcategoryKey = product.ProductSubcategoryKey
where ClassName = "Economy" or ClassName = "Regular";



