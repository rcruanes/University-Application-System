SELECT a_appkey, COUNT(DISTINCT a_schoolname) AS num_schools_sent_to
FROM applications
GROUP BY a_appkey
ORDER BY num_schools_sent_to DESC
LIMIT 1;
