SELECT m_degree, COUNT(a.a_majorkey) AS major_count
FROM major m
LEFT JOIN applications a ON m.m_degreekey = a.a_majorkey
GROUP BY m_degree
ORDER BY major_count DESC
LIMIT 1;
