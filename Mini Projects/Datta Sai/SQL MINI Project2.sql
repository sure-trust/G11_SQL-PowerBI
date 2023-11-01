
select prodcategory.ProductCategoryName,count(prodsubcategory.ProductCategoryKey) as no_of_subcategory from prodcategory
inner join prodsubcategory on prodcategory.ProductCategoryKey=prodsubcategory.ProductCategoryKey
group by ProductCategoryName;


select prodsubcategory.ProductSubcategoryName,product.ClassName from prodsubcategory
inner join product on prodsubcategory.ProductSubcategoryKey=product.ProductSubcategoryKey
where ClassName='Economy' or ClassName='Regular';


select geography.ContinentName,geography.CityName,saleswithkey.SalesAmount from geography
inner join saleswithkey on geography.GeographyKey=saleswithkey.GeographyKey;


select prodsubcategory.ProductSubcategoryName,avg(product.UnitPrice) as Avg_unit_price,avg(product.UnitCost) as Avg_unit_cost from prodsubcategory
join product on prodsubcategory.ProductSubcategoryKey = product.ProductSubcategoryKey
group by ProductSubcategoryName
having Avg_unit_price > 200;


select geography.StateProvinceName,saleswithkey.SalesQuantity from geography
join saleswithkey on geography.GeographyKey=saleswithkey.GeographyKey
having SalesQuantity >100
order by StateProvinceName desc;












