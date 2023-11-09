CREATE TABLE education (
    e_gpa  decimal(3,0) not null,
    e_schoolname       varchar(55) not null,
    e_extracurriculars    varchar(152),
    e_username varchar(152)
);
CREATE TABLE users (
    u_username  varchar(152) not null,
    u_email       varchar(50) not null,
    u_password  varchar(50) not null,
);
CREATE TABLE demographics (
    d_income     decimal(10,0) not null,
    d_ethnicity        varchar(55) not null,
    d_race       varchar(55) not null,
    d_age       decimal(3,0) not null,
    d_gender        varchar(55) not null,
    d_sex        varchar(55) not null,
    d_username   varchar(55) not null,
);
CREATE TABLE applications (
    a_appkey     decimal(8,0) not null,
    a_username        varchar(55) not null,
    a_schoolname     varchar(55) not null,
);
CREATE TABLE schools (
    s_schoolname     varchar(55) not null,
    s_city     varchar(55) not null,
    s_country   varchar(55) not null,
    s_finaid    bit(1) not null,
    s_type  varchar(55) not null
);
CREATE TABLE major (
    m_major     varchar(55) not null,
    m_minor        varchar(55),
    m_athletics     varchar(55),
    m_schoolname   varchar(55) not null,
);
CREATE TABLE essays (
    es_essay       varchar(55) not null,
    e_appkey       decimal(9,0) not null,
);
CREATE TABLE recommendations (
    r_professors    varchar(55) not null,
    r_employment     varchar(55) not null,
    r_appkey     decimal(8,0) not null,
);