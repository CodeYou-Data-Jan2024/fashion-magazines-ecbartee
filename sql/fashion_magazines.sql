-- Hints
-- - Build the query piece by piece 
-- - Start with the orders table and work out from there.
-- - Filter the orders table on the `orders.order_status` column
-- - Join the customers table to the orders table to get the customer's name
-- - Join the subscriptions table to the orders table as to get the number of months and subscription length
-- - filter the orders on the `subscriptions.description` column
-- - Multiply the subscirption price with the subscription length to get the total amount due
-- - Format the total amount due as currency using the `PRINTF()` function
-- - Group By Cuustomer and sum the amount due to account for customers that have more than one unpaid Fashion Magazine subscriptions

SELECT
    customers.customer_name AS Customer,
    PRINTF('%.2f', SUM(subscriptions.price_per_month * subscriptions.subscription_length)) AS "Amount Due"
FROM
    customers
JOIN
    orders ON customers.customer_id = orders.customer_id
JOIN
    subscriptions ON orders.subscription_id = subscriptions.subscription_id
WHERE
    orders.order_status = 'unpaid'
    AND subscriptions.description = 'Fashion Magazine'
GROUP BY
    customers.customer_name;

