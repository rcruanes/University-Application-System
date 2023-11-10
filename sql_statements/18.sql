SELECT m_degree, COUNT(a.a_majorkey) AS athletics_count
FROM major m
JOIN applications a ON m.m_degreekey = a.a_majorkey
WHERE m_type = 'Athletics'
GROUP BY m_degree
ORDER BY athletics_count DESC
LIMIT 1;
