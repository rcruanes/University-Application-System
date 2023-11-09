SELECT count(*)
from (select u.u_username
from users u, applications a
WHERE
    a.a_username = u.u_username AND
GROUP BY u.u_username
HAVING
    count(a.a_applicationkey >3)) 