-- DROP TABLE IF EXISTS nodes;

CREATE TABLE nodes (
    point1 CHAR(1),
    point2 CHAR(1),
    cost INT
);

INSERT INTO nodes(point1, point2, cost)
VALUES 
('A','B',10),('B','A',10),('A','C',15),('C','A',15),('C','B',35),('B','C',35),
('B','D',25),('D','B',25),('D','A',20),('A','D',20),('D','C',30),('C','D',30);

WITH RECURSIVE tsp AS (
    SELECT ARRAY ['A'] AS pretour,
    'A'::CHAR(1) AS last_city,
    0 AS pretotal_cost
    UNION ALL
    SELECT pretour || ARRAY[nodes.point2],
    nodes.point2::CHAR(1),
    tsp.pretotal_cost + nodes.cost
    FROM tsp
    JOIN nodes ON tsp.last_city = nodes.point1
    WHERE nodes.point2 <> ALL(pretour)
),
completed_tours AS (
    SELECT pretour || ARRAY['A'] AS full_tour,
    pretotal_cost + nodes.cost AS full_cost
    FROM tsp
    JOIN nodes ON tsp.last_city = nodes.point1 AND nodes.point2 = 'A'
    WHERE array_length(pretour,1) = 4
)

SELECT full_cost AS total_cost,
full_tour AS tour
FROM completed_tours
WHERE full_cost = (
    SELECT MIN(full_cost) FROM completed_tours
)
OR full_cost = (
    SELECT MAX(full_cost) FROM completed_tours
)
ORDER BY full_cost, full_tour