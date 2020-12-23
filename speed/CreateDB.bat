@echo off
cls
echo.

set /p oracle_base="[+] Enter Oracle_BASE path: "

echo.
set /p DB_Name="[+] Enter NEW Database name: "

mkdir %oracle_base%\oradata\%DB_Name%  %oracle_base%\flash_recovery_area\%DB_Name%

echo. 
echo "[!] Choose an existing Database that you want to use for this new creation: "
dir %oracle_base%\admin
set /p cp_BD="[+] Select an existing database by name from the list : "

set file_dest="%oracle_base%\speed"

:: Copy selected DB to make new DB structure
echo "[!] Copying selected DB to make new DB structure ... "
Xcopy %oracle_base%\admin\%cp_BD% %oracle_base%\admin\%DB_Name% /E/H/C/I

:: Rename the PFile 
echo.
"[!] Renaming PFile ... "
echo.
move %oracle_base%\admin\%DB_Name%\pfile\* %oracle_base%\admin\%DB_Name%\pfile\init.ora

echo.
set pfile="%oracle_base%\admin\%DB_Name%\pfile\init.ora"

:: Modify PFile manually
echo "[!] Modifying PFile manually ..."
echo.
notepad %pfile%

:: Creating a new instance
echo "[!] Creating a new instance ..."
echo.
oradim -new -sid %DB_Name% -syspwd %DB_Name% -startmode a -srvcstart s -spfile

set ORACLE_SID=%DB_Name%

sqlplus -S /nolog @"%oracle_base%\speed\creationDB.sql" %DB_Name% %pfile% %oracle_base%



