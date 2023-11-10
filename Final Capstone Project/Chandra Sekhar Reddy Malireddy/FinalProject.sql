/*1*/
select location_lookup.location,Count(shopping.CustomerID) as NoofCustomer,sum(shopping.PurchaseAmount) as TotalRevenue from shopping
join location_lookup on location_lookup.Location_index=shopping.Location_index
where location_lookup.location like "a%"
group by location_lookup.location;



/*2*/
select location_lookup.location,Count(shopping.CustomerID) as NoofCustomer from shopping
join location_lookup on location_lookup.Location_index=shopping.Location_index
group by location_lookup.location 
having NoofCustomer > 50;




/*3*/
select location_lookup.location,shipping_lookup.ShippingType,Count(shopping.CustomerID) as NoofCustomer,round(avg(shopping.ReviewRating),1) as AverageRating from shopping
join location_lookup on location_lookup.Location_index=shopping.Location_index
join shipping_lookup on shipping_lookup.shippping_index=shopping.shipping_index
group by location_lookup.location,shipping_lookup.ShippingType
order by location_lookup.location;





/*4*/
select season_lookup.Season,category_lookup.Category,item_lookup.ItemPurchased,count(shopping.CustomerID) as NoofCustomers from shopping
join season_lookup on season_lookup.Season_index=shopping.Season_index
join category_lookup on category_lookup.Category_index=shopping.Category_index
join item_lookup on item_lookup.Item_index=shopping.Item_index
group by season_lookup.Season,category_lookup.Category,item_lookup.ItemPurchased
having NoofCustomers>40
order by season_lookup.Season;



/*5*/
select location_lookup.Location,season_lookup.Season,sum(shopping.PurchaseAmount) as TotalRevenue from shopping
join location_lookup on location_lookup.Location_index=shopping.Location_index
join season_lookup on season_lookup.Season_index=shopping.Season_index
group by location_lookup.Location,season_lookup.Season
having TotalRevenue >1000
order by location_lookup.Location desc;





/*6*/
select season_lookup.Season,category_lookup.Category,gender_lookup.Gender,count(gender_lookup.Gender) as Count,sum(shopping.PurchaseAmount) as Total_Revenue from shopping
join season_lookup on season_lookup.Season_index=shopping.Season_index
join category_lookup on category_lookup.Category_index=shopping.Category_index
join gender_lookup on gender_lookup.Gender_index =shopping.Gender_index
group by season_lookup.Season,category_lookup.Category,gender_lookup.Gender
order by category_lookup.Category desc;



/*7*/
select category_lookup.Category,count(shopping.color) as QuantitySold ,shopping.Size,max(shopping.Color) as Max_sales,sum(shopping.PurchaseAmount) as TotalRevenue from shopping
join season_lookup on season_lookup.Season_index=shopping.Season_index
join category_lookup on category_lookup.Category_index=shopping.Category_index
join item_lookup on item_lookup.Item_index=shopping.Item_index
group by category_lookup.Category,shopping.size,shopping.Color
order by TotalRevenue desc;



/*8*/
select location_lookup.Location,sum(shopping.PurchaseAmount) as TotalRevenue,round(avg(shopping.ReviewRating),1) as AverageRating from shopping
join location_lookup on location_lookup.Location_index=shopping.Location_index
where shopping.PurchaseAmount > (select avg(shopping.PurchaseAmount) from shopping)
group by location_lookup.Location
order by TotalRevenue desc;



/*9*/
select location_lookup.location,season_lookup.Season,gender_lookup.Gender,Count(shopping.CustomerID) as NoofCustomer from shopping
join location_lookup on location_lookup.Location_index=shopping.Location_index
join season_lookup on season_lookup.Season_index=shopping.Season_index
join gender_lookup on gender_lookup.Gender_index =shopping.Gender_index
group by location_lookup.location,season_lookup.Season,gender_lookup.Gender;

/*10*/
select item_lookup.ItemPurchased,shopping.Color,shopping.ReviewRating from shopping
join category_lookup on category_lookup.Category_index=shopping.Category_index
join item_lookup on item_lookup.Item_index=shopping.Item_index
where shopping.ReviewRating > (select avg(shopping.ReviewRating) from shopping)
order by shopping.ReviewRating;

/*11*/
select category_lookup.Category,gender_lookup.Gender,count(gender_lookup.Gender) as Count,payment_lookup.paymentMethod from shopping
join season_lookup on season_lookup.Season_index=shopping.Season_index
join category_lookup on category_lookup.Category_index=shopping.Category_index
join gender_lookup on gender_lookup.Gender_index =shopping.Gender_index
join payment_lookup on payment_lookup.payment_index = shopping.Payment_Index
group by category_lookup.Category,gender_lookup.Gender,payment_lookup.paymentMethod 
order by category_lookup.Category,Count asc;

/*12*/
select season_lookup.Season ,category_lookup.Category,count(shopping.PreviousPurchases) as SalesQuantity from shopping
join season_lookup on season_lookup.Season_index=shopping.Season_index
join category_lookup on category_lookup.Category_index=shopping.Category_index
where shopping.PreviousPurchases <(select avg(shopping.PreviousPurchases) from shopping)
group by season_lookup.Season,category_lookup.Category;

/*13*/
select season_lookup.Season ,ItemPurchased,shopping.color,count(shopping.color) as NoofColors_sold from shopping
join season_lookup on season_lookup.Season_index=shopping.Season_index
join item_lookup on item_lookup.Item_index=shopping.Item_index
group by season_lookup.Season, ItemPurchased,shopping.color
order by season_lookup.Season,NoofColors_sold desc ;

/*14*/
select season_lookup.Season,payment_lookup.PaymentMethod,count(shopping.CustomerID) as NoofCustomers_used from shopping
join payment_lookup on payment_lookup.Payment_index=shopping.Payment_index
join season_lookup on season_lookup.Season_index=shopping.Season_index
group by  season_lookup.Season,payment_lookup.PaymentMethod
order by season_lookup.Season,NoofCustomers_used desc;

/*15*/
select  season_lookup.Season,category_lookup.Category,count(shopping.SubscriptionStatus) as Noof_Subscriptions,count(shopping.PromoCodeUsed) as Noof_PromoCodeUsed from shopping
join season_lookup on season_lookup.Season_index=shopping.Season_index
join category_lookup on category_lookup.Category_index=shopping.Category_index
group by season_lookup.Season,category_lookup.Category;

# 16
select  category_lookup.category ,shopping.color,PreviousPurchases as Noof_Quantity,
case
when PreviousPurchases >25 then "HighQuantity_Sold"
when PreviousPurchases then "LowQuantity_Sold"
end as Statusof_sales
from shopping join category_lookup on category_lookup.Category_index=shopping.Category_index;

# 17
select season_lookup.Season,category_lookup.Category,shopping.PurchaseAmount,shopping.PreviousPurchases as Quantity, sum(shopping.PurchaseAmount*shopping.PreviousPurchases) as TotalAmount from shopping
join category_lookup on category_lookup.Category_index=shopping.Category_index
join season_lookup on season_lookup.Season_index=shopping.Season_index
group by season_lookup.Season,category_lookup.Category,shopping.PurchaseAmount,shopping.PreviousPurchases
order by TotalAmount desc;

#18
select category_lookup.Category,gender_lookup.Gender,count(gender_lookup.Gender) as Count,sum(PurchaseAmount) as SalesAmount from shopping
join category_lookup on category_lookup.Category_index=shopping.Category_index
join gender_lookup on gender_lookup.Gender_index =shopping.Gender_index
group by category_lookup.Category,gender_lookup.Gender
order by category_lookup.Category,Count asc;

#19
select location_lookup.location,item_lookup.ItemPurchased,sum(PurchaseAmount)  PurchasedAmount from shopping
join location_lookup on location_lookup.Location_index=shopping.Location_index
join item_lookup on item_lookup.Item_index=shopping.Item_index
group by location_lookup.location,item_lookup.ItemPurchased
order by location_lookup.location,ItemPurchased desc;

#20
select location_lookup.location,season_lookup.Season,max(PurchaseAmount) as Max_Amount from shopping
join location_lookup on location_lookup.Location_index=shopping.Location_index
join season_lookup on season_lookup.Season_index=shopping.Season_index
group by location_lookup.location,season_lookup.Season
order by location_lookup.location,Max_Amount desc; 