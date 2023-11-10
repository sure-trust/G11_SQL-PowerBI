
#1
select shopping_final.CustomerID,season.Season,max(category.ProductCategory) as MostOrderedProductCategory,shopping_final.Age from shopping_final
join season on season.Season_index = shopping_final.Season_index
join category on category.Category_index = shopping_final.Category_index
where Age > (select avg(Age) from shopping_final)
group by CustomerID,Season,Age;


#2
select gender.Gender,category.ProductCategory,avg(shopping_final.PurchaseAmount_USD) as Average_Purchase_Amount from shopping_final
join gender on gender.Gender_index = shopping_final.Gender_index
join category on category.Category_index = shopping_final.Category_index
group by Gender,ProductCategory;



#3
select location.Location,count(item.ItemPurchased) as Total_ItemsPurchased from shopping_final
join location on location.Location_index = shopping_final.Location_index
join item on item.Item_index = shopping_final.Item_index
group by Location
order by Total_ItemsPurchased desc;


#4
select shopping_final.CustomerID,season.Season,max(payment.PaymentMethod) as MostUsedPaymentMethod from shopping_final
join season on season.Season_index = shopping_final.Season_index
join payment on payment.Payment_index = shopping_final.Payment_index
group by CustomerID,Season
order by MostUsedPaymentMethod;


#5
select location.location ,category.ProductCategory,shopping_final.ReviewRating from shopping_final
join category on category.Category_index = shopping_final.Category_index
join location on location.Location_index = shopping_final.Location_index
where ReviewRating > (select avg(ReviewRating) from shopping_final)
order by ReviewRating desc;


#6
select season.Season,category.ProductCategory,count(item.ItemPurchased) as Purchased_Items  from shopping_final
join season on season.Season_index = shopping_final.Season_index
join category on category.Category_index = shopping_final.Category_index
join item on item.Item_index = shopping_final.Item_index
group by Season,ProductCategory
order by Purchased_Items desc;



#7
select location.Location,season.Season,gender.Gender,max(item.ItemPurchased) as Most_PurchasedItems from shopping_final
join location on location.Location_index = shopping_final.Location_index
join season on season.Season_index = shopping_final.Season_index
join gender on gender.Gender_index = shopping_final.Gender_index
join item on item.Item_index = shopping_final.Item_index
group by Location,Season,Gender 
order by Most_PurchasedItems desc;


#8
select shopping_final.CustomerID,location.Location,category.ProductCategory,payment.PaymentMethod from shopping_final
join location on location.Location_index = shopping_final.Location_index
join category on category.Category_index = shopping_final.Category_index
join payment on payment.Payment_index = shopping_final.Payment_index
where PaymentMethod = "Cash" or PaymentMethod = "Credit Card";


#9
select season.season ,gender.Gender,shopping_final.Color,count(item.ItemPurchased) as ItemsPurchased from shopping_final
join gender on gender.Gender_index = shopping_final.Gender_index
join item on item.Item_index = shopping_final.Item_index
join season on season.Season_index = shopping_final.Season_index
where ItemPurchased = "Backpack" or ItemPurchased = "T-shirt" 
group by Gender,Color,season
order by ItemsPurchased desc;


#10
select shopping_final.CustomerID ,location.Location,category.ProductCategory,shipping.ShippingType,shopping_final.PurchaseAmount_USD from shopping_final
join location on location.Location_index = shopping_final.Location_index
join category on category.Category_index = shopping_final.Category_index
join shipping on shipping.Shippping_index = shopping_final.Shipping_index
order by PurchaseAmount_USD desc
limit 10;


#11
select shopping_final.CustomerID ,location.Location,category.ProductCategory,shopping_final.PreviousPurchases,count(item.ItemPurchased) as RecentPurchases from shopping_final
join location on location.Location_index = shopping_final.Location_index
join category on category.Category_index = shopping_final.Category_index
join item on item.Item_index = shopping_final.Item_index
group by CustomerID ,Location,ProductCategory,PreviousPurchases
order by RecentPurchases desc,PreviousPurchases desc;


#12
select shopping_final.CustomerID ,location.Location,category.ProductCategory,payment.PaymentMethod,shopping_final.PurchaseAmount_USD from shopping_final
join location on location.Location_index = shopping_final.Location_index
join category on category.Category_index = shopping_final.Category_index
join payment on payment.Payment_index = shopping_final.Payment_index
order by PurchaseAmount_USD 
limit 10;


#13
select location.Location,season.Season,count(item.ItemPurchased) as TotalPurchasedItems from shopping_final
join location on location.Location_index = shopping_final.Location_index
join season on season.Season_index = shopping_final.Season_index
join item on item.Item_index = shopping_final.Item_index
group by Location,Season
having TotalPurchasedItems >10
order by TotalPurchasedItems desc;


#14
select gender.Gender,category.ProductCategory,item.ItemPurchased,sum(shopping_final.PurchaseAmount_USD) as TotalPurchaseAmount from shopping_final
join gender on gender.Gender_index = shopping_final.Gender_index
join category on category.Category_index = shopping_final.Category_index
join item on item.Item_index = shopping_final.Item_index
where Gender = "Male"
group by Gender,ProductCategory,ItemPurchased
order by TotalPurchaseAmount desc
limit 10;


#15
select location.Location,gender.Gender,season.Season,category.ProductCategory,max(item.ItemPurchased) MostPurchasedProducts  from shopping_final
join location on location.Location_index = shopping_final.Location_index
join season on season.Season_index = shopping_final.Season_index
join item on item.Item_index = shopping_final.Item_index
join gender on gender.Gender_index = shopping_final.Gender_index
join category on category.Category_index = shopping_final.Category_index
group by Location,Gender,Season,ProductCategory
order by MostPurchasedProducts desc;


# 16
select gender.Gender,category.ProductCategory,max(item.ItemPurchased) as MaxPurchasedProducts from shopping_final
join gender on gender.Gender_index = shopping_final.Gender_index
join category on category.Category_index = shopping_final.Category_index
join item on item.Item_index = shopping_final.Item_index
where Gender = "Female"
group by Gender,ProductCategory
order by MaxPurchasedProducts desc
limit 10;



#17
select gender.Gender,shopping_final.Age,shipping.ShippingType,payment.PaymentMethod from shopping_final
join gender on gender.Gender_index = shopping_final.Gender_index
join shipping on shipping.Shippping_index = shopping_final.Shipping_index
join payment on payment.Payment_index = shopping_final.Payment_index
order by Age desc;



#18
select location.Location,gender.Gender,max(item.ItemPurchased) as MaxPurchasedItems,avg(shopping_final.Age) as Average_Age from shopping_final
join gender on gender.Gender_index = shopping_final.Gender_index
join location on location.Location_index = shopping_final.Location_index
join item on item.Item_index = shopping_final.Item_index
group by Location,Gender
order by MaxPurchasedItems desc;


#19
select season.Season,item.ItemPurchased,max(shopping_final.Size) as Size,sum(shopping_final.PurchaseAmount_USD) as TotalPurchasedAmount from shopping_final
join season on season.Season_index = shopping_final.Season_index
join item on item.Item_index = shopping_final.Item_index
group by Season,ItemPurchased
order by TotalPurchasedAmount desc;



#20
select location.Location,gender.Gender,max(category.ProductCategory) as MostOrderedProductCategory,shopping_final.Size,shopping_final.Color from shopping_final
join location on location.Location_index = shopping_final.Location_index
join gender on gender.Gender_index = shopping_final.Gender_index
join category on category.Category_index = shopping_final.Category_index
group by Location,Gender,Size,Color
order by MostOrderedProductCategory desc
limit 20;


#21
select season.Season,category.ProductCategory,count(item.ItemPurchased) as ItemsPurchased from shopping_final
join season on season.Season_index = shopping_final.Season_index
join category on category.Category_index = shopping_final.Category_index
join item on item.Item_index = shopping_final.Item_index
group by Season,ProductCategory
order by ItemsPurchased desc;

