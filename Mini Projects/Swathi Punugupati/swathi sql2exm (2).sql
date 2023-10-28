use project3;
select geography.ContinentName,geography.CityName,saleswithkey.SalesAmount from geography
inner join saleswithkey on geography.GeographyKey=saleswithkey.GeographyKey
where ContinentName="North America" or ContinentName="Europe";


select prodcategory.ProductCategoryName,count(prodsubcategory.ProductSubcategoryName) as no_of_subcategory from prodcategory
inner join prodsubcategory on prodcategory.ProductCategoryKey=prodsubcategory.ProductCategoryKey
group by ProductCategoryName;

select prodsubcategory.ProductSubcategoryName,avg(product.UnitPrice) as avgprice ,avg(product.UnitCost) as avgcost  from prodsubcategory
inner join product on prodsubcategory.ProductSubcategoryKey=product.ProductSubcategoryKey
group by ProductSubcategoryName
having avgcost>100;



select geography.StateProvinceName,saleswithkey.SalesQuantity from geography
 join saleswithkey on geography.GeographyKey=saleswithkey.GeographyKey
having SalesQuantity>100;


select prodsubcategory.ProductSubcategoryName,product.ClassName from prodsubcategory
join product on prodsubcategory.ProductSubcategoryKey=product.ProductSubcategoryKey
where prodsubcategory.ProductSubcategoryName="MP4&MP3" and  not  product.ClassName="Deluxe";


