SELECT count(DISTINCT(name))
from (select u.u_username as name, count(a.a_appkey)
from users u, applications a
WHERE
    a.a_username = u.u_username 
GROUP BY u.u_username
HAVING
    count(a.a_appkey) >3 );