SELECT m_athletics, COUNT(m_majorkey) AS athletics_count
FROM major
WHERE m_athletics IS NOT NULL
GROUP BY m_athletics
ORDER BY athletics_count DESC
LIMIT 1;
