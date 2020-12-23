connect / as sysdba

CREATE SPFILE FROM PFILE='&2';
startup nomount;
CREATE DATABASE &1;
connect / as sysdba
@'&3\product\11.2.0\dbhome_1\RDBMS\ADMIN\catalog.sql';
@'&3\product\11.2.0\dbhome_1\RDBMS\ADMIN\catproc.sql';
connect system/&1
@'&3\product\11.2.0\dbhome_1\sqlplus\admin\pupbld.sql';
select value from v$parameter where name='spfile';
select value from v$spparameter where name='db_name';
select name from v$database;
select instance_name,host_name,status,database_status from v$instance;
select username,account_status from dba_users;
create user Rachid_Dehbi identified by Rachid_Dehbi;
select username,account_status from dba_users;
connect sys/&1 as sysdba
grant connect, create table to Rachid_Dehbi;
connect Rachid_Dehbi/Rachid_Dehbi