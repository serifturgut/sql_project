Case 1: Order Analysis

  Question 1:
•	Analyze the monthly distribution of orders. The order_approved_at field should be used for the date data.

QUERY
  SELECT (DATE_TRUNC('month', order_approved_at))::date AS approved_month,
		COUNT(order_id) AS order_count		
		FROM orders
		WHERE (DATE_TRUNC('month', order_approved_at)) IS NOT NULL
		GROUP BY 1

Question 2:
•	Analyze the number of orders by order status on a monthly basis. Visualize the output using Excel. Are there any months with dramatic increases or decreases? Examine and interpret the data.

QUERY
  SELECT  (DATE_TRUNC('month',order_approved_at))::date AS approved_month,
		order_status,
		COUNT(order_id) AS order_count
		FROM orders
		WHERE (DATE_TRUNC('month',order_approved_at)) IS NOT NULL
		GROUP BY (DATE_TRUNC('month',order_approved_at)), order_status
		ORDER BY 1,2

Question 3:
•	Analyze the number of orders by product category. Which categories stand out during special occasions such as New Year's or Valentine's Day?

QUERY
  SELECT  p.product_category_name,
		(DATE_TRUNC('month',order_approved_at))::date AS approved_month,
		COUNT(o.order_id) AS order_count
		FROM orders AS o
	    JOIN order_items AS o_i
        	ON o.order_id = o_i.order_id
	    JOIN products AS p
        	ON p.product_id = o_i.product_id
	WHERE p.product_category_name IS NOT NULL AND
	o.order_approved_at IS NOT NULL
	GROUP BY  p.product_category_name,(DATE_TRUNC('month',order_approved_at))
	ORDER BY 2

Question 4:
•	Analyze the number of orders based on the days of the week (Monday, Thursday, etc.) and the days of the month (1st, 2nd, etc.). 
  Create a visual representation of your query output in Excel and provide an interpretation.

QUERY
  SELECT	DISTINCT (to_char(order_purchase_timestamp,'Day')) AS day_of_week,
		COUNT(order_id) AS total_order
  FROM orders                                 
		WHERE order_purchase_timestamp IS NOT NULL
		GROUP BY 1

QUERY
  WITH days AS (
    SELECT generate_series(1, 31) AS day_of_month
)
SELECT  d.day_of_month,
        COALESCE(COUNT(o.order_id), 0) AS total_order
		FROM days AS d
		  LEFT JOIN orders AS o 
		      ON EXTRACT(DAY FROM o.order_purchase_timestamp) = d.day_of_month
	GROUP BY d.day_of_month
	ORDER BY d.day_of_month;



Case 2: Customer Analysis--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  
  Question 1:
•	In which cities do customers make the most purchases? Determine the city where customers place the most orders and conduct the analysis based on that.

QUERY
  WITH order_counts AS (
	SELECT  o.customer_id,
			customer_city,
			COUNT (order_id) AS order_count
	FROM orders AS o
		LEFT JOIN customers AS c
		    ON c.customer_id = o.customer_id
	GROUP BY 1,2
),
customer_city_rn AS (
	SELECT row_number() OVER(PARTITION BY customer_id ORDER BY order_count DESC) AS rn,
			customer_id,
			customer_city
	FROM order_counts
),
customer_city AS (
	SELECT  customer_id,
			customer_city
	FROM customer_city_rn
	WHERE rn=1
)
SELECT  cc.customer_city,
		COUNT (o.order_id) AS order_count
	FROM orders AS o
		LEFT JOIN customer_city AS cc
		    ON o.customer_id = cc.customer_id
	GROUP BY 1
	ORDER BY 2 DESC



Case 3: Seller Analysis----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  Question 1:
•	Which sellers deliver orders to customers the fastest? Provide the top 5. Analyze and interpret their order counts, product reviews, and ratings.

QUERY
  WITH seller_total_sales AS (
    SELECT
        s.seller_id,
        COUNT(o.order_id) AS total_sales
    FROM
        orders AS o
        LEFT JOIN order_items AS oi 
            ON o.order_id = oi.order_id
        LEFT JOIN sellers AS s 
            ON s.seller_id = oi.seller_id
    WHERE
        o.order_status = 'delivered'
    GROUP BY
        s.seller_id
),
seller_avg_delivery_time AS (
    SELECT
        s.seller_id,
        AVG(EXTRACT(EPOCH FROM (o.order_delivered_carrier_date - o.order_purchase_timestamp))) / 86400 AS avg_delivery_time_days
        FROM
        orders AS o
        LEFT JOIN order_items AS oi 
            ON o.order_id = oi.order_id
        LEFT JOIN sellers AS s 
            ON s.seller_id = oi.seller_id
    WHERE
        o.order_status = 'delivered'
    GROUP BY
        s.seller_id
),
avg_seller AS (
SELECT
    s.seller_id,
    sts.total_sales,
    sadt.avg_delivery_time_days
    FROM
    sellers AS s
    LEFT JOIN seller_total_sales AS sts 
        ON s.seller_id = sts.seller_id
    LEFT JOIN seller_avg_delivery_time AS sadt 
        ON s.seller_id = sadt.seller_id
		WHERE total_sales IS NOT NULL 
		ORDER BY
    total_sales	DESC
	LIMIT 20
)
SELECT  * 
		FROM avg_seller
	ORDER BY
	avg_delivery_time_days ASC
	LIMIT 5


Question 2:
•	Which sellers sell products in more categories?
•	Do sellers with more categories also have higher order counts?

QUERY
  SELECT  DISTINCT(c.customer_id),
		SUM(p.payment_installments) AS total_inst,
		c.customer_city
		FROM payments AS p
		  	LEFT JOIN orders AS o
				  ON p.order_id = o.order_id
			  LEFT JOIN customers AS c
			  	ON c.customer_id = o.customer_id
	GROUP BY 1,c.customer_city
	HAVING SUM(p.payment_installments) >= 12
	ORDER BY 2 DESC

  

  Case 4: Payment Analysis------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  Question 1:
  •	Calculate the number of successful orders and the total successful payment amount by payment type. Sort from the most used payment type to the least used.

QUERY
  SELECT  p.payment_type,
		o.order_status,
		CAST(SUM(p.payment_value) AS numeric(10,2)) AS total_value,
		COUNT(DISTINCT o.order_id) AS total_order
	FROM payments AS p
			LEFT JOIN orders AS o
				  ON p.order_id = o.order_id
	GROUP BY 1,2
		HAVING order_status ='delivered'
	ORDER BY total_order DESC

Question 2:

  •	Perform a category-based analysis of orders paid in single installment and installments. Which categories are installment payments most commonly used in?

  QUERY
    SELECT  pr.product_category_name,
		p.payment_installments,
		COUNT(DISTINCT p.order_id) AS total_order
	FROM payments AS p
		  LEFT JOIN order_items AS oi
		    	ON p.order_id = oi.order_id
  		LEFT JOIN products AS pr
		    	ON pr.product_id = oi.product_id
	WHERE payment_installments = 1
	GROUP BY 1,p.payment_installments		
	ORDER BY total_order DESC	
	LIMIT 10

QUERY
  SELECT  pr.product_category_name,
		SUM(p.payment_installments),
		COUNT(DISTINCT p.order_id) AS total_order
	FROM payments AS p
	  	LEFT JOIN order_items AS oi
		    	ON p.order_id = oi.order_id
	  	LEFT JOIN products AS pr
		    	ON pr.product_id = oi.product_id
	WHERE payment_installments > 1
	GROUP BY 1
	ORDER BY total_order DESC
	LIMIT 10



















