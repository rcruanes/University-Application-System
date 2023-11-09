select count(a.a_majorkey) as count
from users u, applications a, majors m
WHERE
    u.u_email = '' AND
    a.a_username = u.u_username 
    