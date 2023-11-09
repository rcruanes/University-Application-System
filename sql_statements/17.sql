SELECT m_minor, COUNT(a.a_majorkey) AS minor_count
FROM major m
LEFT JOIN applications a ON m.m_majorkey = a.a_majorkey
WHERE m_minor IS NOT NULL
GROUP BY m_minor
ORDER BY minor_count DESC
LIMIT 1;
