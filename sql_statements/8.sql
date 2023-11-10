select DISTINCT(u.u_username) as names
from users u, applications a, major m
WHERE
    a.a_username = u.u_username AND
    a.a_majorkey = m.m_degreekey AND
    m.m_type = 'Major'
INTERSECT
select DISTINCT(u.u_username) as names
from users u, applications a, major m
WHERE
    a.a_username = u.u_username AND
    a.a_majorkey = m.m_degreekey AND
    m.m_type = 'Minor';