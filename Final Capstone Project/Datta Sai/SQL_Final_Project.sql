
SELECT category_lookup.Category,count(category_lookup.Category) as CATEGORY_COUNT,avg(shopping_final.Purchase_Amount) as AVG_PURCHASE_AMT,sum(shopping_final.Purchase_Amount) as TOTAL_PURCHASE_AMT, max(shopping_final.Purchase_Amount) as HIGHEST_PURCHASE_AMT, min(shopping_final.Purchase_Amount) as LOWEST_PURCHASE_AMT
from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
group by Category; /* 1 */

select item_lookup.Item_Purchased,count(item_lookup.Item_Purchased) as ITEM_COUNT,avg(shopping_final.Purchase_Amount) as AVG_PURCHASE_AMT,sum(shopping_final.Purchase_Amount) as TOTAL_PURCHASE_AMT, max(shopping_final.Purchase_Amount) as HIGHEST_PURCHASE_AMT, min(shopping_final.Purchase_Amount) as LOWEST_PURCHASE_AMT
from shopping_final
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
group by Item_Purchased;  /* 2 */

select shipping_lookup.Shipping_Type,item_lookup.Item_Purchased,count(shipping_lookup.Shipping_Type) as SHIPPING_COUNT,avg(shopping_final.Purchase_Amount) as AVG_PURCHASE_AMT,sum(shopping_final.Purchase_Amount) as TOTAL_PURCHASE_AMT, max(shopping_final.Purchase_Amount) as HIGHEST_PURCHASE_AMT, min(shopping_final.Purchase_Amount) as LOWEST_PURCHASE_AMT
from shopping_final
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
group by Shipping_Type,Item_Purchased
order by Shipping_Type; /* 3 */

select item_lookup.Item_Purchased,payment_lookup.Payment_Method,shopping_final.Discount_Applied,shopping_final.Promo_Code_Used,count(item_lookup.Item_Purchased) as ITEM_COUNT,sum(shopping_final.Purchase_Amount)
from shopping_final
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
group by Payment_Method,Discount_Applied,Item_Purchased,Promo_Code_Used;/* 4 */

select category_lookup.Category,item_lookup.Item_Purchased,shopping_final.Promo_Code_Used,avg(shopping_final.Previous_Purchases),sum(shopping_final.Previous_Purchases),max(shopping_final.Previous_Purchases)
from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
group by Category,Item_Purchased,Promo_Code_Used
order by Item_Purchased; /* 5 */

select category_lookup.Category,item_lookup.Item_Purchased,sum(shopping_final.Purchase_Amount) as PURCHASE_AMOUNT,sum(shopping_final.Previous_Purchases) as PREVIOUS_PURCHASE,SUM(shopping_final.Purchase_Amount)-SUM(shopping_final.Previous_Purchases) as PURCHASE_DIFF
from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
group by Category,Item_Purchased;  /* 6 */


select category_lookup.Category, item_lookup.Item_Purchased, payment_lookup.Payment_Method, shipping_lookup.Shipping_Type,sum(shopping_final.Purchase_Amount)
from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
where Category='Clothing' and not Payment_Method = 'Cash' and not Shipping_Type= 'Free Shipping'
group by Item_Purchased,Payment_Method,Shipping_Type
having sum(shopping_final.Purchase_Amount) > 100
order by Item_Purchased;	/* 7 */


select season_lookup.Season,category_lookup.Category,gender_lookup.Gender, sum(shopping_final.Purchase_Amount),sum(shopping_final.Previous_Purchases)
from shopping_final
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
group by Season,Category,Gender;/* 8 */

select item_lookup.Item_Purchased,shopping_final.Promo_Code_Used,sum(shopping_final.Purchase_Amount) as TOTAL_PURCHASE_AMT,max(shopping_final.Purchase_Amount) AS HIGHEST_PURCHASE_AMT,min(shopping_final.Purchase_Amount) as LOWESR_PURCHASE_AMT,sum(shopping_final.Previous_Purchases) as TOTAL_PREVIOUS_PURCHASE_AMT,max(shopping_final.Previous_Purchases) as HIGHEST_PREVIOUS_PURCHASE_AMT,min(shopping_final.Previous_Purchases) as LOWEST_PREVIOUS_PURCHASE_AMT
from shopping_final
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
group by Item_Purchased,Promo_Code_Used;  /* 9 */


select category_lookup.Category,season_lookup.Season,item_lookup.Item_Purchased,sum(shopping_final.Purchase_Amount) as Total_Purchase_Amount
from shopping_final
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
where Item_Purchased in ('Sweater','Coat', 'Jacket','Hoodie','T-shirt','Socks') and Season in ('Winter')
group by Season,Item_Purchased,Category;  /* 10 */

select season_lookup.Season,category_lookup.Category,item_lookup.Item_Purchased,sum(shopping_final.Previous_Purchases), sum(shopping_final.Purchase_Amount)
from shopping_final
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
where Item_Purchased not in ('Shirt','Shorts','Sunglasses','Hat') and Season in ('Summer')
group by Category,Season,Item_Purchased;  /* 11 */

select category_lookup.Category,location_lookup.Location,shipping_lookup.Shipping_Type,sum(shopping_final.Purchase_Amount)
from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
where Shipping_Type in ('Express', 'Next Day Air')
group by Category,Location,Shipping_Type
having sum(shopping_final.Purchase_Amount) < 200; /* 12 */


select item_lookup.Item_Purchased,count(shopping_final.Color),shopping_final.Size, max( shopping_final.Purchase_Amount) as PURCHASE_AMOUNT
from shopping_final
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
where Review_Rating>3
group by Size,Review_Rating,Item_Purchased; /* 13 */

select category_lookup.Category,item_lookup.Item_Purchased,gender_lookup.Gender,shopping_final.Age,shopping_final.Purchase_Amount from shopping_final
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
where Age> (select avg(Age) from shopping_final) and Purchase_Amount > (select avg(Purchase_Amount) from shopping_final);  /* 14 */

select season_lookup.Season,category_lookup.Category,shopping_final.Discount_Applied,sum(shopping_final.Purchase_Amount) from shopping_final
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
where season in ('Winter','Summer')
group by Season,Discount_Applied,Category; /* 15 */

select season_lookup.Season,count(season_lookup.Season),avg(shopping_final.Purchase_Amount),sum(shopping_final.Purchase_Amount),max(shopping_final.Purchase_Amount),min(shopping_final.Purchase_Amount)
from shopping_final
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
group by Season; /* 16 */

select category_lookup.Category,item_lookup.Item_Purchased,max(shopping_final.Purchase_Amount) as HIGHEST_PURCHASE_AMT,sum(shopping_final.Purchase_Amount) as TOTAL_PURCHASE_AMT
from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
group by Category,Item_Purchased;  /* 17 */

select location_lookup.Location,shipping_lookup.Shipping_Type,payment_lookup.Payment_Method,sum(shopping_final.Purchase_Amount) as TOTAL_PURCHASE_AMT
from shopping_final
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
join payment_lookup on payment_lookup.Payment_index-shopping_final.Payment_index
group by Location,Shipping_Type,Payment_Method;  /* 18 */

select season_lookup.Season,category_lookup.Category,gender_lookup.Gender,item_lookup.Item_Purchased,shopping_final.Size,sum(shopping_final.Purchase_Amount) from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
group by Season,Category,Gender,Item_Purchased,Size;  /* 19  */ 


select  category_lookup.Category,item_lookup.Item_Purchased,shopping_final.Color,shopping_final.Size,location_lookup.Location,payment_lookup.Payment_Method,shopping_final.Subscription_Status,shipping_lookup.Shipping_Type,gender_lookup.Gender,shopping_final.Age,shopping_final.Discount_Applied,shopping_final.Promo_Code_Used,shopping_final.Previous_Purchases,shopping_final.Purchase_Amount,shopping_final.Review_Rating
from shopping_final
join category_lookup on category_lookup.Category_index = shopping_final.Category_index
join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join payment_lookup on payment_lookup.Payment_index =shopping_final.Payment_index
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
where Age > (select avg(Age) from shopping_final) and Location in ('New Mexico','South Carolina','California','New York','Washington') and Review_Rating > 3
order by Location;  /* 20 */

select category_lookup.Category,location_lookup.Location,shipping_lookup.Shipping_Type,sum(shopping_final.Purchase_Amount)
from shopping_final
join category_lookup on category_lookup.Category_index = shopping_final.Category_index
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
group by Location,Category,Shipping_Type;  /* 21 */

select  category_lookup.Category,item_lookup.Item_Purchased,shopping_final.Color,shopping_final.Size,location_lookup.Location,payment_lookup.Payment_Method,season_lookup.Season,shipping_lookup.Shipping_Type,gender_lookup.Gender,shopping_final.Age,shopping_final.Discount_Applied,shopping_final.Previous_Purchases,shopping_final.Promo_Code_Used,shopping_final.Subscription_Status ,shopping_final.Purchase_Amount,shopping_final.Review_Rating
from shopping_final
join category_lookup on category_lookup.Category_index = shopping_final.Category_index
join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join payment_lookup on payment_lookup.Payment_index =shopping_final.Payment_index
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
where Age between 20 and 40 and Purchase_Amount > (select avg(Purchase_Amount) from shopping_final) and Previous_Purchases > (select avg(Previous_Purchases) from shopping_final) and Size = 'XL' and Review_Rating > 4
order by Age;	/* 22 */

select  category_lookup.Category,item_lookup.Item_Purchased,shopping_final.Color,shopping_final.Size,season_lookup.Season,shipping_lookup.Shipping_Type,gender_lookup.Gender,shopping_final.Age,shopping_final.Discount_Applied,shopping_final.Promo_Code_Used,shopping_final.Subscription_Status,location_lookup.Location,payment_lookup.Payment_Method,shopping_final.Purchase_Amount,shopping_final.Review_Rating 
from shopping_final
join category_lookup on category_lookup.Category_index = shopping_final.Category_index
join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join payment_lookup on payment_lookup.Payment_index =shopping_final.Payment_index
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
where Age between 20 and 30 and Gender= 'Male' and Item_Purchased in ('Sneakers','Shoes','Sunglasses','Boots','Hat') and Review_Rating > 4 and Size not in ('S','M') and Discount_Applied not in ('No')
order by Age;	/* 23 */












