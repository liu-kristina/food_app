-- QUESTIONS --

-- 1 -- Which restaurants delivered an order in december 2020 ?

id|name           |phone      |address         |zip |city  |
--|---------------|-----------|----------------|----|------|
11|Libanese flavor|           |Kanzleistrasse  |8004|Zürich|
23|Tanaka Sushi   |+41 786 432|Talacker        |8001|Zürich|
38|Le Bistrot     |+33 789 542|Tödistrasse     |8002|Zürich|
42|Mama Cucina    |           |Bramenring      |8302|Kloten|
51|Sawatdee       |           |Kreuzbühlstrasse|8008|Zürich|

-- 2 -- Which restaurants offer noodles ?

id|name               |phone      |address         |zip |city  |
--|-------------------|-----------|----------------|----|------|
23|Tanaka Sushi       |+41 786 432|Talacker        |8001|Zürich|
51|Sawatdee           |           |Kreuzbühlstrasse|8008|Zürich|

-- 3 -- Which dishes already ordered "Cedric Bouteille" in 2020 ?

id|title       |description                             |price|restaurant|
--|------------|----------------------------------------|-----|----------|
48|Pad Thai    |Noodles wit  vegetables and oyster sauce| 25.0|        51|
22|Salmon sushi|per piece                               |  2.0|        23|
31|Ramen       |Japanese soup wit  pork and noodles     | 21.0|        23|
25|Tuna maki   |6 pieces                                |  9.4|        23|

-- 4 -- Which user are still waiting for their delivery (check status order) ?

first_name|last_name|id |date               |name        |
----------|---------|---|-------------------|------------|
Sarah     |Magni    |432|2021-01-10 20:01:05|Tanaka Sushi|
Marie     |Medicis  |434|2021-01-10 20:01:08|Le Bistrot  |
Cedric    |Bouteille|435|2021-01-10 20:01:08|Tanaka Sushi|

-- 5 -- Which users ordered in 2020 and in 2021 ?

id |first_name|last_name|mail                |phone|address      |zip |city   |status|
---|----------|---------|--------------------|-----|-------------|----|-------|------|
101|Marie     |Medicis  |marie@medi.cis      |     |Sihlquai     |8005|Zürich |1     |
201|Franz     |Ouali    |franz@ouali.fr      |     |Schützengasse|8001|Zürich |1     |
221|Cedric    |Bouteille|bouteille@hotmail.ch|     |Püntackerweg |8152|Opfikon|1     |

-- 6 -- What is the biggest quantity & dish delivered to one user ?

id|order|dish|quantity|title      |
--|-----|----|--------|-----------|
 8|   13|  34|       8|Tartiflette|

-- 7 -- What is the cost of each order ? (we will use this information a lot, use a cte or a temporary table)

order_id|order_date         |total_before_discount|promotion|total_after_discount|
--------|-------------------|---------------------|---------|--------------------|
      10|2020-12-01 20:03:45|                126.2|         |               126.2|
      11|2020-12-01 20:04:01|                 39.5|         |                39.5|
      12|2020-12-01 20:04:01|                 42.5|     10.0|               38.25|
      13|2020-12-01 20:04:02|                168.0|         |               168.0|
      14|2020-12-01 20:06:02|                 75.0|      5.0|               71.25|
      15|2020-12-01 20:06:02|                 51.8|      5.0|               49.21|
      16|2020-12-01 20:10:04|                 52.4|         |                52.4|
     431|2021-01-10 20:01:05|                 93.6|     15.0|               79.56|
     432|2021-01-10 20:01:05|                 55.8|         |                55.8|
     433|2021-01-10 20:01:05|                 34.8|         |                34.8|
     434|2021-01-10 20:01:08|                 49.5|     15.0|               42.08|
     435|2021-01-10 20:01:08|                124.0|         |               124.0|
     436|2021-01-10 20:01:08|                 17.0|         |                17.0|

-- 8 -- Compare each order cost to the following one and get the difference between this cost and the total turnover on that dataset (base your calculation on the total after discount).

order_id|total_order|next_order|total |difference|running_total|
--------|-----------|----------|------|----------|-------------|
      10|      126.2|      39.5|898.05|    771.85|        126.2|
      11|       39.5|     38.25|898.05|    858.55|        165.7|
      12|      38.25|     168.0|898.05|     859.8|       203.95|
      13|      168.0|     71.25|898.05|    730.05|       371.95|
      14|      71.25|     49.21|898.05|     826.8|        443.2|
      15|      49.21|      52.4|898.05|    848.84|       492.41|
      16|       52.4|     79.56|898.05|    845.65|       544.81|
     431|      79.56|      55.8|898.05|    818.49|       624.37|
     432|       55.8|      34.8|898.05|    842.25|       680.17|
     433|       34.8|     42.08|898.05|    863.25|       714.97|
     434|      42.08|     124.0|898.05|    855.97|       757.05|
     435|      124.0|      17.0|898.05|    774.05|       881.05|
     436|       17.0|          |898.05|    881.05|       898.05|

-- 9 -- Display all the dish ordered in 2021 and how many times the dish was ordered (check the quantity and order by this amount) ?

id|title                 |description                        |price|restaurant|ordered|
--|----------------------|-----------------------------------|-----|----------|-------|
27|California maki       |8 pieces                           | 12.0|        23|      6|
22|Salmon sushi          |per piece                          |  2.0|        23|      4|
15|Chicken Shawarma      |Chicken in a grilled galette       | 20.5|        11|      3|
32|Kebbe boulette        |Delicious meat balls               | 10.7|        11|      3|
24|Cucumber maki         |6 pieces                           |  4.5|        23|      2|
25|Tuna maki             |6 pieces                           |  9.4|        23|      2|
37|Croque-Monsieur       |Grilled bread wit  ham and cheese  | 12.0|        38|      2|
52|Pad See Eiw           |Large noodles wit  vegetables      | 25.5|        51|      2|
31|Ramen                 |Japanese soup wit  pork and noodles| 21.0|        23|      1|
35|Blanquette            |Veal meat and cream                | 25.5|        38|      1|
40|Quattro formaggi pizza|Pizza wit  4 type of cheese        | 18.0|        42|      1|
44|Pasta Carbonara       |                                   | 16.8|        42|      1|
51|Laab                  |Spicy salad                        | 17.0|        51|      1|

-- 10 -- What is the average amount spent per order ?

order_id|total_after_discount|average|
--------|--------------------|-------|
      10|               126.2|  69.08|
      11|                39.5|  69.08|
      12|               38.25|  69.08|
      13|               168.0|  69.08|
      14|               71.25|  69.08|
      15|               49.21|  69.08|
      16|                52.4|  69.08|
     431|               79.56|  69.08|
     432|                55.8|  69.08|
     433|                34.8|  69.08|
     434|               42.08|  69.08|
     435|               124.0|  69.08|
     436|                17.0|  69.08|


-- 11 -- What is the difference between the average amount spent per order across all users and the average amount spent per order by each individual user?

id |first_name|last_name|total_cost_user|total_avg|difference|
---|----------|---------|---------------|---------|----------|
100|John      |Anton    |          126.2|    69.08|     57.12|
101|Marie     |Medicis  |          53.71|    69.08|    -15.37|
180|Anna      |Veritas  |          38.25|    69.08|    -30.83|
201|Franz     |Ouali    |          101.4|    69.08|     32.32|
213|Sarah     |Magni    |           55.8|    69.08|    -13.28|
215|Alan      |Dupuis   |           52.4|    69.08|    -16.68|
221|Cedric    |Bouteille|          65.37|    69.08|    -03.72|
225|Gill      |Baccide	|               |    69.08|          |	
301|Joe       |Qi	    |               |    69.08|          |	


-- 12 -- What is the total turnover generated ? (get the order total, the running total over the turnover, then the complete turnover)

id |order_total|running_total|total|
---|-----------|-------------|-----|
 10|      126.2|         41.0|930.1|
 10|      126.2|         83.8|930.1|
 10|      126.2|        126.2|930.1|
 11|       39.5|        144.2|930.1|
 11|       39.5|        165.7|930.1|
 12|       42.5|        191.2|930.1|
 12|       42.5|        208.2|930.1|
 13|      168.0|        376.2|930.1|
 14|       75.0|        451.2|930.1|
 15|       51.8|        463.2|930.1|
 15|       51.8|        484.2|930.1|
 15|       51.8|        503.0|930.1|
 16|       52.4|        519.8|930.1|
 16|       52.4|        555.4|930.1|
431|       93.6|        616.9|930.1|
431|       93.6|        649.0|930.1|
432|       55.8|        673.0|930.1|
432|       55.8|        691.8|930.1|
432|       55.8|        700.8|930.1|
432|       55.8|        704.8|930.1|
433|       34.8|        721.6|930.1|
433|       34.8|        739.6|930.1|
434|       49.5|        763.6|930.1|
434|       49.5|        789.1|930.1|
435|      124.0|        837.1|930.1|
435|      124.0|        841.1|930.1|
435|      124.0|        862.1|930.1|
435|      124.0|        913.1|930.1|
436|       17.0|        930.1|930.1|

-- 13 -- What is the percent of each command regarding the turnover ? (use cte)

id |order_total|running_total|total|percent|
---|-----------|-------------|-----|-------|
 10|      126.2|         41.0|930.1|  13.57|
 10|      126.2|         83.8|930.1|  13.57|
 10|      126.2|        126.2|930.1|  13.57|
 11|       39.5|        144.2|930.1|   4.25|
 11|       39.5|        165.7|930.1|   4.25|
 12|       42.5|        191.2|930.1|   4.57|
 12|       42.5|        208.2|930.1|   4.57|
 13|      168.0|        376.2|930.1|  18.06|
 14|       75.0|        451.2|930.1|   8.06|
 15|       51.8|        463.2|930.1|   5.57|
 15|       51.8|        484.2|930.1|   5.57|
 15|       51.8|        503.0|930.1|   5.57|
 16|       52.4|        519.8|930.1|   5.63|
 16|       52.4|        555.4|930.1|   5.63|
431|       93.6|        616.9|930.1|  10.06|
431|       93.6|        649.0|930.1|  10.06|
432|       55.8|        673.0|930.1|    6.0|
432|       55.8|        691.8|930.1|    6.0|
432|       55.8|        700.8|930.1|    6.0|
432|       55.8|        704.8|930.1|    6.0|
433|       34.8|        721.6|930.1|   3.74|
433|       34.8|        739.6|930.1|   3.74|
434|       49.5|        763.6|930.1|   5.32|
434|       49.5|        789.1|930.1|   5.32|
435|      124.0|        837.1|930.1|  13.33|
435|      124.0|        841.1|930.1|  13.33|
435|      124.0|        862.1|930.1|  13.33|
435|      124.0|        913.1|930.1|  13.33|
436|       17.0|        930.1|930.1|   1.83|


-- 14 -- Rank the best orders. (use temporary table)
id |order_total|running_total|total|consecutive_order|
---|-----------|-------------|-----|-----------------|
 13|      168.0|        376.2|930.1|                1|
 10|      126.2|         41.0|930.1|                2|
 10|      126.2|         83.8|930.1|                2|
 10|      126.2|        126.2|930.1|                2|
435|      124.0|        837.1|930.1|                3|
435|      124.0|        841.1|930.1|                3|
435|      124.0|        862.1|930.1|                3|
435|      124.0|        913.1|930.1|                3|
431|       93.6|        616.9|930.1|                4|
431|       93.6|        649.0|930.1|                4|
 14|       75.0|        451.2|930.1|                5|
432|       55.8|        673.0|930.1|                6|
432|       55.8|        691.8|930.1|                6|
432|       55.8|        700.8|930.1|                6|
432|       55.8|        704.8|930.1|                6|
 16|       52.4|        519.8|930.1|                7|
 16|       52.4|        555.4|930.1|                7|
 15|       51.8|        463.2|930.1|                8|
 15|       51.8|        484.2|930.1|                8|
 15|       51.8|        503.0|930.1|                8|
434|       49.5|        763.6|930.1|                9|
434|       49.5|        789.1|930.1|                9|
 12|       42.5|        191.2|930.1|               10|
 12|       42.5|        208.2|930.1|               10|
 11|       39.5|        144.2|930.1|               11|
 11|       39.5|        165.7|930.1|               11|
433|       34.8|        721.6|930.1|               12|
433|       34.8|        739.6|930.1|               12|
436|       17.0|        930.1|930.1|               13|


-- 15 -- Display all of the order with the mention "Profitable" if the total of the order is above 35 , "Balanced" if between 34 and 35, or "Not profitable".

id |order_total|running_total|total|Extra info    |
---|-----------|-------------|-----|--------------|
 10|      126.2|         41.0|930.1|Profitable    |
 10|      126.2|         83.8|930.1|Profitable    |
 10|      126.2|        126.2|930.1|Profitable    |
 11|       39.5|        144.2|930.1|Profitable    |
 11|       39.5|        165.7|930.1|Profitable    |
 12|       42.5|        191.2|930.1|Profitable    |
 12|       42.5|        208.2|930.1|Profitable    |
 13|      168.0|        376.2|930.1|Profitable    |
 14|       75.0|        451.2|930.1|Profitable    |
 15|       51.8|        463.2|930.1|Profitable    |
 15|       51.8|        484.2|930.1|Profitable    |
 15|       51.8|        503.0|930.1|Profitable    |
 16|       52.4|        519.8|930.1|Profitable    |
 16|       52.4|        555.4|930.1|Profitable    |
431|       93.6|        616.9|930.1|Profitable    |
431|       93.6|        649.0|930.1|Profitable    |
432|       55.8|        673.0|930.1|Profitable    |
432|       55.8|        691.8|930.1|Profitable    |
432|       55.8|        700.8|930.1|Profitable    |
432|       55.8|        704.8|930.1|Profitable    |
433|       34.8|        721.6|930.1|Balanced      |
433|       34.8|        739.6|930.1|Balanced      |
434|       49.5|        763.6|930.1|Profitable    |
434|       49.5|        789.1|930.1|Profitable    |
435|      124.0|        837.1|930.1|Profitable    |
435|      124.0|        841.1|930.1|Profitable    |
435|      124.0|        862.1|930.1|Profitable    |
435|      124.0|        913.1|930.1|Profitable    |
436|       17.0|        930.1|930.1|Not Profitable|

