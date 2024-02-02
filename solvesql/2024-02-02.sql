-- [난이도 1] 레스토랑의 영업일
SELECT DISTINCT day AS day_of_week
FROM tips;


-- [난이도 2]
-- 두 테이블 결합하기
SELECT DISTINCT r.athlete_id
FROM events e
INNER JOIN records r ON e.id = r.event_id
WHERE e.sport = 'Golf'


-- 레스토랑 웨이터의 팁 분석
SELECT
  day,
  time,
  round(avg(tip), 2) AS avg_tip,
  round(avg(size), 2) AS avg_size
FROM
  tips
GROUP BY 1, 2
ORDER BY 1, 2;


-- 일별 블로그 방문자 수 집계
SELECT
  event_date_kst AS dt,
  COUNT(DISTINCT user_pseudo_id) AS users
FROM ga
WHERE
  event_date_kst BETWEEN '2021-08-02' AND '2021-08-09'
GROUP BY 1;


-- 우리 플랫폼에 정착한 판매자 2
SELECT seller_id, COUNT(DISTINCT order_id) AS orders
FROM olist_order_items_dataset
WHERE price >= 50
GROUP BY 1
HAVING orders >= 100
ORDER BY orders DESC;


-- 레스토랑의 일일 매출
SELECT 
  day, 
  sum(total_bill) AS revenue_daily
FROM tips
GROUP BY 1
HAVING revenue_daily >= 1000
ORDER BY 1;