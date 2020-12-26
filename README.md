# oracle-manual-utils
> CREATE DB + Instance, SPFILE, PFILE, Multi. CTL Files

- Move **speed** directory to ORACLE_BASE `C:\app\$your_username$\`
- Run the desired script `CreateDB.bat | MultiControlFiles.bat`

> NB: When creating a new DB with OFM (the default option) the **PFILE** `init.ora` should have the following parameters set as follow:

``` diff

##############################################################################
# Copyright (c) 1991, 2001, 2002 by Oracle Corporation
##############################################################################

###########################################
# Database Identification
###########################################
+ db_name={{{dbname-here}}}

###########################################
# File Configuration
###########################################
- db_create_online_log_dest=("C:\app\{{{your_username}}}\oradata\{{dbname-here}}\control01.ctl", "C:\app\{{{your_username}}}\flash_recovery_area\{{dbname-here}}\control02.ctl")
+ db_create_file_dest="C:\app\{{{your_username}}}\oradata\{{{dbname-here}}}"
+ db_create_online_log_dest_1="C:\app\{{{your_username}}}\oradata\{{{dbname-here}}}"
+ db_recovery_file_dest=C:\app\{{{your_username}}}\flash_recovery_area\{{{dbname-here}}}

 
###########################################
# Security and Auditing
###########################################
+ audit_file_dest=C:\app\\{{{your_username}}\admin\{{{dbname-here}}}\adump

###########################################
# Miscellaneous
###########################################
+ db_unique_name={{{dbname-here}}}

###########################################
# System Managed Undo and Rollback Segments
###########################################
- undo_tablespace=UNDOTBS
+ undo_management=AUTO

``` 
