select s.s_city as type
from users u, applications a, schools s
WHERE
    u.u_email = 'rcruanes@gmail.com' AND
    a.a_username = u.u_username AND
    s.s_schoolname = a.a_schoolname;
