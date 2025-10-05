SELECT res.address,
ROUND(res.formula, 2)::float AS formula,
ROUND(res.average, 2)::float AS average,
res.formula > res.average AS comparison
FROM 
(SELECT address,
MAX(age)::numeric - (MIN(age)::numeric /MAX(age)::numeric) AS formula,
AVG(age)::numeric AS average
FROM person
GROUP BY 1
) AS res
ORDER BY 1