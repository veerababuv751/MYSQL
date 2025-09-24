use  food_hunter;
show tables; 
select * from customers;
select * from drivers;
select * from food_items;
select * from orders;
select * from orders_items;
select * from restaurants;

# Show all the data in the restaurants table
select * from restaurants;
 
# Show only the dishes, their prices and the calories in them from the food items table
select item_name,price,calories from food_items;

# Retrieve the order ids, customer ids, and total prices of all orders
select order_id,customer_id,final_price from orders;

# Count the number of restaurants in the restaurant table
select count(restaurant_id) from restaurants;

# Unique number of cuisines served by the restaurants from the restaurants table
select count(distinct cuisine) from restaurants;

# Number of unique dishes served by restaurants from the food_items table.
select count(distinct item_name) from food_items;