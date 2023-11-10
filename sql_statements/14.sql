SELECT count(*)
from (SELECT u.u_username
from applications a, users u
WHERE 
    u.u_username = a.a_username 
GROUP by u.u_username 
HAVING 
    count(DISTINCT(a.a_schoolname)) =1);