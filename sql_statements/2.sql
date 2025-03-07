select u.u_race as race, count(DISTINCT(u.u_username)) as count
from users u, applications a, schools s
WHERE
    a.a_username = u.u_username AND
    a.a_schoolname = s.s_schoolname AND
    s.s_city = 'New Haven'
GROUP BY u.u_race;