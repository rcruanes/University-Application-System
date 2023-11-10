SELECT m_degree, COUNT(a.a_majorkey) AS minor_count
FROM major m
JOIN applications a ON m.m_degreekey = a.a_majorkey
WHERE m_type = 'Minor'
GROUP BY m_degree
ORDER BY minor_count DESC
LIMIT 1;
