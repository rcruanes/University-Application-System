select count(DISTINCT(u.u_username)) as count
from users u, applications a, recommendations r
WHERE
    a.a_username = u.u_username AND
    r.r_applicationkey = a.a_applicationkey 
GROUP BY r.r_professors;