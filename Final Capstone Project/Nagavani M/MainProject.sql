use project4;
select category.Category,item.ItemPurchased,gender.Gender from shopping_final
join  category on category.Category_index=shopping_final.Category_index
join item on item.Item_index=shopping_final.Item_index
join gender on gender.Gender_index=shopping_final.Gender_index
having Category = "Accessories" and Gender='Female';

select location.Location,item.ItemPurchased,gender.Gender,avg(shopping_final.Age) as avg_age from shopping_final
join item on item.Item_index=shopping_final.Item_index
join location on location.Location_index=shopping_final.Location_index
join gender on gender.Gender_index=shopping_final.Gender_index
where Age >(select avg(shopping_final.Age) from shopping_final) and  item.ItemPurchased <
(select count(item.ItemPurchased) from shopping_final)
group by ItemPurchased,Gender,Location;

select location.Location,category.Category,shipping.ShippingType,shopping_final.PurchaseAmount from shopping_final
join location on location.Location_index=shopping_final.Location_index
join  category on category.Category_index=shopping_final.Category_index
join shipping on shipping.Shippping_index=shopping_final.Shipping_index
having Location='Hawaii' and ShippingType='Free Shipping' and Category='Clothing'
order by PurchaseAmount desc ;

select location.Location,item.ItemPurchased, shopping_final.Color,count(gender.Gender) as count_gender from shopping_final
join location on location.Location_index=shopping_final.Location_index
join gender on gender.Gender_index=shopping_final.Gender_index
join item on item.Item_index=shopping_final.Item_index
group by Location,Gender,ItemPurchased,Color
order by count_gender desc limit 15;

select season.Season,item.ItemPurchased,shopping_final.DiscountApplied from shopping_final
join season on season.Season_index= shopping_final.Season_index
join item on item.Item_index=shopping_final.Item_index
having Season = 'Winter' and DiscountApplied='Yes';

select  season.Season,count(item.ItemPurchased) as count_ItemsPurchased,shopping_final.PurchaseAmount from shopping_final
join season on season.Season_index=shopping_final.Season_index
join item on item.Item_index=shopping_final.Item_index
where PurchaseAmount=(select max(PurchaseAmount) from shopping_final)
group by Season,PurchaseAmount 
order by count_ItemsPurchased desc;

select category.Category,payment.PaymentMethod,shopping_final.PreviousPurchases,shopping_final.PurchaseAmount from shopping_final
join  category on category.Category_index=shopping_final.Category_index
join payment on payment.Payment_index=shopping_final.Payment_index
having  category='Footwear' and  PurchaseAmount>80;

select gender.Gender,avg(shopping_final.Age) as avg_age from shopping_final
join gender on gender.Gender_index=shopping_final.Gender_index
where Age > (select avg(shopping_final.Age) from shopping_final)
group by Gender;

select category.Category,payment.PaymentMethod,shopping_final.ReviewRating from shopping_final
join payment on payment.Payment_index=shopping_final.Payment_index
join  category on category.Category_index=shopping_final.Category_index
having Category= 'Outerwear' and ReviewRating >4.5 ;

select item.ItemPurchased,payment.PaymentMethod,count(shopping_final.PromoCodeUsed) as count_promocode from shopping_final
join item on item.Item_index=shopping_final.Item_index
join payment on payment.Payment_index=shopping_final.Payment_index
group by ItemPurchased,PaymentMethod
having PaymentMethod='Cash';

select  category.Category,gender.Gender,count(item.ItemPurchased) as count_items, avg(shopping_final.PreviousPurchases) as avg_previouspurchases from shopping_final
join  category on category.Category_index=shopping_final.Category_index
join gender on gender.Gender_index=shopping_final.Gender_index
join item on item.Item_index=shopping_final.Item_index
group by Category,Gender;
 
select category.Category,max(item.ItemPurchased) as max_itempurchased,shopping_final.Color from shopping_final
join  category on category.Category_index=shopping_final.Category_index
join item on item.Item_index=shopping_final.Item_index
group by Category,ItemPurchased,Color 
having Category='Footwear';

select location.Location,payment.PaymentMethod,count(shopping_final.PromoCodeUsed) as count_PromoCodeUsed from shopping_final
join location on location.Location_index=shopping_final.Location_index
join payment on payment.Payment_index=shopping_final.Payment_index
group by Location,PaymentMethod
having PaymentMethod = 'Cash' and count_PromoCodeUsed>10
order by count_PromoCodeUsed desc limit 10;

select  season.Season,gender.Gender,count(item.ItemPurchased) as count_ItemsPurchased  from shopping_final
join season on season.Season_index= shopping_final.Season_index
join gender on gender.Gender_index=shopping_final.Gender_index
join item on item.Item_index=shopping_final.Item_index
group by Gender,Season,ItemPurchased 
order by count_ItemsPurchased desc limit 10;

select category.Category,count(shopping_final.Color) as count_color from shopping_final
join  category on category.Category_index=shopping_final.Category_index
group by Category
order by count_color desc;

select  season.Season,shipping.ShippingType,min(shopping_final.PreviousPurchases) as previouspurchases,shopping_final.ReviewRating from shopping_final
join season on season.Season_index= shopping_final.Season_index
join shipping on shipping.Shippping_index= shopping_final.Shipping_index
where PreviousPurchases >(select min(shopping_final.PreviousPurchases )from shopping_final)
group by Season,ShippingType,previouspurchases,ReviewRating
order by previouspurchases desc;




