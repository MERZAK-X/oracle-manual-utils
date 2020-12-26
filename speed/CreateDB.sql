-- Made by @MERZAK-X and @Yassine-Ag
prompt ##################### THIS SCRIPT WAS MADE BY MERZAK-X AND Yassine-Ag #####################

CONN / as SYSDBA

CREATE SPFILE FROM PFILE='&2';
STARTUP NOMOUNT;
CREATE DATABASE &1;
CONN / as SYSDBA
-- TODO: Change this path to your current cersion or smt ... we're to lazy to do it fo you lol
@'&3\product\11.2.0\dbhome_1\RDBMS\ADMIN\catalog.sql';
@'&3\product\11.2.0\dbhome_1\RDBMS\ADMIN\catproc.sql';
ALTER USER SYSTEM IDENTIFIED BY &1; 
prompt ##################### CONNECTING AS SYSTEM #####################
CONN system/&1
@'&3\product\11.2.0\dbhome_1\sqlplus\admin\pupbld.sql';

prompt ##################### TESTING VARIABLES #####################
select value from v$parameter where name='spfile';
select value from v$spparameter where name='db_name';
select name from v$database;
select instance_name,host_name,status,database_status from v$instance;
select username,account_status from dba_users;

prompt ##################### CREATING NEW USER #####################
ACCEPT username char prompt '[+] Enter new user`s username : '
ACCEPT password char prompt '[+] Enter new user`s password : '
create user &username identified by &password;
select username,account_status from dba_users;

prompt ##################### CONNECTING SYS AS SYSDBA #####################
CONN SYS/&1 as SYSDBA
grant connect, create table to &username;

prompt ##################### CONNECTING AS NEW USER #####################
CONN &username/&password
SELECT USER FROM DUAL;
