-- 몇 분이서 오셨어요?
SELECT *
FROM tips
WHERE mod(size, 2) = 1;


-- 최근 올림픽이 개최된 도시
SELECT
  year,
  upper(substr(city, 1, 3)) AS city
FROM
  games
WHERE
  year >= 2000
ORDER BY
  year DESC;


-- 우리 플랫폼에 정착한 판매자 1
SELECT
  seller_id,
  COUNT(DISTINCT (order_id)) AS orders
FROM
  olist_order_items_dataset
GROUP BY
  seller_id
HAVING
  orders >= 100;


-- [방법1] 최고의 근무일을 찾아라
SELECT day, max(total_tip) AS tip_daily
FROM(
  SELECT day, sum(tip) AS total_tip
  FROM tips
  GROUP BY 1
)


-- [방법2] 최고의 근무일을 찾아라
SELECT day, SUM(tip) AS tip_daily  
FROM tips 
GROUP BY 1 
ORDER BY SUM(tip) DESC 
LIMIT 1


-- 첫 주문과 마지막 주문
SELECT
  date(MIN(order_purchase_timestamp)) AS first_order_date,
  date(MAX(order_purchase_timestamp)) AS last_order_date
FROM
  olist_orders_dataset


-- 많이 주문한 테이블 찾기
SELECT * 
FROM tips
WHERE total_bill > (
  SELECT avg(total_bill)
  FROM tips
)


-- 레스토랑의 일일 평균 매출액 계산하기
SELECT
  round(avg(sum_sales), 2) AS avg_sales
FROM(
  SELECT sum(total_bill) AS sum_sales
  FROM tips
  GROUP BY day
)