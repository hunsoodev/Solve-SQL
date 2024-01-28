-- 모든 데이터 조회하기
SELECT * FROM points;


-- 일부 데이터 조회하기
SELECT *
FROM points
WHERE quartet = 'I';


-- 데이터 정렬하기
SELECT *
FROM points
WHERE quartet = 'I'
ORDER BY y;


-- 데이터 그룹으로 묶기
SELECT
  quartet,
  round(avg(x), 2) AS x_mean,
  round(variance(x), 2) AS x_var,
  round(avg(y), 2) AS y_mean,
  round(variance(y), 2) AS y_var
FROM points
GROUP BY 1;


-- 특정 컬럼만 조회하기
SELECT x, y FROM points;
