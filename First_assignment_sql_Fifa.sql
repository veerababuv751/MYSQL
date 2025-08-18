use first_assignment_db;
select * from fifa_data;
select count(*) as cnt from fifa_data;

# How many players are there in the dataset
select count(distinct ID) as dis_id from fifa_data;
select count(distinct nationality) as cnt_dis_nal from fifa_data;

# What is the total wage given to all players? What's the average and standard deviation?
select sum(wage) as total_wage,
avg(wage) as avg_wag,
stddev(wage) as std_wag from fifa_data;

# Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
select nationality,count(*)as player_count from fifa_data
group by nationality
order by player_count desc
limit 3;

# Which player has the highest wage? Who has the lowest?
select  * from fifa_data;
select name,wage from fifa_data
order by wage desc
limit 1;

select name from fifa_data
order by wage asc
limit 1;

# The player having the – best overall rating? Worst overall rating?

select name ,overall from fifa_data
order by overall desc
limit 1;

select name,overall from fifa_data
order by overall asc
limit 1;

#Club having the highest total of overall rating? Highest Average of overall rating?
select club,sum(overall) as total_overall from fifa_data 
group by club
order by total_overall desc
limit 1;

select club, avg(overall) as avg_overall from fifa_data
group by club
order by avg_overall desc
limit 1; 

# What are the top 5 clubs based on the average 	ratings of their players and their corresponding 	averages?
select * from fifa_data;
select club, avg(overall)as avg_overall from fifa_data
group  by club
order by avg_overall desc
limit 5;

select * from fifa_data;

# What is the distribution of players whose preferred foot is left vs right?
select Preferred_foot,count(*) as player_count from fifa_data
group by preferred_foot;

# Which jersey number is the luckiest?
select * from fifa_data;
select jersey_number,avg(potential) as avg_potential 
from fifa_data
group by jersey_number
order by avg_potential desc
limit 1;


# What is the frequency distribution of nationalities among players whose club name starts with M?
select nationality,count(*) as player_count from fifa_data
where club like "M%"
group by nationality
order by player_count;

# How many players have joined their respective clubs in the date range 20 May 2018 to 10 April 2019 (both inclusive)?
select count(*) from fifa_data
where str_to_date(joined,'%d-%m-%Y')
 between '2018-05-20' and '2019-04-10';
 
# How many players have joined their respective clubs date wise?
select joined,count(*) as player_joined from fifa_data
group by joined
order by joined asc;

# How many players have joined their respective clubs yearly
select * from fifa_data;
select club,count(*) as player_joined from fifa_data
group by club
order by club;
alter table fifa_data modify column joined date;
select * from fifa_data;

# How many players have joined their respective clubs date wise?

select club,count(*) as player_joined,joined from fifa_data
group by club,joined
order by joined;


# How many players have joined their respective clubs yearly

select year(str_to_date(joined,'%d-%m-%Y'))as join_year,
count(*) as player_count
from fifa_data 
group by join_year 
order by join_year asc;

