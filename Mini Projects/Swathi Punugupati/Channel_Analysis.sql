/*1*/
select chanel.Chanel,count(customer.CustomerNames) as no_of_customer from chanel
join sales on chanel.ChanelnIndex=sales.ChanelIndex
join customer on customer.CustomerIndex=sales.ChanelIndex
group by chanel.Chanel;

/*2*/
select chanel.Chanel,product.ProductIndex from product
join sales on product.ProductIndex=sales.ProductIndex
join chanel on chanel.ChanelnIndex=sales.ChanelIndex;

/*3*/
select chanel.Chanel,sales.LineTotal,region.population from chanel
join sales on sales.ChanelIndex=chanel.ChanelnIndex
join region on sales.RegionIndex=region.RegionIndex
order by population desc;

/*4*/
select chanel.Chanel,sales.OrderQuantity,region.households,product.ProductName from chanel
join sales on sales.ChanelIndex=chanel.ChanelnIndex
join region on region.RegionIndex=sales.RegionIndex
join product on product.ProductIndex=sales.ProductIndex;

/*5*/
select chanel.chanel,avg(sales.UnitPrice) as avg_Unitprice from chanel
right join sales on chanel.ChanelnIndex=sales.ChanelIndex
group by chanel;

/*6*/
select chanel.Chanel,avg(sales.UnitPrice) as avg_unitprice,avg(sales.TotalUnitCost)  as avg_totalcost from chanel
right join sales on chanel.ChanelnIndex=sales.ChanelIndex
where UnitPrice>10 and TotalUnitCost>10
group by chanel;





