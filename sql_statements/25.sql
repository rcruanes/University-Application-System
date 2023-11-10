SELECT a.a_appkey AS application_key, u.u_username AS applicant_username, s.s_schoolname AS school_name
FROM applications AS a
JOIN users AS u ON a.a_username = u.u_username
JOIN schools AS s ON a.a_schoolname = s.s_schoolname;
