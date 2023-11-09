SELECT m_degree AS most_popular_major, COUNT(*) AS application_count
FROM applications
INNER JOIN major ON applications.a_majorkey = major.m_degreekey
GROUP BY m_degree
ORDER BY application_count DESC
LIMIT 1;
