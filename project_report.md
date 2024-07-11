# Case 1: Order Analysis

## Question 1:
•	Analyze the monthly distribution of orders. The order_approved_at field should be used for the date data.

### Answer

![soru1 grafik](https://github.com/serifturgut/sql_project/assets/175128367/781f802f-fcd0-40a0-bf02-f285fca96388)

The graph above shows the total order distribution by month. There is an increasing number of orders each month. However, there is an unusual spike in November 2017.This could be influenced by the world-famous Black Friday sales and the Day of the Dead celebrations observed in Brazil and other Latin American countries in the same month.
 
The significant increase in January 2018 can be attributed to the New Year's celebrations. The orders remaining consistently above a certain level in the following months
present a positive outlook for the future.



## Question 2:
•	Analyze the number of orders by order status on a monthly basis. Visualize the output using Excel. Are there any months with dramatic increases or decreases? Examine and interpret the data.

### Answer

![soru2 grafik](https://github.com/serifturgut/sql_project/assets/175128367/e94d4928-e30c-4ee5-895b-a1cc39f19e51)

![soru2 grafik3](https://github.com/serifturgut/sql_project/assets/175128367/d2e4bc11-03c6-4ff3-87b6-7023041247a4)

The first graph above shows the number of delivered orders per month, while the second graph displays the number of canceled orders per month.

In the first graph, it is notable that the number of orders peaks in November 2017 but then drops in December. This can be explained by the fact that after the heavy shopping induced by November sales, people might want to take a break from shopping. However, if the company had implemented an aggressive campaign strategy to link November discounts with the upcoming New Year's shopping in December, it could have prevented this decline and increased the number of orders.

In the second graph, although the overall numbers appear smaller, the more than twofold increase in canceled orders from January 2018 to February 2018 indicates potential systemic issues. By examining the orders from these two months to identify and resolve the underlying problems, the company can prevent more significant issues in the future.



## Question 3:
•	Analyze the number of orders by product category. Which categories stand out during special occasions such as New Year's or Valentine's Day?

### Answer

![soru3 grafik2](https://github.com/serifturgut/sql_project/assets/175128367/026ab48f-5ebb-4c2d-8da4-c796fd2fb8b6)

The graph above shows the number of orders by category for November 2017. Due to the November discounts, the categories that stand out are "cama mesa banho" (home textiles), "moveis decoracao" (furniture decor), "esporte lazer" (sporting goods), "beleza saude" (health and beauty), and "informatica acessorios" (computer accessories). These categories typically consist of non-urgent items that people prefer to buy on sale, hence the increase in order numbers during November sales is expected.

One notable category is "ferramentas jardim" (garden tools). On November 6th, Brazil and other Latin American countries celebrate the Day of the Dead. During this holiday, people usually clean and decorate the graves of deceased family members with fresh flowers, which has reflected in an increase in orders for garden tools. Therefore, it would be strategic to run a promotion for this category in November.


![soru3grafik3](https://github.com/serifturgut/sql_project/assets/175128367/283ce275-fd68-4657-9034-19f7047b5386)

The graph above shows the categories with the highest number of orders for December 2017. A standout category in this graph is "brinquedos" (toys). It is natural for parents to choose toys as gifts for their children during the New Year, and this trend is reflected in the graph.



## Question 4:
•	Analyze the number of orders based on the days of the week (Monday, Thursday, etc.) and the days of the month (1st, 2nd, etc.). Create a visual representation of your query output in Excel and provide an interpretation.

### Answer

![SORU4grafik](https://github.com/serifturgut/sql_project/assets/175128367/65169c01-d44d-4587-9497-3c8ca84b2d6c)

The graph above displays the total number of orders by day of the week. There is a noticeable difference between weekdays and weekends. It can be said that people tend to shop more on weekdays. This could be due to shopping on the way home from work or making online purchases during work hours, which increases these numbers. On weekends, people typically spend time with family or friends outdoors or on vacation, so it's normal for the number of orders to decrease during these times.

![SORU4 Bgrafik](https://github.com/serifturgut/sql_project/assets/175128367/ff2b5c20-7406-41da-9bb8-ffb2f4a138ad)

The graph above depicts the total number of orders by day of the month. The noticeable dip on the 31st day stands out, but this can be attributed to the fact that only seven months have 31 days, so it may not be significant. However, what is more striking is that the number of orders starts to decline after the 24th of the month and drops dramatically in the last two days. This could be influenced by the payday cycle in Brazil, where many people receive their salaries between the 30th and the 5th of the following month, affecting spending patterns.



# Case 2: Customer Analysis

## Question 1:
•	In which cities do customers make the most purchases? Determine the city where customers place the most orders and conduct the analysis based on that.

### Answer

![case2tablo](https://github.com/serifturgut/sql_project/assets/175128367/227d8849-b633-4dbe-8595-5b7c04b3a6f1)

In the table above, the number of customers and orders are provided by city, sorted by the city with the highest order count and taking the top 10. It's not surprising that Sao Paulo and Rio de Janeiro, Brazil's two most populous cities, rank first and second in order counts. However, Belo Horizonte, ranked sixth in population size, being third in order count indicates significant market potential. Special campaigns targeting users in this region could further support customer engagement.



# Case 3: Seller Analysis

## Question 1:
•	Which sellers deliver orders to customers the fastest? Provide the top 5. Analyze and interpret their order counts, product reviews, and ratings.

### Answer

![case3 1tablo](https://github.com/serifturgut/sql_project/assets/175128367/5eaa49ba-99bb-410a-8e29-e4f12d891438)

In the table above, the top 5 sellers who deliver orders the fastest have been listed. The delivery time here is calculated as the time elapsed from order approval to delivery to the customer. To ensure meaningful results, the top 5 fastest sellers were identified among the top 20 sellers with the highest order volumes.

To encourage these sellers, discounts can be offered on the commission fees they pay. Additional benefits can be provided to sellers who exceed a certain quota.



## Question 2:
•	Which sellers sell products in more categories?
•	Do sellers with more categories also have higher order counts?

![case3 2tablo1](https://github.com/serifturgut/sql_project/assets/175128367/19217405-8e8d-4d9b-b4a1-982edce5127a)

In the table above, sellers who sell in more than 10 categories are listed and ranked based on those who sell in the most categories. It's evident from the table that selling in more categories does not guarantee higher sales numbers. In fact, specializing in specific products across 10 or 11 categories may help increase sales.



# Case 4: Payment Analysis

## Question 1:
•	Calculate the number of successful orders and the total successful payment amount by payment type. Sort from the most used payment type to the least used.

![case4 2tablo](https://github.com/serifturgut/sql_project/assets/175128367/8b42d339-a4c5-4031-9253-2fc2095e19b7)

The table above provides the total amount and total number of successful orders based on successful deliveries only. Credit card is the most commonly used payment method, while debit card is the least used. It can be said that people prefer not to use cash.



## Question 2:
•	Perform a category-based analysis of orders paid in single installment and installments. Which categories are installment payments most commonly used in?

![case4 3tablo1](https://github.com/serifturgut/sql_project/assets/175128367/73c1d2f9-657b-4144-998f-c48675ef6239)

The first table provides the top 10 categories with the highest number of orders paid in single installments, while the second table lists the top 10 categories with the highest number of orders paid in multiple installments. It appears that the Sports & Entertainment category is ranked first in single installment payments, likely due to its more accessible pricing. Similarly, the Automotive sector is also among the top categories for single installment purchases.

![case4 3Btablo1](https://github.com/serifturgut/sql_project/assets/175128367/4ab33a14-e6af-408c-a8ed-7e76c840d001)

And the second table, Home Textiles is in the first place. The Toy sector is also within the top ten, and Household Appliances and Tools are similarly prominent in this ranking. This is because purchasing these products in installments becomes more advantageous. 
























