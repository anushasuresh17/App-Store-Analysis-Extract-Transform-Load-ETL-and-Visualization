use apps;

#Created the tables and inserted the values for the tables


# checking the tables 

select * from app_categories;

select * from apps;

select * from categories;

select * from key_benefits;

select * from pricing_plan_feature;

select * from pricing_plans;

# summary statistics
select
	avg(rating) as avg_rating,
    min(rating) as min_rating,
    max(rating) as max_rating,
    avg(reviews_count) as avg_reviews_count
from apps;

# rating and their categories
select 
	c.title as category_title,
    avg(a.rating) as avg_rating
from categories c
join app_categories ac on c.id = ac.category_id
join apps a on ac.app_id = a.app_id
group by c.title;

# count on each apps as per the category
select 
	c.title as category_title,
    count(ac.app_id) as app_count
from categories c
left join app_categories as ac on c.id = ac.category_id
group by c.title
order by app_count desc;

# count of pricing plans for each app
select 
	app_id,
    count(pricing_plan_id) as plan_count
from pricing_plans
group by app_id;


# Apps with highest rating
select 
	a.title_of_app,
    a.developer,
    a.rating,
    a.reviews_count
from 
	apps a 
where 
	a.rating >= (select avg(rating) from apps)
order by 
	a.rating Desc
limit 10;
    
#pricing plan analysis
select 
	pricing_plan_title,
    avg(price) as avg_price
from 
	pricing_plans
group by 
	pricing_plan_title;
    
# top 5 most common key benefits
select 
	description,
    count(*) as benefit_count
from key_benefits
group by description
order by benefit_count DESC
limit 5;

# reviews sentiment analysis
select 
	case
		when r.rating >= 4 then 'positive'
        when r.rating <= 2 then 'negative'
        else 'neutral'
	end as sentiment,
    count(*) as review_count
from 
	reviews r
group by sentiment;

# developer with most apps
select 
	developer,
    count(*) as app_count
from 
	apps
group by
	developer
order by
	app_count DESC
limit 10;


# top 5 categories by average rating
select
	category_title,
    avg_rating,
    ranking
from (
		select c.title as category_title,
		avg(a.rating) as avg_rating,
		rank() over (order by avg(a.rating) desc) as ranking
	from
		categories c
	left join
		app_categories ac on c.id = ac.category_id
	left join
		apps a on ac.app_id = a.app_id
	group by
		c.title
) as avg_ratings
where 
	avg_rating is not null
order by
	ranking
limit 5;

#apps ranked by reviews count within each category
select 
	app_title,
    reviews_count,
    category_title,
    rank() over (partition by category_title order by reviews_count desc) as rank_within_category
from (
		select 
			a.title_of_app as app_title,
            a.reviews_count,
            c.title as category_title
		from
			apps a
		left join
			app_categories ac on a.app_id = ac.app_id
		left join
			categories c on ac.category_id = c.id
) as ranked_apps
order by 
	category_title,
    rank_within_category
limit 10;

# Top 5 Most Common Key Benefits Across Apps:
select
	description,
    count(*) as benefit_count
from
	key_benefits
group by 
	description
order by
	benefit_count desc
limit 10;

# Average Price of Pricing Plans Across Apps
select 
	app_id,
    avg(price) as avg_price
from
	pricing_plans
group by 
	app_id;

#Top 5 Apps with the Most Expensive Pricing Plans
select
	app_id,
    max(price) as max_price
from
	pricing_plans
group by 
	app_id
order by
	max_price desc
limit 10;

#Top 5 Developers with the Highest Average Rating
SELECT
    developer,
    AVG(rating) AS avg_rating,
    RANK() OVER (ORDER BY AVG(rating) DESC) AS ranking
FROM
    apps
GROUP BY
    developer;

# Most Active Categories by Number of Apps
SELECT
    category_title,
    app_count,
    SUM(app_count) OVER (ORDER BY app_count DESC) AS cumulative_count,
    (SUM(app_count) OVER (ORDER BY app_count DESC) / SUM(app_count) OVER ()) * 100 AS cumulative_percentage
FROM (
    SELECT
        c.title AS category_title,
        COUNT(ac.app_id) AS app_count
    FROM
        categories c
    LEFT JOIN
        app_categories ac ON c.id = ac.category_id
    GROUP BY
        c.title
) AS category_counts;
