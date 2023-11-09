SELECT m_major, COUNT(a.a_majorkey) AS major_count
FROM major m
LEFT JOIN applications a ON m.m_majorkey = a.a_majorkey
GROUP BY m_major
ORDER BY major_count DESC
LIMIT 1;
