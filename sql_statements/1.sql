select count(DISTINCT(u.u_username)) as count
from users u, applications a, schools s
WHERE
    a.a_username = u.u_username AND
    a.a_schoolname = s.s_schoolname AND
    s.s_location = ''
GROUP BY u.u_gender