select count(DISTINCT(a.a_majorkey)) as count
from users u, applications a
WHERE
    u.u_email = 'rcruanes@gmail.com' AND
    a.a_username = u.u_username;