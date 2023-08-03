/*
returns a table of all customers who have spent a total of $1,500 or more across all transactions combined
*/

select customer_id, customer_first_name, customer_last_name, round(SUM(quantity*cost_to_customer_per_qty),2) as total_paid
# next step add number of transactions and average transaction total
from customer
join customer_purchases using(customer_id)
group by customer_id
having total_paid >= 2500;



select
    c.customer_id, c.customer_first_name, c.customer_last_name, product.product_id, product.product_name, market_season, market_day
from
    customer as c
join
    customer_purchases using(customer_id)
join
    product USING(product_id) 
join market_date_info using(market_date)
where market_season in ('Summer/Early Fall', 'Late Fall/Holiday') and market_day in ('Friday', 'Saturday', 'Sunday')
group by
    c.customer_id, c.customer_first_name, c.customer_last_name, product.product_id, product.product_name, market_season, market_day
order by
    market_season asc
limit 200;


select customer_id, customer_first_name, customer_last_name, round(SUM(quantity*cost_to_customer_per_qty),2) as total_paid, count(*) as num_transactions
# next step add number of transactions and average transaction total
from customer
join customer_purchases using(customer_id)
group by customer_id
having total_paid >= 2500;

