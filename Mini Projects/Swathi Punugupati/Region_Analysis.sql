/*1*/
select regionlookup_area.Area,regionlookup_type.typecdp,reionlookup_county.county,region.median_income from region
join regionlookup_area on regionlookup_area.Area_Id=region.Areaindex
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
group by Area,typecdp,county,median_income;

/*2*/
select chanel.Chanel,product.ProductName,region.households,region.population,sales.UnitPrice from sales
join chanel on  chanel.ChanelnIndex=sales.ChanelIndex
join product on product.ProductIndex=sales.ProductIndex
join region on region.RegionIndex=sales.RegionIndex;

 /*3*/
 select regionlookup_type.typecdp,region.households,region.population,reionlookup_county.county from region
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
where households>1000;
 /*4*/
 select regionlookup_type.typecdp,region.households,region.population,reionlookup_county.county from region
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
join reionlookup_county on reionlookup_county.County_Id=region.Countyindex
where households> (select avg(households) from region);

/*5*/
select regionlookup_area.Area,region.median_income,region.population,regionlookup_type.typecdp from region
join regionlookup_area on regionlookup_area.Area_Id=region.Areaindex
join regionlookup_type on regionlookup_type.Type_Id=region.CDPindex
where median_income>40000 and population>2000;

/*6*/
select product.ProductName,product.ProductCategory,sales.UnitPrice+sales.TotalUnitCost as Total from product
inner join sales on product.ProductIndex=sales.ProductIndex
where ProductCategory="Category 10"
having Total>500;


 
