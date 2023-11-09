select r.r_professors as professor, count(DISTINCT(u.u_username)) as count
from users u, applications a, recommendations r
WHERE
    a.a_username = u.u_username AND
    r.r_appkey = a.a_appkey 
GROUP BY r.r_professors;