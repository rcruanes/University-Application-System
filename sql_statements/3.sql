select avg(u.u_gpa) as gpa
from users u, applications a
WHERE
    a.a_username = u.u_username 
GROUP BY a.a_schoolname