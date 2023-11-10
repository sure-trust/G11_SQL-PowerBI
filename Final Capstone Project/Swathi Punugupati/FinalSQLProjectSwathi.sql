use finalsqlproject;
/*Q1*/
select * from finalsqlproject.shopping_final
where Age > (select avg(Age) from finalsqlproject.shopping_final);

/*Q2*/
select shopping_final.CustomerID,category_lookup.Category,shopping_final.Age from shopping_final
join category_lookup on shopping_final.Category_index=category_lookup.Category_index
where Age > (select avg(Age) from shopping_final);

/*Q3*/
select category_lookup.Category,item_lookup.ItemPurchased,gender_lookup.Gender from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
having Gender="Female";

/*Q4*/
SELECT category_lookup.Category,payment_lookup.PaymentMethod,shopping_final.ReviewRating from shopping_final
join payment_lookup ON payment_lookup.Payment_index=shopping_final.Payment_index
join category_lookup ON category_lookup.Category_index=shopping_final.Category_index
having Category="Accessories" and ReviewRating>3;

/*Q5*/
SELECT location_lookup.Location,season_lookup.Season,sum(shopping_final.PurchaseAmount) as TotPurAmount from shopping_final
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
group by location_lookup.Location,season_lookup.Season
order by TotPurAmount;

/*Q6*/
Select category_lookup.Category,gender_lookup.Gender,Location_lookup.Location from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
join Location_lookup on Location_lookup.Location_index=shopping_final.Location_index
Having category = "Footwear" and Gender="Male";

/*Q7*/
select location_lookup.location,season_lookup.Season,sum(shopping_final.PurchaseAmount) as TotPurAmount from shopping_final
join location_lookup on location_lookup.location_index=shopping_final.location_index
join season_lookup on season_lookup.season_index=shopping_final.Season_index
group by location_lookup.location,season_lookup.Season
order by TotPurAmount desc;

/*Q8*/
select location_lookup.location,season_lookup.Season,sum(shopping_final.PurchaseAmount) as TotPurAmount from shopping_final
join location_lookup on location_lookup.location_index=shopping_final.location_index
join season_lookup on season_lookup.season_index=shopping_final.Season_index
group by location_lookup.location,season_lookup.Season
Having Season="Summer"
order by TotPurAmount Asc;

/*Q9*/
select location_lookup.Location,item_lookup.ItemPurchased,payment_lookup.PaymentMethod from shopping_final
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
Having PaymentMethod ="Debit Card"
Order by PaymentMethod desc;

/*Q10*/
select location_lookup.Location,item_lookup.ItemPurchased,payment_lookup.PaymentMethod from shopping_final
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
Having PaymentMethod ="PayPal" and Location ="Rhode Island"
Order by PaymentMethod desc;


/*Q11*/
select location_lookup.Location,item_lookup.ItemPurchased,payment_lookup.PaymentMethod,gender_lookup.gender from shopping_final
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
join gender_lookup on gender_lookup.gender_index=shopping_final.gender_index
Having ItemPurchased ="Sweater"
Order by Location desc;

/*Q12*/
select category_lookup.Category,location_lookup.Location,count(shopping_final.PurchaseAmount) as PurchaseAmount from category_lookup
join shopping_final on category_lookup.Category_index=shopping_final.Category_index
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
group by Category,Location
order by PurchaseAmount;

/*Q13*/
select category_lookup.Category,season_lookup.Season,shipping_lookup.ShippingType,shopping_final.PurchaseAmount from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join season_lookup on season_lookup.Season_index=shopping_final.Season_index
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
having Season="Summer" and ShippingType="Standard"
order by PurchaseAmount desc
limit 10;

/*Q14*/
select category_lookup.Category,payment_lookup.PaymentMethod,shopping_final.PurchaseAmount,shopping_final.ReviewRating from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
where ReviewRating > (select avg(ReviewRating) from shopping_final);

/*Q15*/
select category_lookup.Category,location_lookup.Location,shopping_final.PurchaseAmount,shopping_final.ReviewRating from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
where PurchaseAmount < (select avg(PurchaseAmount) from shopping_final) and ReviewRating < (select avg(ReviewRating) from shopping_final);

/*Q16*/
SELECT category_lookup.Category,payment_lookup.PaymentMethod,shopping_final.ReviewRating,shopping_final.Age from shopping_final
join payment_lookup ON payment_lookup.Payment_index=shopping_final.Payment_index
join category_lookup ON category_lookup.Category_index=shopping_final.Category_index
where ReviewRating > (select avg(ReviewRating) from shopping_final) and Age>30;

/*Q17*/
select category_lookup.Category,avg(shopping_final.PurchaseAmount) as PurchaseAmount ,avg(shopping_final.ReviewRating) as ReviewRating from shopping_final
right join category_lookup on category_lookup.Category_index=shopping_final.Category_index
where PurchaseAmount>10 and ReviewRating>2.5
group by Category;

/*Q18*/
select location_lookup.Location,gender_lookup.Gender,shopping_final.Color,shopping_final.Size from shopping_final
inner join location_lookup on location_lookup.Location_index=shopping_final.Location_index
inner join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
where Gender="Female" and Size="M" and Color="Yellow"
order by Location asc;

/*Q19*/
select item_lookup.ItemPurchased,shopping_final.Color,count(shopping_final.SubscriptionStatus) as subscriptionStatus from shopping_final
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
group by ItemPurchased,Color;

/*Q20*/
select location_lookup.Location,shopping_final.Age,count(shopping_final.CustomerID) as TotCustomer from shopping_final
 join location_lookup on location_lookup.Location_index=shopping_final.Location_index
group by Location,Age;

/*Q21*/
select location_lookup.Location, payment_lookup.PaymentMethod,count(shopping_final.CustomerID) as customers from shopping_final
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
group by PaymentMethod,Location
order by customers desc;

/*Q22*/
select location_lookup.Location,category_lookup.Category,item_lookup.ItemPurchased,payment_lookup.PaymentMethod,shopping_final.PurchaseAmount from shopping_final
join location_lookup on location_lookup.Location_index=shopping_final.Location_index
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
having Category="Accessories" and PaymentMethod="Cash" and ItemPurchased="Jewelry"
order by Location;

/*Q23*/
select category_lookup.Category,item_lookup.ItemPurchased,payment_lookup.PaymentMethod,shipping_lookup.ShippingType,shopping_final.PurchaseAmount from shopping_final
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
join shipping_lookup on shipping_lookup.Shippping_index=shopping_final.Shipping_index
having Category="Clothing" and ShippingType="Free Shipping";

/*Q24*/
select gender_lookup.Gender,category_lookup.Category,item_lookup.ItemPurchased,shopping_final.Color,shopping_final.Size from shopping_final
join gender_lookup on gender_lookup.Gender_index=shopping_final.Gender_index
join category_lookup on category_lookup.Category_index=shopping_final.Category_index
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
having Gender="Female" and Category="Clothing" and ItemPurchased="Blouse" and Size="M"
order by Color;

/*Q25*/
select item_lookup.ItemPurchased,payment_lookup.PaymentMethod,shopping_final.PurchaseAmount,shopping_final.Age from shopping_final
join item_lookup on item_lookup.Item_index=shopping_final.Item_index
join payment_lookup on payment_lookup.Payment_index=shopping_final.Payment_index
where PurchaseAmount < (select avg(PurchaseAmount) from shopping_final) and Age < (select avg(Age) from shopping_final)
order by ItemPurchased;
