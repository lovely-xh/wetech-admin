drop table if exists sys_user;
drop table if exists sys_organization;
drop table if exists sys_resource;
drop table if exists sys_role;
drop table if exists sys_group;
drop table if exists sys_log;

create table sys_user (
  id int8 NOT NULL,
  organization_id int8,
  username varchar(100),
  password varchar(100),
  salt varchar(100) ,
  role_ids varchar(100) ,
  group_ids varchar(100) ,
  locked bool default false ,
  constraint pk_sys_user primary key(id)
) ;
create unique index idx_sys_user_username on sys_user(username);
create index idx_sys_user_organization_id on sys_user(organization_id);

create table sys_organization (
  id int8,
  name varchar(100) ,
  parent_id int8 ,
  parent_ids varchar(100) ,
  available bool default false ,
  priority int8  ,
  leaf bool default false,
  constraint pk_sys_organization primary key(id)
) ;
create index idx_sys_organization_parent_id on sys_organization(parent_id);
create index idx_sys_organization_parent_ids on sys_organization(parent_ids);

create table sys_resource (
  id int8,
  name varchar(100),
  type varchar(50) ,
  url varchar(200) ,
  parent_id int8,
  parent_ids varchar(100) ,
  permission varchar(100) ,
  available bool default false,
  icon varchar(100) ,
  priority int8,
  leaf bool default false ,
  constraint pk_sys_resource primary key(id)
) ;
create index idx_sys_resource_parent_id on sys_resource(parent_id);
create index idx_sys_resource_parent_ids on sys_resource(parent_ids);

create table sys_role (
  id int8,
  role varchar(100) ,
  description varchar(100),
  resource_ids varchar(100) ,
  available bool default false ,
  constraint pk_sys_role primary key(id)
) ;
create index idx_sys_role_resource_ids on sys_role(resource_ids);

CREATE TABLE sys_group (
  id int8,
  name varchar(100),
  type varchar(50) ,
  description varchar(100) ,
  constraint pk_sys_group PRIMARY KEY (id)
  ) ;

CREATE TABLE sys_log (
  id int8,
  username varchar(100) ,
  ip varchar(45) ,
  req_method varchar(200) ,
  req_uri varchar(1000) ,
  exec_method varchar(200) ,
  exec_time int8,
  args varchar(1000) ,
  return_val varchar(1000)  ,
  exec_desc varchar(200) ,
  status varchar(45) ,
  create_time varchar(1000),
  constraint pk_sys_log PRIMARY KEY (id)
)  ;