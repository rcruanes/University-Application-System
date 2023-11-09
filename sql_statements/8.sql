(select DISTINCT(u.u_username) as names
from users u, applications a, majors m
WHERE
    a.a_username = u.u_username AND
    a.a_majorkey = m.m_majorkey AND
    m.m_type = 'MAJOR')
INTERSECT
(select DISTINCT(u.u_username) as names
from users u, applications a, majors m
WHERE
    a.a_username = u.u_username AND
    a.a_majorkey = m.m_majorkey AND
    m.m_type = 'MINOR')