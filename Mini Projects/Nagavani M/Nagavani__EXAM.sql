use project2;
select geography.ContinentName, geography.CityName, saleswithkey.SalesAmount from geography
join saleswithkey on geography.GeographyKey=saleswithkey.GeographyKey;

select productcategory.ProductCategoryName, count(productsubcategory.ProductSubcategoryKey) as No_of_subcategory from productcategory
join productsubcategory on productcategory.ProductCategoryKey=productsubcategory.ProductCategoryKey
 group by ProductCategoryName;
 
 select productsubcategory.ProductSubcategoryName, avg(saleswithkey.UnitPrice) as Avg_unit_price, avg(saleswithkey.UnitCost) as Avg_unit_cost
 from productsubcategory join product on productsubcategory.ProductSubcategoryKey=product.ProductSubcategoryKey
 join saleswithkey on product.ProductKey=saleswithkey.ProductKey
 group by ProductSubcategoryName
 having Avg_unit_price>200;

select geography.StateProvinceName,max(saleswithkey.SalesQuantity) as salesquantity from geography
join saleswithkey on geography.GeographyKey = saleswithkey.GeographyKey  group by StateProvinceName
having  salesquantity > 100 ;

select productsubcategory.ProductSubcategoryName, product.ClassName from productsubcategory
 join product on productsubcategory.ProductSubcategoryKey=product.ProductSubcategoryKey
