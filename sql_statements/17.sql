SELECT m_type AS most_popular_minor, COUNT(*) AS application_count
FROM applications
INNER JOIN major ON applications.a_majorkey = major.m_degreekey
WHERE major.m_type = 'minor'
GROUP BY m_type
ORDER BY application_count DESC
LIMIT 1;
